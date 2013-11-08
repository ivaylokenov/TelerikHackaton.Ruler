namespace TelerikHackaton.Ruler.Data
{
    using TelerikHackaton.Ruler.Model;

    public interface IRulerData
    {
        IRepository<User> Users { get; }

        IRepository<Category> Categories { get; }

        IRepository<Condition> Conditions { get; }

        IRepository<ConditionType> ConditionTypes { get; }

        IRepository<ResultAction> Actions { get; }

        IRepository<Rule> Rules { get; }

        int SaveChanges();
    }
}
