using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class Tag
    {
        public Tag()
        {
            TransactionRecordTag = new HashSet<TransactionRecordTag>();
        }

        public Guid TagId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? CopyNumber { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<TransactionRecordTag> TransactionRecordTag { get; set; }
    }
}
