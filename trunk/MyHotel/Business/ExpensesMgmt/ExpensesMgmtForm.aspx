<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/expenses.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function addNewExpenses(subGrID) {
            dialogExpensesDetails.Open();
        }
        function editExpenses(expensID) {
            dialogExpensesDetails.Open();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        here time range
    </div>
    <div style="width: 100%;">
        <obout:Tree ID="TreeExpenses" runat="server" EnableViewState="False" ClientIDMode="AutoID"
            CssClass="vista">
        </obout:Tree>
        <owd:Dialog ID="dialogExpensesDetails" runat="server" Width="300" Height="200" IsModal="true"
            ShowCloseButton="false" IsDraggable="true">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="LabelDate" runat="server" Text="Дата" class="labelBookingDetails" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtenderDate" runat="server" TargetControlID="TextBoxDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelCost" runat="server" Text="Сума" class="labelBookingDetails" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxCost" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" runat="server" ErrorMessage="*"
                            CssClass="errorValidation" ControlToValidate="TextBoxCost" ToolTip="Обов'язкове поле" />
                        <asp:filteredtextboxextender id="FilteredtextboxextenderCost" runat="server"
                            targetcontrolid="TextBoxCost" filtertype="Numbers" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </owd:Dialog>
    </div>
</asp:Content>
