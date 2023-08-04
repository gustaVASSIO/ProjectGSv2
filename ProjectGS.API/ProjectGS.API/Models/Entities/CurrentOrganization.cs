using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ProjectGS.API.Models.Entities
{
    [Index(nameof(Name), IsUnique = true)]
    public class CurrentOrganization
    {
        [Key]
        public long CurrentOrganizationId { get; set; }
        public string Name { get; set; }
        [JsonIgnore]
        public List<Department> Departmens { get; set; }
    }
}
