using System;
using System.Collections.Generic;

namespace QuickeningAPI.Models
{
    public partial class Account
    {
        public Account()
        {
            InverseParentAccount = new HashSet<Account>();
            TransactionRecordCreditAccount = new HashSet<TransactionRecord>();
            TransactionRecordDebitAccount = new HashSet<TransactionRecord>();
        }

        public Guid AccountId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Guid AccountTypeId { get; set; }
        public bool TaxDeferred { get; set; }
        public decimal? InterestRate { get; set; }
        public string FinancialInstitution { get; set; }
        public string RoutingNumber { get; set; }
        public string CustomerId { get; set; }
        public string ContactName { get; set; }
        public string Phone { get; set; }
        public string HomePage { get; set; }
        public string Comments { get; set; }
        public bool? SeparateAccount { get; set; }
        public bool? HideAccountInList { get; set; }
        public bool? HideAccountInTransactions { get; set; }
        public Guid AccountGroupId { get; set; }
        public Guid? ParentAccountId { get; set; }
        public Guid? SecurityId { get; set; }
        public Guid? TaxLineItemId { get; set; }
        public DateTime EnteredDateTime { get; set; }
        public DateTime LastModifiedDateTime { get; set; }

        public virtual AccountGroup AccountGroup { get; set; }
        public virtual AccountType AccountType { get; set; }
        public virtual Account ParentAccount { get; set; }
        public virtual Security Security { get; set; }
        public virtual TaxLineItem TaxLineItem { get; set; }
        public virtual ICollection<Account> InverseParentAccount { get; set; }
        public virtual ICollection<TransactionRecord> TransactionRecordCreditAccount { get; set; }
        public virtual ICollection<TransactionRecord> TransactionRecordDebitAccount { get; set; }
    }
}
