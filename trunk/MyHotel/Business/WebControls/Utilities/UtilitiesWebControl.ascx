<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UtilitiesWebControl.ascx.cs" Inherits="MyHotel.Business.WebControls.Utilities.UtilitiesWebControl" %>
<link href="/css/utilities.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/modal.js"></script>
<script type="text/javascript">
    var modal = new DayPilot.Modal();
    modal.top = 0;
    modal.width = 450;
    modal.opacity = 60;
    modal.height = 300;
    modal.closed = function () {
        if (this.result == "OK") {
            document.getElementById("ButtonrRefresh").click();
        }
    };

    function addNewUtilities(startDate) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?startDate=" + startDate);
    }

    function editUtilities(utilitiesItemsDetailsIDs) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?utilitiesItemsDetailsIDs=" + utilitiesItemsDetailsIDs);
    }
</script>
<div>
    <asp:Button ID="ButtonrRefresh" runat="server" Text="Button" ClientIDMode="Static" Height="1" Width="1" />
    <asp:Table ID="TableUtilities" runat="server" GridLines="Both">
    </asp:Table>
</div>
