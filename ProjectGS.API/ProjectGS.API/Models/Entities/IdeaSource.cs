using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ProjectGS.API.Models.Entities
{
    public class IdeaSource
    {
        public string IdeaSourceId { get; set; }
        public string Name { get; set; }
        public bool InternallySolvable { get; set; }
        [JsonIgnore]
        public List<Improvement> Improvements { get; set; } = new List<Improvement>();

        public IdeaSource()
        {
            IdeaSourceId = Guid.NewGuid().ToString();
        }
    }
}
