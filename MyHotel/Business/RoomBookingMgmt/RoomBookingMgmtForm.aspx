<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    CodeBehind="RoomBookingMgmtForm.aspx.cs" Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>
<%@ Register TagPrefix="BookingView" TagName="BookingsWebControl" Src="~/Business/WebControls/Booking/BookingsWebControl.ascx" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <asp:CheckBox ID="CheckBoxEditPast" runat="server" Text="Редагування минулого" AutoPostBack="True"
            OnCheckedChanged="CheckBoxEditPast_CheckedChanged" ToolTip="Дозволяє додавати або редагувати дані за минулий період" />
        <hr />
    </div>
    <div>
        <BookingView:BookingsWebControl runat="server" ID="BookingViewCtrl" />
    </div>
</asp:Content>
