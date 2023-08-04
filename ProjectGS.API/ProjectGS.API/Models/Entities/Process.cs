using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ProjectGS.API.Models.Entities
{
    [Index(nameof(Name),IsUnique = true)]
    public class Process
    {
        [Key]
        public long ProcessId { get; set; }

        public string Name{ get; set; }
        [JsonIgnore]
        public List<Department> Departmens { get; set; }

    }
}
