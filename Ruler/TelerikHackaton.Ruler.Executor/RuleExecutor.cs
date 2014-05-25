namespace TelerikHackaton.Ruler.Executor
{
    using System;
    using System.Linq.Expressions;
    using TelerikHackaton.Ruler.Model;

    public static class RuleExecutor
    {
        public static Func<T, bool> CompileRule<T>(Condition condition)
        {
            var calendar = Expression.Parameter(typeof(T));
            Expression expr = BuildExpr<T>(condition, calendar);

            // build a lambda function User->bool and compile it
            return Expression.Lambda<Func<T, bool>>(expr, calendar).Compile();
        }

        public static Expression BuildExpr<T>(Condition condition, ParameterExpression parameter)
        {
            var leftOperand = MemberExpression.Property(parameter, condition.Property);
            var property = typeof(T).GetProperty(condition.Property).PropertyType;

            ExpressionType invokingOperator;

            // is the operator a known .NET operator?
            if (ExpressionType.TryParse(condition.Operator, out invokingOperator))
            {
                var rightOperand = Expression.Constant(Convert.ChangeType(condition.Value, property));
                return Expression.MakeBinary(invokingOperator, leftOperand, rightOperand); // use a binary operation, e.g. 'Equal' -> 'u.Age == 15'
            }
            else
            {
                var methodToInvoke = property.GetMethod(condition.Operator);
                var parameterType = methodToInvoke.GetParameters()[0].ParameterType;
                var rightOperand = Expression.Constant(Convert.ChangeType(condition.Value, parameterType));
                return Expression.Call(leftOperand, methodToInvoke, rightOperand); // use a method call, e.g. 'Contains' -> 'u.Tags.Contains(some_tag)'
            }
        }
    }
}
