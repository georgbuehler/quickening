using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class TransactionRecord
    {
        public TransactionRecord()
        {
            TransactionRecordTag = new HashSet<TransactionRecordTag>();
        }

        public Guid TransactionRecordId { get; set; }
        public Guid TransactionId { get; set; }
        public Guid CreditAccountId { get; set; }
        public Guid DebitAccountId { get; set; }
        public Guid TagId { get; set; }
        public decimal Amount { get; set; }
        public string Memo { get; set; }
        public double? Shares { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual Account CreditAccount { get; set; }
        public virtual Account DebitAccount { get; set; }
        public virtual TransactionHeader Transaction { get; set; }
        public virtual ICollection<TransactionRecordTag> TransactionRecordTag { get; set; }
    }
}
