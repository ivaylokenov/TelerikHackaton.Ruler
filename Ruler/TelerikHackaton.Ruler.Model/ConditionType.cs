namespace TelerikHackaton.Ruler.Model
{
    using System.ComponentModel.DataAnnotations;

    public class ConditionType
    {
        [Key]
        public int Id { get; set; }

        public CategoryType Category { get; set; }

        public string Name { get; set; }

        public string Property { get; set; }

        public string Operator { get; set; }
    }
}
