namespace TelerikHackaton.Ruler.Services.ResponseModels
{
    using System;
    using System.Linq.Expressions;
    using System.Runtime.Serialization;
    using TelerikHackaton.Ruler.Model;

    [DataContract]
    public class UserResponseModel
    {
        public static Expression<Func<User, UserResponseModel>> FromUser
        {
            get
            {
                return user => new UserResponseModel
                {
                    SessionKey = user.SessionKey
                };
            }
        }

        [DataMember(Name = "sessionKey")]
        public string SessionKey { get; set; }
    }
}