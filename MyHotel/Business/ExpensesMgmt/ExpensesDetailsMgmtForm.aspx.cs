﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using MyHotel.Business.Entity.Expenses;
using System.Globalization;

namespace MyHotel.Business.ExpensesMgmt
{
    public partial class ExpensesDetailsMgmtForm : System.Web.UI.Page
    {
        private bool isEdit = false;
        private ExpensesDetailsEntity expensesDetailsEntity = null;
        private ExpensesItemsEntity expensesItemsEntity = null;

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
                    string expensID = Request.QueryString["expensID"];
                    if (!string.IsNullOrEmpty(expensID))
                    {
                        //new
                        isEdit = false;
                        expensesItemsEntity = ExpensesMgmtController.GetExpensesItemsByID(int.Parse(expensID));
                        expensesDetailsEntity = new ExpensesDetailsEntity() { ExpensesItemID = expensesItemsEntity.ExpensesItemID, Cost = 0, Date = DateTime.Now };
                    }
                    else
                    {
                        //edit
                        isEdit = true;
                        string subGrID = Request.QueryString["subGrID"];
                        if (!string.IsNullOrEmpty(subGrID))
                        {
                            expensesDetailsEntity = ExpensesMgmtController.GetExpensesDetailsByID(int.Parse(subGrID));
                            expensesItemsEntity = ExpensesMgmtController.GetExpensesItemsByID(expensesDetailsEntity.ExpensesItemID);
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
                ExpensesMgmtController.SaveExpensesDetails(expensesDetailsEntity);
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
                ExpensesMgmtController.DeleteExpensesDetails(int.Parse(id));
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }

        }
    }
}