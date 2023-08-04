using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectGS.API.Repository.Interfaces
{
    public interface IRepository<T>
    {
        IQueryable<T> Get();
        Task<T> GetById(string id);
        void Insert(T entity);
        void Update(T entity);
        void Delete(T entity);
    }
}
