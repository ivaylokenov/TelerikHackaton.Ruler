namespace TelerikHackaton.Ruler.Services.ResponseModels
{
    using System;
    using System.Linq.Expressions;
    using System.Runtime.Serialization;
    using TelerikHackaton.Ruler.Model;

    [DataContract]
    public class CategoryResponseModel
    {
        public static Expression<Func<Category, CategoryResponseModel>> FromCategory
        {
            get
            {
                return cat => new CategoryResponseModel
                {
                    Id = cat.Id,
                    Name = cat.Name
                };
            }
        }

        [DataMember(Name = "id")]
        public int Id { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }
    }
}