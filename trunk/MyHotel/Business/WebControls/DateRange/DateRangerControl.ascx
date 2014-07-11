<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateRangerControl.ascx.cs"
    Inherits="MyHotel.Business.WebControls.DateRange.DateRangerControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DayPilot.MonthPicker" Namespace="DayPilot.Web.UI" TagPrefix="DayPilot" %>
<div>
    <asp:Panel ID="PanelCustomRange" runat="server">
        <strong>Видимий період</strong>
        <asp:TextBox runat="server" ID="datePickeStart" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeStart_TextChanged" />
        <asp:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
        <strong>:</strong>
        <asp:TextBox runat="server" ID="datePickeEnd" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeEnd_TextChanged" />
        <asp:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd"
            Format="" />
    </asp:Panel>
    <asp:Panel ID="PanelMonth" runat="server" Visible="False">
        <strong>Видимий період</strong>
        <DayPilot:MonthPicker ID="MonthPickerDate" runat="server" YearStart="2008" 
            AutoPostBack="True" onselectionchanged="MonthPickerDate_SelectionChanged" />
    </asp:Panel>
</div>
