<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="UtilitiesForm.aspx.cs" Inherits="MyHotel.Business.Utilities.UtilitiesForm"   Culture="uk-UA" UICulture="uk-UA" %>
<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
 <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <hr />
    </div>
    <div>
        
    </div>
</asp:Content>
