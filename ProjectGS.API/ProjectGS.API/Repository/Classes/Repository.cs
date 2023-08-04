using ProjectGS.API.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Context;

namespace ProjectGS.API.Repository.Classes
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private AppDbContext context;

        public Repository(AppDbContext context)
        {
            this.context = context;
        }

        public IQueryable<T> Get()
        {
            return context.Set<T>().AsNoTracking();
        }

        public async Task<T> GetById(string id)
        {
            return await context.Set<T>().FindAsync(id);
        }

        public void Insert(T entity)
        {
            context.Set<T>().Add(entity);
        }

        public void Update(T entity)
        {
            context.Set<T>().Update(entity);
        }

        public void Delete(T entity)
        {
            context.Set<T>().Remove(entity);
        }

    }
}
