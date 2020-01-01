using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class TransactionHeader
    {
        public TransactionHeader()
        {
            TransactionRecord = new HashSet<TransactionRecord>();
        }

        public Guid TransactionId { get; set; }
        public DateTime TransactionDate { get; set; }
        public string TransactionNumber { get; set; }
        public string Payee { get; set; }
        public string Memo { get; set; }
        public string Reconciled { get; set; }
        public DateTime PostedDate { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<TransactionRecord> TransactionRecord { get; set; }
    }
}
