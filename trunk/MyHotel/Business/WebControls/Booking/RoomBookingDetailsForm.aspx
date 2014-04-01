<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBookingDetailsForm.aspx.cs"
    Inherits="MyHotel.Business.WebControls.Booking.RoomBookingDetailsForm" Culture="uk-UA"
    UICulture="uk-UA" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<script type="text/javascript">
    function colorChanged(sender) {
        sender.get_element().style.color =
             "#" + sender.get_selectedColor();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formRBD" runat="server" class="FormBookingDetails">
        <asp:ScriptManager ID="ScriptManagerBookingDetails" runat="server" EnableScriptGlobalization="true" />
        <asp:UpdatePanel ID="UpdatePanelBookingDetails" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:PostBackTrigger ControlID="ButtonOK" />
                <asp:PostBackTrigger ControlID="ButtonCancel" />
                <asp:PostBackTrigger ControlID="LinkButtonDeleteBooking" />
                <asp:PostBackTrigger ControlID="ImageButtonRefreshCalculation" />
            </Triggers>
            <ContentTemplate>
                <div class="bookigDetailsDiv">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="LabelRoomName" runat="server" Text="Номер:" CssClass="labelBookingDetailsSpecial" />
                            </td>
                            <td>
                                <asp:Label ID="LabelRoomNameValue" runat="server" Text="..." CssClass="labelBookingDetailsSpecial" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">Імя гостя
                            </td>
                            <td class="labelBookingDetails">Телефон
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxGuestName" runat="server" Width="90%" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGuestName" runat="server" ErrorMessage="*"
                                    CssClass="errorValidation" ControlToValidate="TextBoxGuestName" ToolTip="Обов'язкове поле" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxGuestPhone" runat="server" Width="90%" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGuestPhone" runat="server"
                                    ErrorMessage="*" CssClass="errorValidation" ControlToValidate="TextBoxGuestPhone"
                                    ToolTip="Обов'язкове поле" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">К-ть дорослих
                            </td>
                            <td class="labelBookingDetails">К-ть дітей
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxAdultNumber" runat="server" Width="90%" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAdultNumber" runat="server"
                                    ErrorMessage="*" CssClass="errorValidation" ControlToValidate="TextBoxAdultNumber"
                                    ToolTip="Обов'язкове поле" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredtextboxextenderAdultNumber" runat="server"
                                    TargetControlID="TextBoxAdultNumber" FilterType="Numbers" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxChildrenNumber" runat="server" Width="90%" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorChildrenNumber" runat="server"
                                    ErrorMessage="*" CssClass="errorValidation" ControlToValidate="TextBoxChildrenNumber"
                                    ToolTip="Обов'язкове поле" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredtextboxextenderChildrenNumber" runat="server"
                                    TargetControlID="TextBoxChildrenNumber" FilterType="Numbers" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">Ціна номера
                            </td>
                            <td class="labelBookingDetails">Ціна дод. місця
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBoxPricePerRoom" runat="server" Width="90%" OnTextChanged="TextBoxPricePerRoom_TextChanged"
                                    AutoPostBack="True" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPricePerRoom" runat="server"
                                    ErrorMessage="*" CssClass="errorValidation" ControlToValidate="TextBoxPricePerRoom"
                                    ToolTip="Обов'язкове поле" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredtextboxextenderPricePerRoom" runat="server"
                                    TargetControlID="TextBoxPricePerRoom" FilterType="Numbers" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPriceForExtraBed" runat="server" Width="90%" AutoPostBack="True"
                                    OnTextChanged="TextBoxPriceForExtraBed_TextChanged" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredtextboxextenderPriceForExtraBed"
                                    runat="server" TargetControlID="TextBoxPriceForExtraBed" FilterType="Numbers" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">Дата заїзду
                            </td>
                            <td class="labelBookingDetails">Дата виїзду
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="datePickeStart" Width="90%" autocomplete="off" AutoPostBack="True"
                                    OnTextChanged="datePickeStart_TextChanged" />
                                <ajaxToolkit:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="datePickeEnd" Width="90%" autocomplete="off" AutoPostBack="True"
                                    OnTextChanged="datePickeEnd_TextChanged" />
                                <ajaxToolkit:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">Статус броні
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownListBookingStatus" runat="server" Width="90%" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails" colspan="2">Додаткова інформація
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails" colspan="2">
                                <asp:TextBox ID="TextBoxAdditionalInfo" runat="server" Width="90%" Height="50px"
                                    TextMode="MultiLine" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelBookingDetails">Оплачено
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPaid" runat="server" Width="90%" AutoPostBack="True" OnTextChanged="TextBoxPaid_TextChanged"
                                    Font-Bold="True" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredtextboxextenderPaid" runat="server"
                                    TargetControlID="TextBoxPaid" FilterType="Numbers" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelAmountToBePaid" runat="server" Text="Заг.сума:" CssClass="labelBookingDetailsSpecial" />
                                &nbsp;
                            <asp:Label ID="LabelAmountToBePaidValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                            </td>
                            <td>
                                <asp:Label ID="LabelAmountOfDays" runat="server" Text="К-ть днів:" CssClass="labelBookingDetailsSpecial" />
                                &nbsp;
                            <asp:Label ID="LabelAmountOfDaysValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelAmountRemainderToBePaid" runat="server" Text="Залишок:" CssClass="labelBookingDetailsSpecial" />
                                &nbsp;
                            <asp:Label ID="LabelAmountRemainderToBePaidValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButtonRefreshCalculation" runat="server" OnClick="ImageButtonRefreshCalculation_Click"
                                    ImageUrl="~/icons/refresh_green.ico" Height="16px" Width="16px" />
                                <asp:Label ID="LabelError" runat="server" Text="..." CssClass="errorValidation" Visible="false" Width="60%" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="LinkButtonDeleteBooking" runat="server" OnClick="LinkButtonDeleteBooking_Click"
                                    CausesValidation="False" Font-Bold="True">Delete</asp:LinkButton>
                            </td>
                            <td align="right">
                                <asp:Button ID="ButtonOK" runat="server" Text="OK" Width="60px" OnClick="ButtonOK_Click" />
                                &nbsp;
                            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="60px" OnClick="ButtonCancel_Click"
                                CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
