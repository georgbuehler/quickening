using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class SecurityType
    {
        public SecurityType()
        {
            Security = new HashSet<Security>();
        }

        public Guid SecurityTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool SystemRequired { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<Security> Security { get; set; }
    }
}
