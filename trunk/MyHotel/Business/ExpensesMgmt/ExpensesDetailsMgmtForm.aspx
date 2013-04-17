﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpensesDetailsMgmtForm.aspx.cs"
    Inherits="MyHotel.Business.ExpensesMgmt.ExpensesDetailsMgmtForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManagerExpensesDetails" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelBookingDetails" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonOK" />
            <asp:PostBackTrigger ControlID="ButtonCancel" />
        </Triggers>
        <ContentTemplate>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LabelDate" runat="server" Text="Дата" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDate" runat="server" Width="90%" />
                            <asp:CalendarExtender ID="CalendarExtenderDate" runat="server" TargetControlID="TextBoxDate">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelCost" runat="server" Text="Сума" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCost" runat="server" Width="90%" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" runat="server" ErrorMessage="*"
                                CssClass="errorValidation" ControlToValidate="TextBoxCost" ToolTip="Обов'язкове поле" />
                            <asp:FilteredTextBoxExtender ID="FilteredtextboxextenderCost" runat="server" TargetControlID="TextBoxCost"
                                FilterType="Numbers" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelInfo" runat="server" Text="Інфо" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxInfo" runat="server" TextMode="MultiLine" Width="90%" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="ButtonOK" runat="server" Text="OK" onclick="ButtonOK_Click" />
                            &nbsp;
                            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" 
                                onclick="ButtonCancel_Click" />
                            &nbsp;
                            <asp:Button ID="ButtonDelete" runat="server" Text="Delete" 
                                onclick="ButtonDelete_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
