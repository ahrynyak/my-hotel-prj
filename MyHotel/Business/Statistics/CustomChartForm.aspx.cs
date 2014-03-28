using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyHotel.Business.Statistics
{
    public partial class CustomChartForm : BaseWebFormMgmt
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                if (ScriptManager.GetCurrent(Page) == null)
                {
                    Page.Form.Controls.AddAt(0, new ScriptManager());
                }
                ChartCustom.Titles.Add("Chart Title");
                var area = ChartCustom.ChartAreas.Add("New Area");
                var seriaes = ChartCustom.Series.Add("Employee");
                seriaes.ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
                for (int i = 0; i < 100; i++)
                {
                    seriaes.Points.AddXY(i, i + 150);
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        protected void ObjectDataSourceCustomChart_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {

        }
    }
}