using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class AssetClass
    {
        public AssetClass()
        {
            AssetClassAllocation = new HashSet<AssetClassAllocation>();
        }

        public Guid AssetClassId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool SystemRequired { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<AssetClassAllocation> AssetClassAllocation { get; set; }
    }
}
