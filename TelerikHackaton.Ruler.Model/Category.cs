namespace TelerikHackaton.Ruler.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Category
    {
        public Category()
        {
            this.Conditions = new HashSet<Condition>();
        }

        [Key]
        public int Id { get; set; }

        // [MinLength(6)]
        // [MaxLength(30)]
        // [Required]
        public string Name { get; set; }

        public virtual ICollection<Condition> Conditions { get; set; }
    }
}
