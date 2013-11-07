using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TelerikHackaton.Ruler.Model;

namespace TelerikHackaton.Ruler.Data
{
    public class RulerData : IRulerData
    {
        private readonly RulerDbContext context;
        private readonly Dictionary<Type, object> repositories = new Dictionary<Type, object>();

        public RulerData()
            : this(new RulerDbContext())
        {
        }

        public RulerData(RulerDbContext context)
        {
            this.context = context;
        }

        private IRepository<T> GetRepository<T>() where T : class
        {
            if (!this.repositories.ContainsKey(typeof(T)))
            {
                var type = typeof(GenericRepository<T>);

                this.repositories.Add(typeof(T), Activator.CreateInstance(type, this.context));
            }

            return (IRepository<T>)this.repositories[typeof(T)];
        }

        public int SaveChanges()
        {
            return this.context.SaveChanges();
        }

        public void Dispose()
        {
            this.context.Dispose();
        }

        public IRepository<User> Users
        {
            get { return this.GetRepository<User>(); }
        }
    }
}
