<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateRangerControl.ascx.cs" Inherits="MyHotel.Business.WebControls.DateRange.DateRangerControl"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<div>
    <strong>Видимий період</strong>
    <asp:TextBox runat="server" ID="datePickeStart" autocomplete="off" AutoPostBack="True"
        OnTextChanged="datePickeStart_TextChanged" />
    <asp:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
    <strong>:</strong>
    <asp:TextBox runat="server" ID="datePickeEnd" autocomplete="off" AutoPostBack="True"
        OnTextChanged="datePickeEnd_TextChanged" />
    <asp:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd"
        Format="" />
</div>
