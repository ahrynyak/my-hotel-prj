<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabAbout"
    runat="server">
    <p>
        Раді вітати Вас на нашому сайтію
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <table width="100%">
        <tr>
            <td colspan="2" class="H1Text">
                Треба гарний текст сюди
            </td>
        </tr>
        <tr>
            <td colspan="2" class="NormalText">
                <ul>
                    <li><strong>двомісний однокімнатний номер</strong> - два односпальні ортопедичні ліжка,
                        телевізор з супутниковим телебаченням, шафа для одягу, журнальний столик, трюмо,
                        санвузол (туалет, умивальник, душ) </li>
                    <li><strong>сімейний двокімнатний номер</strong>- двоспальне ортопедичне ліжко, диван,
                        телевізор з супутниковим телебаченням, шафа для одягу, журнальний столик, трюмо,
                        санвузол (туалет, умивальник, душ) </li>
                    <li><strong>кухня-їдальня</strong> - газова плита, мікрохвильова піч, холодильник, електрочайник,
                        посуд </li>
                    <li><strong>опалення</strong> - автономне парове </li>
                    <li><strong>водопостачання</strong> - холодна та гаряча вода</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td class="H2Text">
                Схема двомісного однокімнатного номеру
            </td>
            <td class="H2Text">
                Схема сімейного двокімнатного номеру
            </td>
        </tr>
        <tr>
            <td align="center">
                <img src="../../icons/GHDBL.jpg" alt="Схема двомісного однокімнатного номеру" />
            </td>
            <td align="center">
                <img src="../../icons/GHApart.jpg" alt="Схема сімейного двокімнатного номеру" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
    runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
</asp:Content>
