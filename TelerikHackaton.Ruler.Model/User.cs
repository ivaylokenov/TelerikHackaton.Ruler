namespace TelerikHackaton.Ruler.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class User
    {
        public User()
        {
            this.Rules = new HashSet<Rule>();
        }

        [Key]
        public int Id { get; set; }

        // [MinLength(6)]
        // [MaxLength(30)]
        [Required]
        public string Username { get; set; }

        // [MinLength(6)]
        // [MaxLength(30)]
        // [Required]
        // public string DisplayName { get; set; }

        [Required]
        public string AuthCode { get; set; }

        public string SessionKey { get; set; }

        public virtual ICollection<Rule> Rules { get; set; }
    }
}
