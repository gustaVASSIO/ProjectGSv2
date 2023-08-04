using AutoMapper.Configuration.Annotations;
using Microsoft.EntityFrameworkCore;
using ProjectGS.API.Context;
using ProjectGS.API.Models.Entities;
using ProjectGS.API.Repository.Interfaces;

namespace ProjectGS.API.Repository.Classes
{
    public class ImprovementRepository : Repository<Improvement>, IImproveRepository
    {
        private readonly AppDbContext _context;
        public ImprovementRepository(AppDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Improvement>> GetImprovesByUserId(string userId)
        {
            return await _context.Improvements
                .Include(x => x.MajorBenefits)
                .Include(x => x.SourceType)
                .Include(x => x.IdeaSource)
                .Include(x => x.Department)
                .Where(x => x.UserId == userId)
                .ToListAsync();
        }


    }
}
