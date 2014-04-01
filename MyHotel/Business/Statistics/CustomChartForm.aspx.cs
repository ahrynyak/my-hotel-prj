using MyHotel.Business.Entity.CustomChart;
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
                if (!Page.IsPostBack)
                {
                    RefreshAllGUI();
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void RefreshAllGUI()
        {
            ListBoxScriptSelection.DataSource = StatisticsController.GetCustomChartData();
            ListBoxScriptSelection.DataTextField = "Title";
            ListBoxScriptSelection.DataValueField = "ID";
            ListBoxScriptSelection.DataBind();
            //todo: test
            ChartCustom.Titles.Add("Chart Title");
            var area = ChartCustom.ChartAreas.Add("New Area");
            var seriaes = ChartCustom.Series.Add("Employee");
            seriaes.ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            for (int i = 0; i < 100; i++)
            {
                seriaes.Points.AddXY(i, i + 150);
            }
        }

        private void InitGUIBySelectedScript(CustomChartScriptInfo customChartScriptInfo)
        {
            TextBoxTitle.Text = customChartScriptInfo.Title;
            TextBoxScript.Text = customChartScriptInfo.ScriptText;
            ListBoxXYAxises.Items.Clear();
            ListBoxXYAxises.DataSource = customChartScriptInfo.CustomChartXYAxisInfos;
            ListBoxXYAxises.DataTextField = "Legend";
            ListBoxXYAxises.DataValueField = "ID";
            ListBoxXYAxises.DataBind();

        }
        #region ListBoxScriptSelection

        protected void ImageButtonAddTitle_Click(object sender, ImageClickEventArgs e)
        {
            StatisticsController.SaveCustomChartScriptInfo(StatisticsController.GetDefaultCustomChartScriptInfo());
            RefreshAllGUI();
            ListBoxScriptSelection.SelectedIndex = ListBoxScriptSelection.Items.Count - 1;
            ScriptSelectionChanged();
        }

        protected void ImageButtonRemoveTitle_Click(object sender, ImageClickEventArgs e)
        {
            int selectedIndex = ListBoxScriptSelection.SelectedIndex;
            StatisticsController.RemoveCustomChartScriptInfo(int.Parse(ListBoxScriptSelection.SelectedValue ?? "0"));
            RefreshAllGUI();
            ListBoxScriptSelection.SelectedIndex = ListBoxScriptSelection.Items.Count > selectedIndex ? selectedIndex : ListBoxScriptSelection.Items.Count - 1;
            ScriptSelectionChanged();
        }

        protected void ListBoxScriptSelection_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptSelectionChanged();
        }

        private void ScriptSelectionChanged()
        {
            CustomChartScriptInfo customChartScriptInfo = StatisticsController.GetCustomChartDataByID(int.Parse(ListBoxScriptSelection.SelectedValue ?? "0"));
            InitGUIBySelectedScript(customChartScriptInfo);
        }

        #endregion
      

        protected void ImageButtonAddXYAxis_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButtonRemoveXYAxis_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButtonRun_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButtonSave_Click(object sender, ImageClickEventArgs e)
        {
            CustomChartScriptInfo customChartScriptInfo = StatisticsController.GetCustomChartDataByID(int.Parse(ListBoxScriptSelection.SelectedValue ?? "0"));
            customChartScriptInfo.Title = TextBoxTitle.Text;
            customChartScriptInfo.ScriptText = TextBoxScript.Text;
            StatisticsController.SaveCustomChartScriptInfo(customChartScriptInfo);
            RefreshAllGUI();
        }

    }
}