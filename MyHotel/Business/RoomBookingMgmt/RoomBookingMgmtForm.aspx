<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelSecuredMgmt.Master"
    AutoEventWireup="true" CodeBehind="RoomBookingMgmtForm.aspx.cs" Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingMgmtForm"
    Culture="uk-UA" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MyHotelSecuredMgmtContentPlaceHolder">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" ScriptMode="Debug" CombineScripts="false" />
    <script type="text/javascript" src="../../js/modal.js"></script>
    <script type="text/javascript" src="../../js/message.js"></script>
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
            modal.showUrl("RoomBookingDetailsForm.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
        }

        function editEvent(id) {
            modal.showUrl("RoomBookingDetailsForm.aspx?id=" + id);
        }

    </script>
    <table width="100%">
        <tr>
            <td style="width: 120px">
                <asp:Label ID="LabelVisiblePeriod" runat="server" Text="Видимий період:" CssClass="labelVisiblePeriod"></asp:Label>
            </td>
            <td style="width: 130px">
                <asp:TextBox runat="server" ID="datePickeStart" autocomplete="off" AutoPostBack="True"
                    OnTextChanged="datePickeStart_TextChanged" />
                <ajaxToolkit:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
            </td>
            <td style="width: 20px">
                <asp:Label ID="LabelVisiblePeriodTo" runat="server" Text="до" CssClass="labelVisiblePeriod"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="datePickeEnd" autocomplete="off" AutoPostBack="True"
                    OnTextChanged="datePickeEnd_TextChanged" />
                <ajaxToolkit:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd"
                    Format="" />
            </td>
        </tr>
        <tr>
            <td align="left" colspan="4" class="dayPilotSchedulerDiv">
                <DayPilot:DayPilotScheduler runat="server" ID="dayPilotScheduler" RowHeaderColumnWidths="150"
                    CellGroupBy="Month" CellDuration="1440" DataEndField="EndDate" DataTextField="GuestName"
                    DataValueField="RoomBookingID" DataResourceField="RoomID" DataTagFields="BookingStatus"
                    DataStartField="StartDate" ClientObjectName="dps" Days="365" EventClickHandling="JavaScript"
                    EventDoubleClickHandling="PostBack" EventEditHandling="PostBack" EventResizeHandling="PostBack"
                    EventSelectHandling="PostBack" Height="350px" TimeRangeDoubleClickHandling="PostBack"
                    TimeRangeSelectedHandling="JavaScript" TimeFormat="Clock24Hours" WeekStarts="Monday"
                    Width="100%" EventClickJavaScript="editEvent(e.value());" TimeRangeSelectedJavaScript="createEvent(start, end, column);"
                    CssClassPrefix="myhstyle" CssOnly="True" EventHeight="35" RowMinHeight="40" CellWidth="35"
                    Font-Bold="False" HeaderHeight="35" LoadingLabelText="Завантажую..." EventMoveHandling="PostBack"
                    OnEventMove="dayPilotScheduler_EventMove" OnEventResize="dayPilotScheduler_EventResize"
                    Style="top: 0px; left: 0px" AfterRenderJavaScript="" HeaderDateFormat="d (ddd)"
                    OnBeforeCellRender="dayPilotScheduler_BeforeCellRender" OnBeforeTimeHeaderRender="dayPilotScheduler_BeforeTimeHeaderRender">
                </DayPilot:DayPilotScheduler>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolderRightTopCornerSecured">
    <asp:LinkButton ID="linkButtonSignOut" runat="server" CssClass="loginoutbutton" Text="Sign out"
        OnClick="linkButtonSignOut_Click" />
</asp:Content>
