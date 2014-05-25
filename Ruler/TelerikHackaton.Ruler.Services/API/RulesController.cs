namespace TelerikHackaton.Ruler.Services.API
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;
    using System.Web.Http.ValueProviders;
    using TelerikHackaton.Ruler.Model;
    using TelerikHackaton.Ruler.Services.Attributes;
    using TelerikHackaton.Ruler.Services.InputModels;

    public class RulesController : BaseApiController
    {
        [HttpGet]
        [ActionName("id")]
        public HttpResponseMessage ById([ValueProvider(typeof(HeaderValueProviderFactory<string>))] string sessionKey, int id)
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

                    var selectedRule = this.Data.Rules
                        .All()
                        .FirstOrDefault(rule => rule.Id == id);

                    if (selectedRule == null)
                    {
                        throw new ArgumentNullException("Rule does not exist");
                    }

                    var response = this.Request.CreateResponse(HttpStatusCode.OK, selectedRule);
                    return response;
                });

            return responseMessage;
        }

        [HttpGet]
        [ActionName("byuser")]
        public HttpResponseMessage ByUser([ValueProvider(typeof(HeaderValueProviderFactory<string>))] string sessionKey)
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

                    var rules = this.Data.Rules
                        .All()
                        .Where(rule => rule.UserId == user.Id);

                    var response = this.Request.CreateResponse(HttpStatusCode.OK, rules);
                    return response;
                });

            return responseMessage;
        }

        [HttpPost]
        [ActionName("create")]
        public HttpResponseMessage Create([ValueProvider(typeof(HeaderValueProviderFactory<string>))] string sessionKey, RuleInputModel rule)
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

                    var newRule = new Rule
                    {
                        Name = rule.Name,
                        User = user,
                        Conditions = rule.Conditions.Select(con => new Condition { ConditionTypeId = con.Id, Value = con.Value }).ToList(),
                        Actions = rule.Actions.Select(act => new ResultAction { Id = act.Id }).AsQueryable().ToList()
                    };

                    this.Data.Rules.Add(newRule);
                    this.Data.SaveChanges();

                    var response = this.Request.CreateResponse(HttpStatusCode.OK);
                    return response;
                });

            return responseMessage;
        }
    }
}
