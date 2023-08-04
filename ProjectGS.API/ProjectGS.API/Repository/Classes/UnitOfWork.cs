using ProjectGS.API.Context;
using ProjectGS.API.Repository.Interfaces;


namespace ProjectGS.API.Repository.Classes
{
    public class UnitOfWork : IUnitOfWork
    {
        protected AppDbContext context;
        private DepartmentRepository departmentRepo;
        private ImprovementRepository improvementRepo;
        private IdeaSourceRepository ideaSourceRepository;
        private MajorBenefitsRepository majorBenefitsRepository;
        private SourceTypeRepository sourceTypeRepository;
        private CosCenterRepository costCenterRepo;
        private InfoFinantilaRepository infoFinantialRepo;

        public UnitOfWork(AppDbContext context)
        {
            this.context = context;
        }

        public IDepartmentRepository DepartmentRepository
        {
            get => departmentRepo = departmentRepo ?? new DepartmentRepository(context);
        }
        public IImproveRepository ImproveRepository
        {
            get => improvementRepo = improvementRepo ?? new ImprovementRepository(context);
        }
        public IIdeaSourceRepository IdeaSourceRepository
        {
            get => ideaSourceRepository = ideaSourceRepository ?? new IdeaSourceRepository(context);
        }
        public IMajorBenefitsRepository MajorBenefitsRepository
        {
            get => majorBenefitsRepository = majorBenefitsRepository ?? new MajorBenefitsRepository(context);
        } 
        public ISourceTypeRepository SourceTypeRepository
        {
            get => sourceTypeRepository = sourceTypeRepository ?? new SourceTypeRepository(context);
        }

        public ICostCenterRepository CostCenterRepository
        {
            get => costCenterRepo = costCenterRepo ?? new CosCenterRepository(context);
        }
        public IInfoFinantialRepository InfoFinantialRepository
        {
            get => infoFinantialRepo = infoFinantialRepo ?? new InfoFinantilaRepository(context);
        }

        public async Task Commit()
        {
            await context.SaveChangesAsync();
        }

        public void Dispose()
        {
            context.Dispose();
        }
    }
}
