namespace TelerikHackaton.Ruler.Services
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.Http;
    using System.Web.Http.Cors;

    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            EnableCorsAttribute cors = new EnableCorsAttribute("*", "*", "*");

            config.EnableCors(cors);

            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "RulesApi",
                routeTemplate: "api/rules/{action}/{id}",
                defaults: new
                {
                    controller = "rules"
                }
            );

            config.Routes.MapHttpRoute(
                name: "ConditionsApi",
                routeTemplate: "api/conditions/{action}",
                defaults: new
                {
                    controller = "conditions"
                }
            );

            config.Routes.MapHttpRoute(
                name: "CategoriesApi",
                routeTemplate: "api/categories/{action}",
                defaults: new
                {
                    controller = "categories"
                }
            );

            config.Routes.MapHttpRoute(
                name: "UsersApi",
                routeTemplate: "api/users/{action}",
                defaults: new
                {
                    controller = "users"
                }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
