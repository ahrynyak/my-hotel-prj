<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="CustomChartForm.aspx.cs" Inherits="MyHotel.Business.Statistics.CustomChartForm" Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.ColorPicker" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <script runat="server" language="c#">
        protected void color_postback(object sender, Obout.Ajax.UI.ColorPicker.ColorPostBackEventArgs e)
        {
            TextBoxColor.Style[HtmlTextWriterStyle.BackgroundColor] = e.Color;
        }
    </script>
    <script type="text/JavaScript">
        function onClientOpen(sender, args) {
            sender.setColor(sender.get_targetElement().style.backgroundColor);
        }

        function setWaitCursor(onoff) {
            if (onoff) {
                document.body.style.cursor = 'wait';
            }
            else {
                document.body.style.cursor = 'pointer';
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanelBookingDetails" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButtonAddTitle" />
            <asp:PostBackTrigger ControlID="ImageButtonRemoveTitle" />
            <asp:PostBackTrigger ControlID="ImageButtonAddXYAxis" />
            <asp:PostBackTrigger ControlID="ImageButtonRemoveXYAxis" />
            <asp:PostBackTrigger ControlID="ImageButtonRun" />
        </Triggers>
        <ContentTemplate>
            <div>
                <table width="90%" style="vertical-align: top;" border="1">
                    <tr>
                        <td width="250" style="vertical-align: top;">
                            <asp:Label ID="LabelTitle" runat="server" Text="Title" Width="45"></asp:Label>
                            <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox>
                        </td>
                        <td width="250" style="vertical-align: top;">
                            <asp:Label ID="LabelLegend" runat="server" Text="Legend" Width="45"></asp:Label>
                            <asp:TextBox ID="TextBoxLegend" runat="server" Width="70"></asp:TextBox>
                            <asp:Label ID="LabelColor" runat="server" Text="Color" Width="45"></asp:Label>
                            <asp:TextBox runat="server" Text="" ID="TextBoxColor" ReadOnly="true" Style="cursor: pointer; background-color: #FFFFFF" Width="70" AutoPostBack="True" />
                            <obout:ColorPickerExtender runat="server" ID="colorPickerExtender" OnClientOpen="onClientOpen" OnColorPostBack="color_postback" AutoPostBack="true" TargetProperty="style.backgroundColor" PopupButtonID="TextBoxColor" TargetControlID="TextBoxColor" />
                            <br />
                            <asp:Label ID="LabelXFieldName" runat="server" Text="X Col" Width="45"></asp:Label>
                            <asp:TextBox ID="TextBoxXFieldName" runat="server" Width="70"></asp:TextBox>
                            <asp:Label ID="LabelYFieldName" runat="server" Text="Y Col" Width="45"></asp:Label>
                            <asp:TextBox ID="TextBoxYFieldName" runat="server" Width="70"></asp:TextBox>
                        </td>
                        <td style="vertical-align: top;" rowspan="2">
                            <asp:TextBox ID="TextBoxScript" runat="server" TextMode="MultiLine" Width="90%"
                                Height="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:ListBox ID="ListBoxScriptSelection" runat="server" Width="250px" Height="150px" AutoPostBack="True" OnSelectedIndexChanged="ListBoxScriptSelection_SelectedIndexChanged"></asp:ListBox>
                        </td>
                        <td style="vertical-align: top;">
                            <asp:ListBox ID="ListBoxXYAxises" runat="server" Width="250px" Height="150px" AutoPostBack="True" OnSelectedIndexChanged="ListBoxXYAxises_SelectedIndexChanged"></asp:ListBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButtonAddTitle" runat="server" ImageUrl="~/icons/add1.ico" Height="16px" Width="16px" OnClick="ImageButtonAddTitle_Click" />
                            <asp:ImageButton ID="ImageButtonRemoveTitle" runat="server" ImageUrl="~/icons/remove.png" Height="16px" Width="16px" OnClick="ImageButtonRemoveTitle_Click" />

                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonAddXYAxis" runat="server" ImageUrl="~/icons/add1.ico" Height="16px" Width="16px" OnClick="ImageButtonAddXYAxis_Click" />
                            <asp:ImageButton ID="ImageButtonRemoveXYAxis" runat="server" ImageUrl="~/icons/remove.png" Height="16px" Width="16px" OnClick="ImageButtonRemoveXYAxis_Click" />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButtonRun" runat="server" ImageUrl="~/icons/Play.png" Height="16px" Width="16px" OnClick="ImageButtonRun_Click" />
                            <asp:ImageButton ID="ImageButtonSave" runat="server"
                                ImageUrl="~/icons/save-as-xxl.png" Height="16px" Width="16px"
                                OnClick="ImageButtonSave_Click" />
                        </td>

                    </tr>
                </table>
            </div>
            <div>
                <asp:Chart ID="ChartCustom" runat="server" Height="600px" Width="900px">
                </asp:Chart>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
