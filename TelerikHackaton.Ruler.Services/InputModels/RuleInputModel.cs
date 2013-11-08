namespace TelerikHackaton.Ruler.Services.InputModels
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    public class RuleInputModel
    {
        public string Name { get; set; }

        public ICollection<ConditionInputType> Conditions { get; set; }

        public ICollection<ActionInputType> Actions { get; set; }
    }
}