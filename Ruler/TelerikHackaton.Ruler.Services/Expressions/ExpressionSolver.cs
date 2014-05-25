namespace TelerikHackaton.Ruler.Services.Expressions
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading;
    using TelerikHackaton.Ruler.Data;
    using TelerikHackaton.Ruler.Executor;
    using TelerikHackaton.Ruler.Model;
    using TelerikHackaton.Ruler.Services.PushService;

    public static class ExpressionSolver
    {
        private static RulerData data = new RulerData();
        private static PushNotifier pushNotifier = PushNotifier.GetInstance();

        public static void Start()
        {
            var timer = new Timer((e) => { ProcessActions(); }, null, 0, (int)TimeSpan.FromMinutes(15).TotalMilliseconds);
        }

        private static void ProcessActions()
        {
            var users = data.Users.All().Where(u => u.Rules.Any() && !string.IsNullOrEmpty(u.SessionKey));

            foreach (var user in users)
            {
                var rules = user.Rules;

                foreach (var rule in rules)
                {
                    if (rule.Conditions.All(con => ResolveCondition(con)))
                    {
                        rule.Actions.All((act) => { pushNotifier.Push(act.Id.ToString(), user.Username); return true; });
                    }
                }
            }
        }

        private static bool ResolveCondition(Condition condition)
        {
            switch (condition.ConditionType.Category)
            {
                case CategoryType.Calendar:
                    var executedRule = RuleExecutor.CompileRule<DateTime>(condition);
                    return executedRule(DateTime.Now);
                    break;
                case CategoryType.Location:
                    throw new NotImplementedException();
                    break;
                case CategoryType.Meetup:
                    throw new NotImplementedException();
                    break;
                default:
                    throw new NotImplementedException();
                    break;
            }
        }
    }
}
