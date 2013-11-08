namespace TelerikHackaton.Ruler.Services.API
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;
    using System.Web.Http.ValueProviders;
    using TelerikHackaton.Ruler.Services.Attributes;
    using TelerikHackaton.Ruler.Services.ResponseModels;

    public class CategoriesController : BaseApiController
    {
        [HttpGet]
        [ActionName("all")]
        public HttpResponseMessage All([ValueProvider(typeof(HeaderValueProviderFactory<string>))] string sessionKey)
        {
            var responseMessage = this.PerformOperationAndHandleExceptions(
                () =>
                {
                    var user = this.Data.Users
                        .All()
                        .FirstOrDefault(u => u.SessionKey == sessionKey);

                    // if (user == null)
                    // {
                    //     throw new InvalidOperationException("Invalid username");
                    // }

                    var categories = this.Data.Categories
                        .All()
                        .OrderBy(cat => cat.Name)
                        .Select(CategoryResponseModel.FromCategory);

                    var response = this.Request.CreateResponse(HttpStatusCode.OK, categories);
                    return response;
                });

            return responseMessage;
        }
    }
}
