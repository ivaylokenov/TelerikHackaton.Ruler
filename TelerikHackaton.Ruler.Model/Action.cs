namespace TelerikHackaton.Ruler.Model
{
    using System.ComponentModel.DataAnnotations;

    public class ResultAction
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }

        public int RuleId { get; set; }

        public virtual Rule Rule { get; set; }
    }
}
