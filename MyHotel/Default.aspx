<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyHotel.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <table width="100%">
        <tr>
            <td align="left" class="defaultPageH1">
                Інформація про садибу
            </td>
        </tr>
        <tr>
            <td align="left" class="defaultPageH2">
                Контактна інформація:
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="defaultPageNormalText">
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            Львівська обл. Дрогобицький р-н,<br />
                            смт. Східниця, вул. Промислова 58
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; width: 55px;">
                            Тел.:
                        </td>
                        <td>
                            +38 (096) 812-20-98<br />
                            +38 (093) 873-83-94<br />
                            +38 (093) 566-66-89<br />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top; width: 55px;">
                            E-mail:
                        </td>
                        <td>
                            <a href="mailto:ukr_root@ukr.net">ukr_root@ukr.net</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" class="defaultPageH2">
                Опис:
            </td>
        </tr>
        <tr>
            <td class="defaultPageNormalText">
                Садиба призначена для затишного і комфортного відпочинку
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="defaultPageNormalText">
                <ul>
                    <li>двомісний однокімнатний номер - два односпальні ортопедичні ліжка, телевізор з супутниковим
                        телебаченням, шафа для одягу, журнальний столик, трюмо, санвузол (туалет, умивальник,
                        душ) </li>
                    <li>сімейний двокімнатний номер - двоспальне ортопедичне ліжко, диван, телевізор з супутниковим
                        телебаченням, шафа для одягу, журнальний столик, трюмо, санвузол (туалет, умивальник,
                        душ) </li>
                    <li>кухня-їдальня - газова плита, мікрохвильова піч, холодильник, електрочайник, посуд
                    </li>
                    <li>опалення - автономне парове </li>
                    <li>водопостачання - холодна та гаряча вода</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td align="left" class="defaultPageH2">
                Ціни:
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolderRightLeftCornerMaster">
    <asp:LinkButton ID="linkButtonSignIn" runat="server" CssClass="loginoutbutton" Text="Sign in"
        OnClick="linkButtonSignIn_Click" />
</asp:Content>
