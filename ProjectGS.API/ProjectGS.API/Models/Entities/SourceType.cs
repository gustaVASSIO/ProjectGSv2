using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ProjectGS.API.Models.Entities
{
    public class SourceType
    {
        public string SourceTypeId { get; set; }
        public string Name { get; set; }

        [JsonIgnore]
        public List<Improvement> Improvements { get; set; } = new List<Improvement>();

        public SourceType()
        {
            SourceTypeId = Guid.NewGuid().ToString();
        }
    }
}
