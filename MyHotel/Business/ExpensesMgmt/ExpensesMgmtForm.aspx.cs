using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity.Expenses;
using Obout.Ajax.UI.TreeView;

namespace MyHotel.Business.ExpensesMgmt
{
    public partial class ExpensesMgmtForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                if (ScriptManager.GetCurrent(Page) == null)
                {
                    Page.Form.Controls.AddAt(0, new ScriptManager());
                }
                if (!Page.IsPostBack)
                {
                    initData();
                }
                updateVisiblePeriod();
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void initData()
        {
            initCalendar();

        }

        private void initCalendar()
        {

        }

        private void updateVisiblePeriod()
        {
            foreach (var group in ExpensesMgmtController.GetExpensesItemsGroups())
            {
                double groupSum = 0;
                Node groupTreeNode = new Node();
                groupTreeNode.Value = group.ExpensesItemID.ToString();
                foreach (var subGroup in ExpensesMgmtController.GetExpensesItemsSubGroups(group))
                {
                    double subGroupSum = 0;
                    Node subGroupTreeNode = new Node();
                    subGroupTreeNode.Value = subGroup.ExpensesItemID.ToString();
                    foreach (var expensesDetails in ExpensesMgmtController.GetExpensesDetails(subGroup))
                    {
                        subGroupSum += expensesDetails.Cost;
                        Node expensesDetailsTreeNode = new Node(getExpensesDetailsText(expensesDetails));
                        expensesDetailsTreeNode.Value = expensesDetails.ExpensesDetailsID.ToString();
                        subGroupTreeNode.ChildNodes.Add(expensesDetailsTreeNode);
                    }
                    subGroupTreeNode.Text = getExpensesItemsText(subGroup, subGroupSum);
                    groupTreeNode.ChildNodes.Add(subGroupTreeNode);
                    groupSum += subGroupSum;
                }
                groupTreeNode.Text = getExpensesItemsText(group, groupSum);
                TreeExpenses.Nodes.Add(groupTreeNode);
            }
        }

        private string getExpensesItemsText(ExpensesItemsEntity expensesItemsEntity, double sum)
        {
            return String.Format("<span class=\"expensesitemname\">{0}</span><span class=\"expensesitemsum\">{1}</span>", expensesItemsEntity.Name, sum);
        }

        private string getExpensesDetailsText(ExpensesDetailsEntity expensesDetailsEntity)
        {
            return String.Format("<span class=\"expensesdetailsdate\">{0}</span><span class=\"expensesdetailscost\">{1}</span><span class=\"expensesdetailsdescription\">{2}</span>", expensesDetailsEntity.Date, expensesDetailsEntity.Cost, expensesDetailsEntity.Description);
        }
    }
}