namespace QuickeningDataLoader
{
    partial class Import
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ofdSelectDataFile = new System.Windows.Forms.OpenFileDialog();
            this.txtFilePath = new System.Windows.Forms.TextBox();
            this.lblFilePath = new System.Windows.Forms.Label();
            this.cmdSelectFile = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtFilePreview = new System.Windows.Forms.TextBox();
            this.cmdImportData = new System.Windows.Forms.Button();
            this.lblStatus = new System.Windows.Forms.Label();
            this.txtStatus = new System.Windows.Forms.TextBox();
            this.cmdCancelImport = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ofdSelectDataFile
            // 
            this.ofdSelectDataFile.FileName = "ofdSelectDataFile";
            // 
            // txtFilePath
            // 
            this.txtFilePath.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFilePath.Location = new System.Drawing.Point(89, 28);
            this.txtFilePath.Name = "txtFilePath";
            this.txtFilePath.Size = new System.Drawing.Size(356, 20);
            this.txtFilePath.TabIndex = 0;
            // 
            // lblFilePath
            // 
            this.lblFilePath.AutoSize = true;
            this.lblFilePath.Location = new System.Drawing.Point(13, 28);
            this.lblFilePath.Name = "lblFilePath";
            this.lblFilePath.Size = new System.Drawing.Size(70, 13);
            this.lblFilePath.TabIndex = 1;
            this.lblFilePath.Text = "File to Import:";
            // 
            // cmdSelectFile
            // 
            this.cmdSelectFile.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdSelectFile.Location = new System.Drawing.Point(452, 28);
            this.cmdSelectFile.Name = "cmdSelectFile";
            this.cmdSelectFile.Size = new System.Drawing.Size(32, 23);
            this.cmdSelectFile.TabIndex = 2;
            this.cmdSelectFile.Text = "...";
            this.cmdSelectFile.UseVisualStyleBackColor = true;
            this.cmdSelectFile.Click += new System.EventHandler(this.cmdSelectFile_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 62);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "File Preview";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // txtFilePreview
            // 
            this.txtFilePreview.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtFilePreview.Location = new System.Drawing.Point(16, 79);
            this.txtFilePreview.Multiline = true;
            this.txtFilePreview.Name = "txtFilePreview";
            this.txtFilePreview.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtFilePreview.Size = new System.Drawing.Size(468, 89);
            this.txtFilePreview.TabIndex = 4;
            // 
            // cmdImportData
            // 
            this.cmdImportData.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdImportData.Location = new System.Drawing.Point(16, 174);
            this.cmdImportData.Name = "cmdImportData";
            this.cmdImportData.Size = new System.Drawing.Size(383, 23);
            this.cmdImportData.TabIndex = 5;
            this.cmdImportData.Text = "Import Data";
            this.cmdImportData.UseVisualStyleBackColor = true;
            this.cmdImportData.Click += new System.EventHandler(this.cmdImportData_Click);
            // 
            // lblStatus
            // 
            this.lblStatus.AutoSize = true;
            this.lblStatus.Location = new System.Drawing.Point(16, 215);
            this.lblStatus.Name = "lblStatus";
            this.lblStatus.Size = new System.Drawing.Size(69, 13);
            this.lblStatus.TabIndex = 6;
            this.lblStatus.Text = "Import Status";
            this.lblStatus.Click += new System.EventHandler(this.label2_Click);
            // 
            // txtStatus
            // 
            this.txtStatus.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtStatus.Location = new System.Drawing.Point(19, 232);
            this.txtStatus.Multiline = true;
            this.txtStatus.Name = "txtStatus";
            this.txtStatus.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtStatus.Size = new System.Drawing.Size(465, 180);
            this.txtStatus.TabIndex = 7;
            // 
            // cmdCancelImport
            // 
            this.cmdCancelImport.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cmdCancelImport.Location = new System.Drawing.Point(406, 175);
            this.cmdCancelImport.Name = "cmdCancelImport";
            this.cmdCancelImport.Size = new System.Drawing.Size(75, 23);
            this.cmdCancelImport.TabIndex = 8;
            this.cmdCancelImport.Text = "Cancel";
            this.cmdCancelImport.UseVisualStyleBackColor = true;
            this.cmdCancelImport.Click += new System.EventHandler(this.cmdCancelImport_Click);
            // 
            // Import
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(496, 424);
            this.Controls.Add(this.cmdCancelImport);
            this.Controls.Add(this.txtStatus);
            this.Controls.Add(this.lblStatus);
            this.Controls.Add(this.cmdImportData);
            this.Controls.Add(this.txtFilePreview);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmdSelectFile);
            this.Controls.Add(this.lblFilePath);
            this.Controls.Add(this.txtFilePath);
            this.Name = "Import";
            this.Text = "Import Quicken Data";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.OpenFileDialog ofdSelectDataFile;
        private System.Windows.Forms.TextBox txtFilePath;
        private System.Windows.Forms.Label lblFilePath;
        private System.Windows.Forms.Button cmdSelectFile;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtFilePreview;
        private System.Windows.Forms.Button cmdImportData;
        private System.Windows.Forms.Label lblStatus;
        private System.Windows.Forms.TextBox txtStatus;
        private System.Windows.Forms.Button cmdCancelImport;
    }
}