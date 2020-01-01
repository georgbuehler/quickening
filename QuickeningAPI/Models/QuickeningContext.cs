using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace QuickeningAPI.Models
{
    public partial class QuickeningContext : DbContext
    {
        public QuickeningContext()
        {
        }

        public QuickeningContext(DbContextOptions<QuickeningContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Account { get; set; }
        public virtual DbSet<AccountGroup> AccountGroup { get; set; }
        public virtual DbSet<AccountType> AccountType { get; set; }
        public virtual DbSet<AssetClass> AssetClass { get; set; }
        public virtual DbSet<AssetClassAllocation> AssetClassAllocation { get; set; }
        public virtual DbSet<InvestingGoal> InvestingGoal { get; set; }
        public virtual DbSet<Security> Security { get; set; }
        public virtual DbSet<SecurityPriceHistory> SecurityPriceHistory { get; set; }
        public virtual DbSet<SecurityType> SecurityType { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<TaxLineItem> TaxLineItem { get; set; }
        public virtual DbSet<TransactionHeader> TransactionHeader { get; set; }
        public virtual DbSet<TransactionRecord> TransactionRecord { get; set; }
        public virtual DbSet<TransactionRecordTag> TransactionRecordTag { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=BELERIAND\\SQLEXPRESS;Database=Quickening;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.Property(e => e.AccountId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Comments).HasMaxLength(500);

                entity.Property(e => e.ContactName).HasMaxLength(100);

                entity.Property(e => e.CustomerId).HasMaxLength(50);

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.FinancialInstitution).HasMaxLength(100);

                entity.Property(e => e.HideAccountInList).HasDefaultValueSql("((0))");

                entity.Property(e => e.HideAccountInTransactions).HasDefaultValueSql("((0))");

                entity.Property(e => e.HomePage).HasMaxLength(200);

                entity.Property(e => e.InterestRate).HasColumnType("decimal(16, 2)");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Phone).HasMaxLength(20);

                entity.Property(e => e.RoutingNumber).HasMaxLength(10);

                entity.Property(e => e.SeparateAccount).HasDefaultValueSql("((0))");

                entity.HasOne(d => d.AccountGroup)
                    .WithMany(p => p.Account)
                    .HasForeignKey(d => d.AccountGroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Account_AccountGroup");

                entity.HasOne(d => d.AccountType)
                    .WithMany(p => p.Account)
                    .HasForeignKey(d => d.AccountTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Account_AccountType");

                entity.HasOne(d => d.ParentAccount)
                    .WithMany(p => p.InverseParentAccount)
                    .HasForeignKey(d => d.ParentAccountId)
                    .HasConstraintName("FK_Account_Account");

                entity.HasOne(d => d.Security)
                    .WithMany(p => p.Account)
                    .HasForeignKey(d => d.SecurityId)
                    .HasConstraintName("FK_Account_Security");

                entity.HasOne(d => d.TaxLineItem)
                    .WithMany(p => p.Account)
                    .HasForeignKey(d => d.TaxLineItemId)
                    .HasConstraintName("FK_Account_TaxLineItem");
            });

            modelBuilder.Entity<AccountGroup>(entity =>
            {
                entity.Property(e => e.AccountGroupId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<AccountType>(entity =>
            {
                entity.Property(e => e.AccountTypeId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.SystemRequired).HasDefaultValueSql("((0))");
            });

            modelBuilder.Entity<AssetClass>(entity =>
            {
                entity.Property(e => e.AssetClassId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<AssetClassAllocation>(entity =>
            {
                entity.Property(e => e.AssetClassAllocationId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Allocation).HasColumnType("decimal(16, 2)");

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.AssetClass)
                    .WithMany(p => p.AssetClassAllocation)
                    .HasForeignKey(d => d.AssetClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssetClassAllocation_AssetClass");

                entity.HasOne(d => d.Security)
                    .WithMany(p => p.AssetClassAllocation)
                    .HasForeignKey(d => d.SecurityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AssetClassAllocation_Security");
            });

            modelBuilder.Entity<InvestingGoal>(entity =>
            {
                entity.Property(e => e.InvestingGoalId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Security>(entity =>
            {
                entity.Property(e => e.SecurityId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Broker).HasMaxLength(50);

                entity.Property(e => e.Comments).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Phone).HasMaxLength(20);

                entity.Property(e => e.Symbol).HasMaxLength(10);

                entity.Property(e => e.UseAverageCost)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.HasOne(d => d.InvestingGoal)
                    .WithMany(p => p.Security)
                    .HasForeignKey(d => d.InvestingGoalId)
                    .HasConstraintName("FK_Security_InvestingGoal");

                entity.HasOne(d => d.SecurityType)
                    .WithMany(p => p.Security)
                    .HasForeignKey(d => d.SecurityTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Security_SecurityType");
            });

            modelBuilder.Entity<SecurityPriceHistory>(entity =>
            {
                entity.Property(e => e.SecurityPriceHistoryId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.PriceDateTime).HasColumnType("datetime");

                entity.HasOne(d => d.Security)
                    .WithMany(p => p.SecurityPriceHistory)
                    .HasForeignKey(d => d.SecurityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SecurityPriceHistory_Security");
            });

            modelBuilder.Entity<SecurityType>(entity =>
            {
                entity.Property(e => e.SecurityTypeId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.Property(e => e.TagId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TaxLineItem>(entity =>
            {
                entity.Property(e => e.TaxLineItemId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<TransactionHeader>(entity =>
            {
                entity.HasKey(e => e.TransactionId);

                entity.Property(e => e.TransactionId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Memo).HasMaxLength(100);

                entity.Property(e => e.Payee)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.PostedDate)
                    .HasColumnType("date")
                    .HasDefaultValueSql("(CONVERT([date],getdate()))");

                entity.Property(e => e.Reconciled).HasMaxLength(1);

                entity.Property(e => e.TransactionDate).HasColumnType("date");

                entity.Property(e => e.TransactionNumber).HasMaxLength(50);
            });

            modelBuilder.Entity<TransactionRecord>(entity =>
            {
                entity.Property(e => e.TransactionRecordId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Amount).HasColumnType("money");

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Memo).HasMaxLength(500);

                entity.HasOne(d => d.CreditAccount)
                    .WithMany(p => p.TransactionRecordCreditAccount)
                    .HasForeignKey(d => d.CreditAccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransactionRecord_CreditAccount");

                entity.HasOne(d => d.DebitAccount)
                    .WithMany(p => p.TransactionRecordDebitAccount)
                    .HasForeignKey(d => d.DebitAccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransactionRecord_DebitAccount");

                entity.HasOne(d => d.Transaction)
                    .WithMany(p => p.TransactionRecord)
                    .HasForeignKey(d => d.TransactionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransactionRecord_TransactionHeader");
            });

            modelBuilder.Entity<TransactionRecordTag>(entity =>
            {
                entity.HasKey(e => e.TransactionTagId);

                entity.Property(e => e.TransactionTagId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.EnteredDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastModifiedDateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Tag)
                    .WithMany(p => p.TransactionRecordTag)
                    .HasForeignKey(d => d.TagId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransactionRecordTag_Tag");

                entity.HasOne(d => d.TransactionRecord)
                    .WithMany(p => p.TransactionRecordTag)
                    .HasForeignKey(d => d.TransactionRecordId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransactionRecordTag_TransactionRecord");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
