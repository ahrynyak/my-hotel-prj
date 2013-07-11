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
        <asp:CheckBox ID="CheckBoxNeedLoadStatisticalInfo" runat="server" Text="Тижнева статистика"
            AutoPostBack="True" OnCheckedChanged="CheckBoxNeedLoadStatisticalInfo_CheckedChanged" ToolTip="При наведенні курсора на неділю показує статистику за цей тиждень" />
        <hr />
    </div>
    <div>
        <BookingView:BookingsWebControl runat="server" ID="BookingViewCtrl" />
    </div>
</asp:Content>
