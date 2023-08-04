using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectGS.API.Repository.Interfaces
{
    public interface IUnitOfWork
    {
        IDepartmentRepository DepartmentRepository { get; }
        IImproveRepository ImproveRepository { get; }
        IIdeaSourceRepository IdeaSourceRepository { get; }
        IMajorBenefitsRepository MajorBenefitsRepository { get; }
        ISourceTypeRepository SourceTypeRepository { get; }
        ICostCenterRepository CostCenterRepository { get; }
        IInfoFinantialRepository InfoFinantialRepository { get; }
        Task Commit();
        void Dispose();
    }
}
