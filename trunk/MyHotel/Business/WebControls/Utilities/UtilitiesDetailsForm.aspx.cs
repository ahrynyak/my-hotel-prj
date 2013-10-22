using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;

namespace MyHotel.Business.WebControls.Utilities
{
    public partial class UtilitiesDetailsForm : System.Web.UI.Page
    {
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
                Control utilitiesDetailsMainTable = this.FindControl("utilitiesDetailsMainTable");
                foreach (var item in UtilitiesController.GetUtilitiesItems())
                {
                    this.Page.Controls.Add(new Label() { Text = item.Name, ID = item.UtilitiesItemsID.ToString() });
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
                
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }
        protected void ButtonOK_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {

        }
    }
}