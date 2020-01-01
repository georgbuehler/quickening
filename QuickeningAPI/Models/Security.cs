using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class Security
    {
        public Security()
        {
            Account = new HashSet<Account>();
            AssetClassAllocation = new HashSet<AssetClassAllocation>();
            SecurityPriceHistory = new HashSet<SecurityPriceHistory>();
        }

        public Guid SecurityId { get; set; }
        public string Name { get; set; }
        public string Symbol { get; set; }
        public Guid SecurityTypeId { get; set; }
        public bool DownloadQuotes { get; set; }
        public bool WatchList { get; set; }
        public bool Hide { get; set; }
        public bool TaxFree { get; set; }
        public bool? UseAverageCost { get; set; }
        public Guid? InvestingGoalId { get; set; }
        public string Broker { get; set; }
        public string Phone { get; set; }
        public int? Rating { get; set; }
        public string Comments { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual InvestingGoal InvestingGoal { get; set; }
        public virtual SecurityType SecurityType { get; set; }
        public virtual ICollection<Account> Account { get; set; }
        public virtual ICollection<AssetClassAllocation> AssetClassAllocation { get; set; }
        public virtual ICollection<SecurityPriceHistory> SecurityPriceHistory { get; set; }
    }
}
