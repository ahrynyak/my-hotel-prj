<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    CodeBehind="RoomBookingMgmtForm.aspx.cs" Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder">
    <script type="text/javascript" src="../../js/modal.js"></script>
    <script type="text/javascript" src="../../js/message.js"></script>
    <script type="text/javascript">
        var message = new DayPilot2.Message("message");
        message.hideAfter = 3000;

        var modal = new DayPilot.Modal();
        modal.top = 60;
        modal.width = 400;
        modal.opacity = 60;
        modal.height = 500;
        modal.border = "1px solid black";
        modal.closed = function () {
            if (this.result == "OK") {
                dps.commandCallBack('refresh');
            }
        };
        function createEvent(start, end, resource) {
            modal.showUrl("RoomBookingDetailsForm.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
        }

        function editEvent(id) {
            modal.showUrl("RoomBookingDetailsForm.aspx?id=" + id);
        }

    </script>
    <div>
        <strong>Видимий період</strong>
        <asp:TextBox runat="server" ID="datePickeStart" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeStart_TextChanged" />
        <ajaxToolkit:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
        <strong>:</strong>
        <asp:TextBox runat="server" ID="datePickeEnd" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeEnd_TextChanged" />
        <ajaxToolkit:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd"
            Format="" />
        <asp:CheckBox ID="CheckBoxEditPast" runat="server" Text="Редагування минулого" AutoPostBack="True"
            OnCheckedChanged="CheckBoxEditPast_CheckedChanged" />
        <hr />
    </div>
    <div>
        <DayPilot:DayPilotScheduler runat="server" ID="dayPilotScheduler" RowHeaderColumnWidths="150"
            CellGroupBy="Month" CellDuration="1440" DataEndField="EndDate" DataTextField="GuestName"
            DataValueField="RoomBookingID" DataResourceField="RoomID" DataTagFields="BookingStatus"
            DataStartField="StartDate" ClientObjectName="dps" Days="365" EventClickHandling="JavaScript"
            EventDoubleClickHandling="PostBack" EventEditHandling="PostBack" EventResizeHandling="PostBack"
            EventSelectHandling="PostBack" Height="350px" TimeRangeDoubleClickHandling="PostBack"
            TimeRangeSelectedHandling="JavaScript" TimeFormat="Clock24Hours" WeekStarts="Monday"
            Width="100%" EventClickJavaScript="editEvent(e.value());" TimeRangeSelectedJavaScript="createEvent(start, end, column);"
            CssClassPrefix="myhstyle" CssOnly="True" EventHeight="55" RowMinHeight="40" CellWidth="35"
            Font-Bold="False" HeaderHeight="35" LoadingLabelText="Завантажую..." EventMoveHandling="PostBack"
            OnEventMove="dayPilotScheduler_EventMove" OnEventResize="dayPilotScheduler_EventResize"
            Style="top: 0px; left: 0px" AfterRenderJavaScript="" HeaderDateFormat="d (ddd)"
            OnBeforeCellRender="dayPilotScheduler_BeforeCellRender" OnBeforeTimeHeaderRender="dayPilotScheduler_BeforeTimeHeaderRender"
            OnBeforeEventRender="dayPilotScheduler_BeforeEventRender">
        </DayPilot:DayPilotScheduler>
    </div>
</asp:Content>
