using MyHotel.Business.Entity.CustomChart;
using MyHotel.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.UI.DataVisualization.Charting;

namespace MyHotel.Business.Statistics
{
    public partial class CustomChartForm : BaseWebFormMgmt
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                AddScriptManager();
                if (!Page.IsPostBack)
                {
                    RefreshScriptGUI();
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void RefreshScriptGUI()
        {
            try
            {
                int scriptSelectedIndex = ListBoxScriptSelection.SelectedIndex;
                ListBoxScriptSelection.DataSource = StatisticsController.GetCustomChartData();
                ListBoxScriptSelection.DataTextField = "Title";
                ListBoxScriptSelection.DataValueField = "ID";
                ListBoxScriptSelection.DataBind();
                setSelectedIdx(ListBoxScriptSelection, scriptSelectedIndex);
                ImageButtonRemoveTitle.Enabled = !(ListBoxXYAxises.Items.Count == 0 || ListBoxXYAxises.SelectedIndex == -1);
                RefreshGUIWithSelectedScript();
                DropDownListChartType.DataSource = Enum.GetNames(typeof(SeriesChartType));
                DropDownListChartType.DataBind();
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private void RefreshGUIWithSelectedScript()
        {
            try
            {
                int scriptSelectedIndex = ListBoxXYAxises.SelectedIndex;
                CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
                TextBoxTitle.Text = customChartScriptInfo != null ? customChartScriptInfo.Title : "";
                TextBoxScript.Text = customChartScriptInfo != null ? customChartScriptInfo.ScriptText : "";
                ListBoxXYAxises.Items.Clear();

                if (customChartScriptInfo != null)
                {

                    ListBoxXYAxises.DataSource = customChartScriptInfo.CustomChartXYAxisInfos;
                    ListBoxXYAxises.DataTextField = "Legend";
                    ListBoxXYAxises.DataValueField = "ID";
                    ListBoxXYAxises.DataBind();
                }
                setSelectedIdx(ListBoxXYAxises, scriptSelectedIndex);
                ImageButtonRemoveXYAxis.Enabled = !(ListBoxXYAxises.Items.Count == 0 || ListBoxXYAxises.SelectedIndex == -1);
                RefreshGUIWithSelectedXYAxis();
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private void RefreshGUIWithSelectedXYAxis()
        {
            try
            {
                CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
                CustomChartXYAxisInfo customChartXYAxisInfo = null;
                if (customChartScriptInfo != null)
                {
                    customChartXYAxisInfo = getSelectedXYAxis(customChartScriptInfo);
                }
                TextBoxColor.Style["background-color"] = customChartXYAxisInfo != null ? customChartXYAxisInfo.ColorHex : "";
                TextBoxLegend.Text = customChartXYAxisInfo != null ? customChartXYAxisInfo.Legend : "";
                TextBoxXFieldName.Text = customChartXYAxisInfo != null ? customChartXYAxisInfo.XFieldName : "";
                TextBoxYFieldName.Text = customChartXYAxisInfo != null ? customChartXYAxisInfo.YFieldName : "";
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private CustomChartScriptInfo GetSelectedScript()
        {
            if (!string.IsNullOrEmpty(ListBoxScriptSelection.SelectedValue))
            {
                return StatisticsController.GetCustomChartDataByID(int.Parse(ListBoxScriptSelection.SelectedValue));
            }
            return null;
        }

        private CustomChartXYAxisInfo getSelectedXYAxis(CustomChartScriptInfo customChartScriptInfo)
        {
            var selectedXYAxis = customChartScriptInfo.CustomChartXYAxisInfos.FirstOrDefault(s => s.ID == Guid.Parse(ListBoxXYAxises.SelectedValue));
            return selectedXYAxis;
        }

        private void setSelectedIdx(ListBox listBox, int prevSelectedIndex)
        {
            listBox.ClearSelection();
            if (listBox.Items.Count == 0)
            {
                prevSelectedIndex = -1;
            }
            if (listBox.Items.Count < prevSelectedIndex)
            {
                prevSelectedIndex = listBox.Items.Count;
            }
            if (listBox.Items.Count > 0 && prevSelectedIndex < 0)
            {
                prevSelectedIndex = 0;
            }
            listBox.SelectedIndex = prevSelectedIndex;
        }

        #region ListBoxScriptSelection

        protected void ImageButtonAddTitle_Click(object sender, ImageClickEventArgs e)
        {
            SaveAndRefresh(StatisticsController.GetDefaultCustomChartScriptInfo());
            RefreshScriptGUI();
        }

        protected void ImageButtonRemoveTitle_Click(object sender, ImageClickEventArgs e)
        {
            StatisticsController.RemoveCustomChartScriptInfo(GetSelectedScript().ID);
            RefreshScriptGUI();
        }

        protected void ListBoxScriptSelection_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshScriptGUI();
        }

        #endregion

        #region XYAxis

        protected void ImageButtonAddXYAxis_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
                customChartScriptInfo.CustomChartXYAxisInfos.Add(StatisticsController.GetDefaultCustomChartXYAxisInfo());
                SaveAndRefresh(customChartScriptInfo);
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        protected void ImageButtonRemoveXYAxis_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
                customChartScriptInfo.CustomChartXYAxisInfos.RemoveAll(s => s.ID == Guid.Parse(ListBoxXYAxises.SelectedValue));
                SaveAndRefresh(customChartScriptInfo);
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        protected void ListBoxXYAxises_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshGUIWithSelectedXYAxis();
        }

        #endregion

        protected void ImageButtonRun_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                generateChart();
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private void SaveAndRefresh(CustomChartScriptInfo customChartScriptInfo)
        {
            try
            {
                StatisticsController.SaveCustomChartScriptInfo(customChartScriptInfo);
                RefreshScriptGUI();
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private void SaveDataFromCtrToDb()
        {
            try
            {
                CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
                customChartScriptInfo.Title = TextBoxTitle.Text;
                customChartScriptInfo.ScriptText = TextBoxScript.Text;
                if (!string.IsNullOrEmpty(ListBoxXYAxises.SelectedValue))
                {
                    var selectedXYAxis = getSelectedXYAxis(customChartScriptInfo);
                    if (selectedXYAxis != null)
                    {
                        selectedXYAxis.ColorHex = TextBoxColor.Style["background-color"];
                        selectedXYAxis.Legend = TextBoxLegend.Text;
                        selectedXYAxis.XFieldName = TextBoxXFieldName.Text;
                        selectedXYAxis.YFieldName = TextBoxYFieldName.Text;
                    }
                }
                StatisticsController.SaveCustomChartScriptInfo(customChartScriptInfo);
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionMessageBox(this, ex);
            }
        }

        private void generateChart()
        {
            CustomChartScriptInfo customChartScriptInfo = GetSelectedScript();
            if (customChartScriptInfo != null)
            {
                ChartCustom.Titles.Add(customChartScriptInfo.Title);
                ChartCustom.Legends.Add(customChartScriptInfo.Title);
                var area = ChartCustom.ChartAreas.Add(customChartScriptInfo.Title);
                DataTable dataTable = StatisticsController.GetDataTable(customChartScriptInfo.ScriptText);
                foreach (var xyAxisInfo in customChartScriptInfo.CustomChartXYAxisInfos)
                {
                    var series = ChartCustom.Series.Add(xyAxisInfo.Legend);
                    series.Legend = customChartScriptInfo.Title;
                    series.ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), DropDownListChartType.SelectedValue);
                    series.IsValueShownAsLabel = CheckBoxIsValueShownAsLabel.Checked;
                    series.Color = string.IsNullOrEmpty(xyAxisInfo.ColorHex) ? Color.Red : System.Drawing.ColorTranslator.FromHtml(xyAxisInfo.ColorHex);
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        series.Points.AddXY(dataRow[xyAxisInfo.XFieldName], dataRow[xyAxisInfo.YFieldName]);
                    }
                }

            }
        }

        protected void ImageButtonSave_Click(object sender, ImageClickEventArgs e)
        {
            SaveDataFromCtrToDb();
            RefreshScriptGUI();
        }
    }
}