<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IncomesWebControl.ascx.cs" Inherits="MyHotel.Business.WebControls.Incomes.IncomesControl" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<div style="width: 100%;">
        <obout:Tree ID="TreeIncomes" runat="server" EnableViewState="False" ClientIDMode="AutoID"
            CssClass="vista">
            <Nodes>
                <obout:Node ClientID="" Text="New Node">
                </obout:Node>
                <obout:Node ClientID="" Text="New Node">
                </obout:Node>
                <obout:Node ClientID="" Text="New Node">
                </obout:Node>
                <obout:Node ClientID="" Text="New Node">
                </obout:Node>
            </Nodes>
        </obout:Tree>
</div>