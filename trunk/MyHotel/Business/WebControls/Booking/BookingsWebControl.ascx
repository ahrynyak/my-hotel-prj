<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingsWebControl.ascx.cs"
    Inherits="MyHotel.Business.WebControls.Booking.BookingsWebControl" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script type="text/javascript" src="/js/modal.js"></script>
<script type="text/javascript" src="/js/message.js"></script>
<script type="text/javascript">
    var message = new DayPilot2.Message("message");
    message.hideAfter = 3000;

    var modal = new DayPilot.Modal();
    modal.top = 60;
    modal.width = 400;
    modal.opacity = 60;
    modal.height = 550;
    modal.border = "1px solid black";
    modal.closed = function () {
        if (this.result == "OK") {
            dps.commandCallBack('refresh');
        }
    };
    function createEvent(start, end, resource) {
        modal.showUrl("/Business/WebControls/Booking/RoomBookingDetailsForm.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
    }

    function editEvent(id) {
        modal.showUrl("/Business/WebControls/Booking/RoomBookingDetailsForm.aspx?id=" + id);
    }

    function ShowStatistic(dest, dateStr) {
        document.body.style.cursor = 'wait'
        // call server side method
        PageMethods.GetStatisticalInfo(dateStr, CallSuccess, CallFailed, dest);
    }

    // set the destination textbox value with the ContactName
    function CallSuccess(res, destCtrl) {
        var dest = document.getElementById(destCtrl);
        dest.setAttribute("title", res);
        document.body.style.cursor = 'default';
    }

    // alert message on some failure
    function CallFailed(res, destCtrl) {
        document.body.style.cursor = 'default';
        alert(res.get_message());
    }
</script>
<div>
    <DayPilot:DayPilotScheduler runat="server" ID="dayPilotScheduler" RowHeaderColumnWidths="150"
        CellGroupBy="Month" CellDuration="1440" DataEndField="EndDate" DataTextField="GuestName"
        DataValueField="RoomBookingID" DataResourceField="RoomID" DataTagFields="BookingStatus"
        DataStartField="StartDate" ClientObjectName="dps" Days="365" 
        EventClickHandling="JavaScript" EventResizeHandling="PostBack"
        EventSelectHandling="Disabled" Height="350px"
        TimeRangeSelectedHandling="JavaScript" TimeFormat="Clock24Hours" WeekStarts="Monday"
        Width="100%" EventClickJavaScript="editEvent(e.value());" TimeRangeSelectedJavaScript="createEvent(start, end, column);"
        CssClassPrefix="myhstyle" CssOnly="True" EventHeight="55" 
        RowMinHeight="65" CellWidth="35"
        Font-Bold="False" HeaderHeight="35" LoadingLabelText="Завантажую..." EventMoveHandling="PostBack"
        OnEventMove="dayPilotScheduler_EventMove" OnEventResize="dayPilotScheduler_EventResize"
        Style="top: 0px; left: 0px" AfterRenderJavaScript="" HeaderDateFormat="d (ddd)"
        OnBeforeCellRender="dayPilotScheduler_BeforeCellRender" OnBeforeTimeHeaderRender="dayPilotScheduler_BeforeTimeHeaderRender"
        OnBeforeEventRender="dayPilotScheduler_BeforeEventRender" 
        EventDoubleClickJavaScript="dps.eventDoubleClickCallBack(e, e.start().addMinutes(dps.eventOffset.x/dps.cellWidth * dps.cellDuration));" 
        ontimerangedoubleclick="dayPilotScheduler_TimeRangeDoubleClick" 
        TimeRangeDoubleClickHandling="CallBack" TimeRangeDoubleClickJavaScript="" 
        EventRightClickHandling="Disabled">
    </DayPilot:DayPilotScheduler>
</div>
