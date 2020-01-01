using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class TaxLineItem
    {
        public TaxLineItem()
        {
            Account = new HashSet<Account>();
        }

        public Guid TaxLineItemId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<Account> Account { get; set; }
    }
}
