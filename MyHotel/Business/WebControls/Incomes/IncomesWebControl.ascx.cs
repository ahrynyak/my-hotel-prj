using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity;
using Obout.Ajax.UI.TreeView;
using MyHotel.Business.Entity.Incomes;

namespace MyHotel.Business.WebControls.Incomes
{
    public partial class IncomesControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Refresh(DateTime startDate, DateTime endDate)
        {
            var allIncomes = IncomesController.GetPlanedIncomesData(startDate, endDate);
            int numrows = 3;
            int numcells = 2;
            for (int j = 0; j < numrows; j++)
            {
                TableRow r = new TableRow();
                for (int i = 0; i < numcells; i++)
                {
                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl("row "
                        + j.ToString() + ", cell " + i.ToString()));
                    r.Cells.Add(c);
                }
                TablePlanned.Rows.Add(r);
            }

        }

        #region css format for tree nodes
       

        #endregion
    }
}