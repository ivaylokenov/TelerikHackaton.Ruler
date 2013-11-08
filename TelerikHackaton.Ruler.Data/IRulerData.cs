namespace TelerikHackaton.Ruler.Data
{
    using TelerikHackaton.Ruler.Model;

    public interface IRulerData
    {
        IRepository<User> Users { get; }

        IRepository<Category> Categories { get; }

        int SaveChanges();
    }
}
