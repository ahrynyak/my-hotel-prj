<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    Про нас
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <p>
        Раді вітати Вас на нашому сайті
    </p>
    <table width="100%">
        <tr>
            <td>
                <asp:Twitter ID="Twitter1" runat="server" Caption="bbb" ProfileImageUrl="" ScreenName="Vov"
                    Title="Rooms">
                    <EmptyDataTemplate>
                        There are no matching tweets.
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div runat="server" class="ajax__twitter_header">
                            <asp:Image runat="server"></asp:Image>
                            <h3 runat="server">
                                Rooms</h3>
                            <h4 runat="server">
                                bbb</h4>
                        </div>
                        <ul runat="server" class="ajax__twitter_itemlist" style="margin: 0px;">
                            <asp:PlaceHolder runat="server" ID="ItemPlaceholder"></asp:PlaceHolder>
                        </ul>
                        <div runat="server" class="ajax__twitter_footer">
                            <asp:Image runat="server" ImageUrl="mvwres://AjaxControlToolkit, Version=4.1.7.123, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e/Twitter.Twitter24.png">
                            </asp:Image>
                        </div>
                    </LayoutTemplate>
                </asp:Twitter>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRoomsName"
    runat="server">
    Номери
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
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    Ціни
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotosName"
    runat="server">
    Фото
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
    runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolderContactsName"
    runat="server">
    Контакти
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
</asp:Content>
