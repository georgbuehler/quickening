using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QifApi;
using QifApi.Transactions;

namespace QuickeningDataLoader
{
    public partial class Import : Form
    {
        public Import()
        {
            InitializeComponent();
        }

        private void cmdSelectFile_Click(object sender, EventArgs e)
        {
            if (ofdSelectDataFile.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtFilePath.Text = ofdSelectDataFile.FileName;
                System.IO.StreamReader sr = new System.IO.StreamReader(ofdSelectDataFile.FileName);
                txtFilePreview.Text = sr.ReadToEnd();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void cmdImportData_Click(object sender, EventArgs e)
        {
            // Implement the actual import here
            QifDom qif = QifDom.ImportFile(txtFilePath.Text);
            foreach(AccountListTransaction account in qif.AccountListTransactions)
            {
                txtStatus.Text = txtStatus.Text + account.Name + Environment.NewLine; 
            }

        }

        private void cmdCancelImport_Click(object sender, EventArgs e)
        {
            // Implement an async cancel token here
        }
    }
}
