using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class AssetClassAllocation
    {
        public Guid AssetClassAllocationId { get; set; }
        public Guid SecurityId { get; set; }
        public Guid AssetClassId { get; set; }
        public decimal Allocation { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual AssetClass AssetClass { get; set; }
        public virtual Security Security { get; set; }
    }
}
