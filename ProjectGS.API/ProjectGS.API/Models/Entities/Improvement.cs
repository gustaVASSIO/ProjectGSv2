using Microsoft.AspNetCore.Identity;

namespace ProjectGS.API.Models.Entities
{
    public class Improvement
    {
        public string ImprovementId { get; set; }
        public string Assignee { get; set; }
        public string UserId { get; set; }
        public IdentityUser User { get; set; }
        public string DepartmentId { get; set; }
        public Department Department { get; set; }
        public string Summary { get; set; }
        public string Description { get; set; }
        public string MajorBenefitsId { get; set; }
        public MajorBenefits MajorBenefits { get; set; }
        public int? EstimatedHours { get; set; }
        public double? EstimatedSaving { get; set; }
        public double? MonetaryBenefit { get; set; }
        public DateTime DueDate { get; set; }
        public string AffectEntities { get; set; }
        public string SourceTypeId { get; set; }
        public SourceType SourceType { get; set; }
        public string IdeaSourceId { get; set; }
        public IdeaSource IdeaSource { get; set; }
        public string Components { get; set; }
        public string Region { get; set; }
        public string CipPex { get; set; }
        public string Currency { get; set; }
        public string Priority { get; set; }
        public bool StatusImprovement { get; set; }

    }
}
