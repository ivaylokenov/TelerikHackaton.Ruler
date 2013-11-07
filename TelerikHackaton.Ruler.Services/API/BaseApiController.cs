namespace TelerikHackaton.Ruler.Services.API
{
    using System;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;
    using TelerikHackaton.Ruler.Data;

    public class BaseApiController : ApiController
    {
        public BaseApiController()
        {
            this.Data = new RulerData();
        }

        protected RulerData Data { get; set; }

        protected T PerformOperationAndHandleExceptions<T>(Func<T> operation)
        {
            try
            {
                return operation();
            }
            catch (Exception ex)
            {
                var errResponse = this.Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex.Message);
                throw new HttpResponseException(errResponse);
            }
        }
    }
}
