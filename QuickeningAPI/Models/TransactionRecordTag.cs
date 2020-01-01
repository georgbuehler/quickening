using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class TransactionRecordTag
    {
        public Guid TransactionTagId { get; set; }
        public Guid TransactionRecordId { get; set; }
        public Guid TagId { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual Tag Tag { get; set; }
        public virtual TransactionRecord TransactionRecord { get; set; }
    }
}
