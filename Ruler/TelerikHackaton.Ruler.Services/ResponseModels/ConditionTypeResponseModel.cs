namespace TelerikHackaton.Ruler.Services.ResponseModels
{
    using System;
    using System.Linq.Expressions;
    using System.Runtime.Serialization;
    using TelerikHackaton.Ruler.Model;

    [DataContract]
    public class ConditionTypeResponseModel
    {
        public static Expression<Func<ConditionType, ConditionTypeResponseModel>> FromConditionType
        {
            get
            {
                return con => new ConditionTypeResponseModel
                {
                    Id = con.Id,
                    Name = con.Name
                };
            }
        }

        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }
    }
}