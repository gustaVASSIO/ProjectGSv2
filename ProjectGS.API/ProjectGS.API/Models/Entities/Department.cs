using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ProjectGS.API.Models.Entities
{
    public class Department
    {
        public string DepartmentId { get; set; }
        public string Name { get; set; }
        public string CostCenterId { get; set; }
        public CostCenter CostCenter { get; set; }
        public long CurrentOrganizationId { get; set; }
        public CurrentOrganization CurrentOrganization { get; set; }
        public long ProcessId { get; set; }
        public Process Process { get; set; }

        [JsonIgnore]
        public List<Improvement> Improvements { get; set; } = new List<Improvement>();

        public Department()
        {
            DepartmentId =  Guid.NewGuid().ToString();
        }
    }
}
