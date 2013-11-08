namespace TelerikHackaton.Ruler.Data
{
    using System;
    using System.Data.Entity;
    using TelerikHackaton.Ruler.Model;

    public class RulerDbContext : DbContext
    {
        public RulerDbContext()
            : base("RulerConnection")
        {

        }

        public DbSet<User> Users { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Condition> Conditions { get; set; }
    }
}
