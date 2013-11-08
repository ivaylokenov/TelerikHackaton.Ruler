namespace TelerikHackaton.Ruler.Services.API
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using TelerikHackaton.Ruler.Executor;
    using TelerikHackaton.Ruler.Model;

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            var condition = new Condition
            {
                Property = "Month",
                Operator = "GreaterThan",
                Value = "10"
            };

            Func<DateTime, bool> compiledCondition = RuleExecutor.CompileRule<DateTime>(condition);

            ViewBag.IsOk = compiledCondition(DateTime.Now);

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}