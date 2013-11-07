namespace TelerikHackaton.Ruler.Services.ResponseModels
{
    using System.Runtime.Serialization;

    [DataContract]
    public class UserResponseModel
    {
        [DataMember(Name = "displayName")]
        public string DisplayName { get; set; }

        [DataMember(Name = "sessionKey")]
        public string SessionKey { get; set; }
    }
}