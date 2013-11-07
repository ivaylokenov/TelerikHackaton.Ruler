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

        DbSet<User> Users { get; set; }
    }
}
