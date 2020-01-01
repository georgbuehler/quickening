using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class InvestingGoal
    {
        public InvestingGoal()
        {
            Security = new HashSet<Security>();
        }

        public Guid InvestingGoalId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual ICollection<Security> Security { get; set; }
    }
}
