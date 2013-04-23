using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using MyHotel.Business.Entity.Expenses;
using System.Globalization;

namespace MyHotel.Business.WebControls.Expenses
{
    public partial class ExpensesDetailsForm : System.Web.UI.Page
    {
        private bool isEdit = false;
        private ExpensesDetailsEntity expensesDetailsEntity = null;
        private ExpensesItemsEntity expensesItemsEntity = null;
        private DateTime starDate = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                initData();
                refreshUI();
            }
        }

        private void initData()
        {
            try
            {
                if (Request.QueryString.Count > 0)
                {
                    string startDateString = Request.QueryString["startDate"];
                    if (!string.IsNullOrEmpty(startDateString))
                    {
                        starDate = DateTime.Parse(startDateString, CultureInfo.CurrentCulture);
                    }
                    else
                    {
                        MessageBox.Show("Некоректні параметри дати");
                    }
                    string expensID = Request.QueryString["expensID"];
                    if (!string.IsNullOrEmpty(expensID))
                    {
                        //new
                        isEdit = false;
                        expensesItemsEntity = ExpensesController.GetExpensesItemsByID(int.Parse(expensID));
                        expensesDetailsEntity = new ExpensesDetailsEntity() { ExpensesItemID = expensesItemsEntity.ExpensesItemID, Cost = 0, Date = starDate };
                    }
                    else
                    {
                        //edit
                        isEdit = true;
                        string subGrID = Request.QueryString["subGrID"];
                        if (!string.IsNullOrEmpty(subGrID))
                        {
                            expensesDetailsEntity = ExpensesController.GetExpensesDetailsByID(int.Parse(subGrID));
                            expensesItemsEntity = ExpensesController.GetExpensesItemsByID(expensesDetailsEntity.ExpensesItemID);
                        }
                        else
                        {
                            MessageBox.Show("Некоректні параметри");
                        }
                    }

                    ButtonDelete.Visible = isEdit;
                }
                else
                {
                    MessageBox.Show("Відсутні параметри");
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        private void refreshUI()
        {
            try
            {
                if (expensesDetailsEntity != null)
                {
                    if (expensesItemsEntity != null)
                    {
                        LabelHeader.Text = expensesItemsEntity.FullName;
                    }
                    TextBoxDate.Text = expensesDetailsEntity.Date.ToString(HelperCommon.DateFormat);
                    CalendarExtenderDate.Format = HelperCommon.DateFormat;
                    TextBoxCost.Text = expensesDetailsEntity.Cost.ToString();
                    TextBoxInfo.Text = expensesDetailsEntity.Description;
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        private void saveData()
        {
            initData();
            if (expensesDetailsEntity != null)
            {
                expensesDetailsEntity.Cost = double.Parse(TextBoxCost.Text);
                expensesDetailsEntity.Date = DateTime.ParseExact(TextBoxDate.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                expensesDetailsEntity.Description = TextBoxInfo.Text;
                ExpensesController.SaveExpensesDetails(expensesDetailsEntity);
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            try
            {
                saveData();
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["subGrID"];
                ExpensesController.DeleteExpensesDetails(int.Parse(id));
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }

        }
    }
}