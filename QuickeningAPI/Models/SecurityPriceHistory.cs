using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class SecurityPriceHistory
    {
        public Guid SecurityPriceHistoryId { get; set; }
        public DateTime PriceDateTime { get; set; }
        public Guid SecurityId { get; set; }
        public decimal Price { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual Security Security { get; set; }
    }
}
