using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class AccountGroup
    {
        public AccountGroup()
        {
            Account = new HashSet<Account>();
        }

        public Guid AccountGroupId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool SystemRequired { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<Account> Account { get; set; }
    }
}
