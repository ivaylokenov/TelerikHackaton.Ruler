namespace TelerikHackaton.Ruler.Model
{
    using System.ComponentModel.DataAnnotations;

    public class Condition
    {
        [Key]
        public int Id { get; set; }

        public int ConditionTypeId { get; set; }

        public ConditionType ConditionType { get; set; }

        // [Required]
        // [MinLength(6)]
        // [MaxLength(30)]
        public string Name 
        {
            get
            {
                return this.ConditionType.Name;
            }
        }

        // [Required]
        // [MinLength(1)]
        public string Property
        {
            get
            {
                return this.ConditionType.Property;
            }
        }

        // [Required]
        // [MinLength(1)]
        public string Operator
        {
            get
            {
                return this.ConditionType.Operator;
            }
        }

        // [Required]
        // [MinLength(1)]
        public string Value { get; set; }

        public int RuleId { get; set; }

        public virtual Rule Rule { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
    }
}
