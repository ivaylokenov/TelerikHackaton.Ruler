namespace TelerikHackaton.Ruler.Data.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using TelerikHackaton.Ruler.Data;
    using TelerikHackaton.Ruler.Model;

    public sealed class Configuration : DbMigrationsConfiguration<RulerDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(RulerDbContext context)
        {
            this.SeedCategories(context);
        }

        private void SeedCategories(RulerDbContext context)
        {
            if (context.Categories.Any())
            {
                return;
            }

            List<Category> categories = new List<Category>()
            {
                new Category
                {
                    Name = "Calendar",
                },
                new Category
                {
                    Name = "Location"
                }
            };

            context.Categories.AddRange(categories);
        }
    }
}
