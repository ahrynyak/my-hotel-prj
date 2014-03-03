<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="UtilitiesForm.aspx.cs" Inherits="MyHotel.Business.Utilities.UtilitiesForm" Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>
<%@ Register TagPrefix="UtilitiesView" TagName="UtilitiesWebControl" Src="~/Business/WebControls/Utilities/UtilitiesWebControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <hr />
    </div>
    <div>
        <UtilitiesView:UtilitiesWebControl runat="server" ID="UtilitiesViewCtrl" />
    </div>
</asp:Content>
