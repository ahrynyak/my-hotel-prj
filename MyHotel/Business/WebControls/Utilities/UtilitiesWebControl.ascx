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

    function editUtilities(startDate, utilitiesItemsDetailsIDs) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?startDate=" + startDate + "&utilitiesItemsDetailsIDs=" + utilitiesItemsDetailsIDs);
    }

    function removeUtilities(utilitiesItemsDetailsIDs) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?utilitiesItemsDetailsIDs=" + utilitiesItemsDetailsIDs + "&remove=1");
    }
</script>
<div>
    <asp:Table ID="TableUtilities" runat="server" GridLines="Both">
    </asp:Table>
</div>
