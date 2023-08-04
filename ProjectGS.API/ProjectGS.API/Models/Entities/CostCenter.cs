
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ProjectGS.API.Models.Entities
{
    [Index(nameof(Code), IsUnique =true)]
    public class CostCenter
    {

        public string CostCenterId { get; set; }
        public string Code { get; set; }

        [JsonIgnore]
        public List<Department> Department { get; set; } = new List<Department>();
        public CostCenter()
        {
            CostCenterId = Guid.NewGuid().ToString();
        }

    }
}
