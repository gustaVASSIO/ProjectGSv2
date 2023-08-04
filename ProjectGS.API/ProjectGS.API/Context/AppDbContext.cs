using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Models.Entities;

namespace ProjectGS.API.Context
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }
        public DbSet<Improvement> Improvements { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<IdeaSource> IdeaSources { get; set; }
        public DbSet<MajorBenefits> MajorBenefits { get; set; }
        public DbSet<SourceType> SourceTypes { get; set; }
        public DbSet<CostCenter> CostCenters { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<CurrentOrganization> CurrentOrganizations { get; set; }
        public DbSet<Process> Processes { get; set; }
        public DbSet<InfoFinantial> InfoFinantials { get; set; }

    }
}
