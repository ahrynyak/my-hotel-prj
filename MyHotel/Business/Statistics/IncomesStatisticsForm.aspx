<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="IncomesStatisticsForm.aspx.cs" Inherits="MyHotel.Business.Statistics.IncomesStatisticsForm" %>

<%@ Register TagPrefix="IncomesView" TagName="IncomesWebControl" Src="~/Business/WebControls/Incomes/IncomesWebControl.ascx" %>
<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <hr />
    </div>
    <div>
        <IncomesView:IncomesWebControl runat="server" ID="IncomesViewCtrl" />
    </div>
</asp:Content>
