<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p>
        Про нас</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <p class="H1Text">
        Про нас
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">Східниця</span> - це бальнеологічний курорт,
        лікувальні води якого не мають аналогів у Європі. Унікальний склад мікроелементів
        цих вод ефективно лікує хвороби серцево-судинної системи, шлунково-кишкового тракту
        і нирок. Східниця - розташована в живописній долині, оточеній гірськими вершинами
        Карпат на висоті 600 метрів над рівнем моря.
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">Унікальність курорту Східниця </span>у тому,
        що на одній, порівняно невеликій території, зосереджені різні типи лікувальних вод:
        слабо-мінералізовані - типу «Нафтуся», з розчинними органічними речовинами в кількості
        10-30 мг/л, залізисті мінеральні води з вмістом заліза від 20 до 70 мг/л, унікальні
        лужні (Східницька содова) мінеральні води типу «Боржомі». Окрім них, родовище володіє
        мінеральними природно-столовими водами.
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">Відпочинок в Східниці </span>- це чистісіньке
        карпатське повітря, тиша гірського поселення і якнайкращі цілющі джерела Європи
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
            САДИБА"</span> запрошує Вас відпочити в гостьовому будинку та пропонує проживаня
        в дво та трьох-чотирьох місних номерах. А також до послуг наших гостей повністю
        обладнана кухня-їдальня, мангал для приготуання смачного шашлика, гойдалка та столики
        на подвір'ї.
    </p>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRoomsName"
    runat="server">
    <p>
        Проживання
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <p class="H1Text">
        Проживання
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
            САДИБА"</span> <span>пропонує наступні варіанти проживання:</span></p>
    <table width="100%">
        <tr>
            <td>
                <span>Двомісний</span> <span class="GreenHouseNormalTextP1">однокімнатний</span>
                <span>номер</span>
                <hr />
            </td>
            <td>
                <span class="GreenHouseNormalTextP1">Cімейний </span><span class="GreenHouseNormalTextP1">
                    двокімнатний</span> <span>номер</span>
                <hr />
            </td>
        </tr>
        <tr>
            <td style="height: 200px; width: 50%; vertical-align: top;">
                <img src="../../icons/GHDBL.jpg" alt="Схема двомісного однокімнатного номеру" class="alignRight" />
                <ul>
                    <li>Два односпальні ортопедичні ліжка </li>
                    <li>Телевізор з супутниковим телебаченням </li>
                    <li>Шафа для одягу </li>
                    <li>Журнальний столик, трюмо </li>
                    <li>Санвузол (туалет, умивальник, душ) </li>
                </ul>
            </td>
            <td>
                <img src="../../icons/GHApart.jpg" alt="Схема сімейного двокімнатного номеру" class="alignRight" />
                <ul>
                    <li>Двоспальне ортопедичне ліжко </li>
                    <li>Диван</li>
                    <li>Телевізор з супутниковим телебаченням </li>
                    <li>Шафа для одягу </li>
                    <li>Журнальний столик, трюмо </li>
                    <li>Санвузол (туалет, умивальник, душ) </li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    <p>
        Ціни
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
    <p class="H1Text">
        Ціни на проживання
    </p>
    <p>
        період 15.01.2013 - 20.04.2013 <span class="GreenHouseNormalTextP1">(низький сезон)</span>
    </p>
    <ul>
        <li>двомісний однокімнатний номер - 140 грн/доба </li>
        <li>сімейний двокімнатний номер :</li>
        <ul>
            <li>для 3-ох осіб - 200 грн/доба</li>
            <li>для 4-ох осіб - 240 грн/доба</li>
        </ul>
    </ul>
    <p>
        період 21.04.2013 - 25.09.2013 <span class="GreenHouseNormalTextP1">(високий сезон)</span></p>
    <ul>
        <li>двомісний однокімнатний номер - 180 грн/доба </li>
        <li>сімейний двокімнатний номер :</li>
        <ul>
            <li>для 3-ох осіб - 240 грн/доба</li>
            <li>для 4-ох осіб - 280 грн/доба</li>
        </ul>
    </ul>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotosName"
    runat="server">
    <p>
        Фото
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
    runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolderContactsName"
    runat="server">
    <p>
        Контакти
    </p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
    <p class="H1Text">
        Контакти
    </p>
    <table>
        <tr>
            <td colspan="2">
                Львівська обл. Дрогобицький р-н, смт. Східниця, вул. Промислова 58
            </td>
        </tr>
        <tr>
            <td>
                Тел.:
            </td>
            <td>
                +38 (096) 812-20-98, <br /> +38 (093) 873-83-94, <br /> +38 (093) 566-66-89
            </td>
        </tr>
        <tr>
            <td>
                E-mail:
            </td>
            <td>
            <a href="mailto:ukr_root@ukr.net" title="ukr_root@ukr.net"/>
            </td>
        </tr>
    </table>
</asp:Content>
