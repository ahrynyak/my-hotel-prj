<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelSecuredMgmt.Master"
    AutoEventWireup="true" CodeBehind="RoomBookingMgmtForm.aspx.cs" Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingMgmtForm" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" TagPrefix="bdp" Namespace="BasicFrame.WebControls" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MyHotelSecuredMgmtContentPlaceHolder">
    <script type="text/javascript" src="../../js/modal.js"></script>
    <script type="text/javascript">
        var modal = new DayPilot.Modal();
        modal.top = 60;
        modal.width = 350;
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
                Видимий період:
            </td>
            <td style="width: 130px">
                <bdp:BasicDatePicker ID="datePickeStart" runat="server" DisplayType="TextBox" OnSelectionChanged="datePickeStart_SelectionChanged"
                    AutoPostBack="true" />
            </td>
            <td style="width: 20px">
                до
            </td>
            <td style="width: 130px">
                <bdp:BasicDatePicker ID="datePickeEnd" runat="server" DisplayType="TextBox" OnSelectionChanged="datePickeEnd_SelectionChanged"
                    AutoPostBack="true" />
            </td>
            <td>
                <asp:DropDownList ID="DropDownListStyleSelector" runat="server" Width="200px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDownListStyleSelector_SelectedIndexChanged"/>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="5">
                <DayPilot:DayPilotScheduler runat="server" ID="dayPilotScheduler" RowHeaderColumnWidths="150"
                    CellGroupBy="Month" CellDuration="1440" DataEndField="EndDate" DataTextField="GuestName"
                    DataValueField="RoomBookingID" DataResourceField="RoomID" DataTagFields="BookingStatus"
                    DataStartField="StartDate" ClientObjectName="dps" Days="365" EventClickHandling="JavaScript"
                    EventDoubleClickHandling="PostBack" EventEditHandling="PostBack" EventResizeHandling="PostBack"
                    EventSelectHandling="PostBack" Height="350px" TimeRangeDoubleClickHandling="PostBack"
                    TimeRangeSelectedHandling="JavaScript" TimeFormat="Clock24Hours" WeekStarts="Auto"
                    Width="100%" EventClickJavaScript="editEvent(e.value());" TimeRangeSelectedJavaScript="createEvent(start, end, column);"
                    CssClassPrefix="axendodaypilot_" CssOnly="True" EventHeight="35" 
                    RowMinHeight="40" CellWidth="35" Font-Bold="False" HeaderHeight="35" 
                    LoadingLabelText="Завантажую...">
                </DayPilot:DayPilotScheduler>
            </td>
        </tr>
    </table>
</asp:Content>
