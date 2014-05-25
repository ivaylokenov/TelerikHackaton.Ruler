namespace TelerikHackaton.Ruler.Services.API
{
    using System;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Text;
    using System.Web.Http;
    using System.Web.Http.ValueProviders;
    using TelerikHackaton.Ruler.Model;
    using TelerikHackaton.Ruler.Services.Attributes;
    using TelerikHackaton.Ruler.Services.InputModels;
    using TelerikHackaton.Ruler.Services.ResponseModels;

    public class UsersController : BaseApiController
    {
        private const int MinUsernameLength = 6;
        private const int MaxUsernameLength = 30;
        private const string ValidUsernameCharacters = "qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM1234567890_.";

        private const string SessionKeyChars = "qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM";
        private static readonly Random rand = new Random();

        private const int SessionKeyLength = 50;
        private const int Sha1Length = 40;

        [HttpPost]
        [ActionName("register")]
        public HttpResponseMessage Register(UserInputModel model)
        {
            var responseMsg = this.PerformOperationAndHandleExceptions(
                () =>
                {
                    // this.ValidateUsername(model.Username);
                    // this.ValidateNickname(model.DisplayName);
                    // this.ValidateAuthCode(model.AuthCode);

                    var usernameToLower = model.Username.ToLower();
                    var user = this.Data.Users.All().FirstOrDefault(
                        usr => usr.Username == usernameToLower);

                    if (user != null)
                    {
                        throw new InvalidOperationException("Users exists");
                    }

                    user = new User()
                    {
                        Username = usernameToLower,
                        AuthCode = model.AuthCode
                    };

                    this.Data.Users.Add(user);
                    this.Data.SaveChanges();

                    user.SessionKey = this.GenerateSessionKey(user.Id);
                    this.Data.SaveChanges();

                    var loggedUserModel = new UserResponseModel()
                    {
                        SessionKey = user.SessionKey
                    };

                    var response = this.Request.CreateResponse(HttpStatusCode.Created, loggedUserModel);
                    return response;
                });

            return responseMsg;
        }

        [HttpPost]
        [ActionName("login")]
        public HttpResponseMessage Login(UserInputModel model)
        {
            var responseMsg = this.PerformOperationAndHandleExceptions(
              () =>
              {
                  // this.ValidateUsername(model.Username);
                  // this.ValidateAuthCode(model.AuthCode);
                  var usernameToLower = model.Username.ToLower();
                  var user = this.Data.Users.All().FirstOrDefault(
                      usr => usr.Username == usernameToLower
                      && usr.AuthCode == model.AuthCode);

                  if (user == null)
                  {
                      throw new InvalidOperationException("Invalid username or password");
                  }

                  if (user.SessionKey == null)
                  {
                      user.SessionKey = this.GenerateSessionKey(user.Id);
                      this.Data.SaveChanges();
                  }

                  var loggedUserModel = new UserResponseModel()
                  {
                      SessionKey = user.SessionKey
                  };

                  var response = this.Request.CreateResponse(HttpStatusCode.Created, loggedUserModel);
                  return response;
              });

            return responseMsg;
        }

        [HttpPost]
        [ActionName("logout")]
        public HttpResponseMessage Logout([ValueProvider(typeof(HeaderValueProviderFactory<string>))] string sessionKey)
        {
            var responseMsg = this.PerformOperationAndHandleExceptions(
              () =>
              {
                  var user = this.Data.Users.All().FirstOrDefault(x => x.SessionKey == sessionKey);

                  user.SessionKey = null;
                  this.Data.SaveChanges();

                  var response = this.Request.CreateResponse(HttpStatusCode.OK);
                  return response;
              });

            return responseMsg;
        }

        private string GenerateSessionKey(int userId)
        {
            StringBuilder skeyBuilder = new StringBuilder(SessionKeyLength);
            skeyBuilder.Append(userId);
            while (skeyBuilder.Length < SessionKeyLength)
            {
                var index = rand.Next(SessionKeyChars.Length);
                skeyBuilder.Append(SessionKeyChars[index]);
            }
            return skeyBuilder.ToString();
        }

        private void ValidateAuthCode(string authCode)
        {
            if (authCode == null || authCode.Length != Sha1Length)
            {
                throw new ArgumentOutOfRangeException("Password should be encrypted");
            }
        }

        private void ValidateUsername(string username)
        {
            if (username == null)
            {
                throw new ArgumentNullException("Username cannot be null");
            }
            else if (username.Length < MinUsernameLength)
            {
                throw new ArgumentOutOfRangeException(
                    string.Format("Username must be at least {0} characters long",
                    MinUsernameLength));
            }
            else if (username.Length > MaxUsernameLength)
            {
                throw new ArgumentOutOfRangeException(
                    string.Format("Username must be less than {0} characters long",
                    MaxUsernameLength));
            }
            else if (username.Any(ch => !ValidUsernameCharacters.Contains(ch)))
            {
                throw new ArgumentOutOfRangeException(
                    "Username must contain only Latin letters, digits .,_");
            }
        }
    }
}
