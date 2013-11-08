namespace TelerikHackaton.Ruler.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Rule
    {
        public Rule()
        {
            this.Conditions = new HashSet<Condition>();
            this.Actions = new HashSet<ResultAction>();
        }

        [Key]
        public int Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<Condition> Conditions { get; set; }

        public virtual ICollection<ResultAction> Actions { get; set; }

        public int UserId { get; set; }

        public virtual User User { get; set; }
    }
}
