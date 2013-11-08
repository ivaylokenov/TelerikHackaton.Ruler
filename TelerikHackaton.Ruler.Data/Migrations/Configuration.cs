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
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(RulerDbContext context)
        {
            this.SeedCategories(context);
            this.SeedConditionTypes(context);
        }

        private void SeedCategories(RulerDbContext context)
        {
            if (context.Categories.Any())
            {
                return;
            }

            var categories = new List<Category>()
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

        private void SeedConditionTypes(RulerDbContext context)
        {
            if (context.Conditions.Any())
            {
                return;
            }

            var conditions = new List<ConditionType>()
            {
                new ConditionType
                {
                    Name = "Is day of week",
                    Operator = "Equal",
                    Property = "DayOfWeek",
                    Category = CategoryType.Calendar,
                },
                new ConditionType
                {
                    Name = "Is day of month",
                    Operator = "Equal",
                    Property = "Day",
                    Category = CategoryType.Calendar,
                },
                new ConditionType
                {
                    Name = "Is month",
                    Operator = "Equal",
                    Property = "Month",
                    Category = CategoryType.Calendar,
                },
                new ConditionType
                {
                    Name = "Is year",
                    Operator = "Equal",
                    Property = "Year",
                    Category = CategoryType.Calendar,
                },
                new ConditionType
                {
                    Name = "Is less than hour",
                    Operator = "LessThan",
                    Property = "Hour",
                    Category = CategoryType.Calendar,
                },
                new ConditionType
                {
                    Name = "Is more than hour",
                    Operator = "GreaterThan",
                    Property = "Hour",
                    Category = CategoryType.Calendar,
                }
            };

            context.ConditionTypes.AddRange(conditions);
        }
    }
}
