<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p>
        Про нас</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <table>
        <tr>
            <td>
                <p class="H1Text">
                    Вітаємо
                </p>
                <div class="subPartBodyImg">
                    <img src="../../icons/out5.jpg" alt="" />
                </div>
                <p>
                    <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                        САДИБА"</span> запрошує Вас відпочити в гостьовому будинку та пропонує проживаня
                    в дво та трьох-чотирьох місних номерах. А також до послуг наших гостей повністю
                    обладнана кухня-їдальня, мангал для приготуання смачного шашлика, гойдалка та столики
                    на подвір'ї. <strong>треба текст </strong>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Наше розташування
                </p>
                <div class="subPartBodyImg">
                    <obout:ImageZoom ID="imageZoom" runat="server" ImageUrl="../../icons/shidnycya_karta.jpg"
                        Effect="Zooming" ThumbnailWidth="200" ThumbnailHeight="200" />
                    <p class="SmalText">
                        Карта джерел</p>
                </div>
                <p>
                    <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                        САДИБА"</span> розташована в <strong>час пішки до джерел час до базару час до автостанції
                            помітити на карті</strong> супер пупер місці супер пупер місці супер пупер
                    місці супер пупер місці супер пупер місці супер пупер місці супер пупер місці супер
                    пупер місці супер пупер місці супер пупер місці супер пупер місці супер пупер місці
                    супер пупер місці супер пупер місці супер пупер місці супер пупер місці супер пупер
                    місці супер пупер місці супер пупер місці супер пупер місці супер пупер місці супер
                    пупер місці супер пупер місці супер пупер місці супер пупер місці супер пупер місці
                    супер пупер місці
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Про Cхідницю
                </p>
                <div class="subPartBodyImg">
                    <img src="../../icons/1248809363_shidnicha.gif" alt="" />
                </div>
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
            </td>
        </tr>
    </table>
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
        Номери
    </p>
    <p>
        <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
            САДИБА"</span> <span>пропонує наступні варіанти розміщення:</span></p>
    <table width="100%">
        <tr>
            <td>
                <br />
                <span>Двомісний</span> <span class="GreenHouseNormalTextP1">однокімнатний</span>
                <span>номер</span>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <div class="subPartBodyImg">
                    <img src="../../icons/GHDBL.jpg" alt="Схема двомісного однокімнатного номеру" />
                    <p class="SmalText">
                        Схема двомісного однокімнатного номеру</p>
                </div>
                <ul>
                    <li>Два односпальні ортопедичні ліжка </li>
                    <li>Телевізор з супутниковим телебаченням </li>
                    <li>Шафа для одягу </li>
                    <li>Журнальний столик, трюмо </li>
                    <li>Санвузол (туалет, умивальник, душ) </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <center>
                    <obout:ImageZoom ID="ImageZoomDBLRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/DBLRoom"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" CallbackMode="False" />
                </center>
            </td>
        </tr>
        <tr>
            <td>
                <span>Cімейний </span><span class="GreenHouseNormalTextP1">двокімнатний</span> <span>
                    номер</span>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <div class="subPartBodyImg">
                    <img src="../../icons/GHApart.jpg" alt="Схема сімейного двокімнатного номеру" />
                    <p class="SmalText">
                        Схема сімейного двокімнатного номеру</p>
                </div>
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
        <tr>
            <td>
                <center>
                    <obout:ImageZoom ID="ImageZoomApartRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/ApartRoom"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
            </td>
        </tr>
    </table>
    <p class="H1Text">
        Кухня
    </p>
    <p>
        <span>Наші гості можуть користуватися повністю укомплектованою кухнею:</span></p>
    <table width="100%">
        <tr>
            <td>
                <span>Кухня-</span><span class="GreenHouseNormalTextP1">їдальня</span>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <div class="subPartBodyImg">
                    <img src="../../icons/Kitchen.png" alt="Схема кухні-їдальні" />
                    <p class="SmalText">
                        Схема кухні-їдальні</p>
                </div>
                <ul>
                    <li>Дві газові плити</li>
                    <li>Дві кухонні мийки</li>
                    <li>Мікрохвильова піч </li>
                    <li>Два холодильники</li>
                    <li>Електрочайник </li>
                    <li>Окремі шафки для зберігання</li>
                    <li>Весь необхідний посуд</li>
                    <li>Обідні столи</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <center>
                    <obout:ImageZoom ID="ImageZoomKitchen" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/Kitchen"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
            </td>
        </tr>
    </table>
    <p class="H1Text">
        На подвір'ї
    </p>
    <p>
        <span>До послуг наших гостей затишні куточки на подвір'ї:</span></p>
    <table width="100%">
        <tr>
            <td>
                <span>Місця для </span><span class="GreenHouseNormalTextP1">відпочинку</span>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <ul>
                    <li>Гойдалка</li>
                    <li>Мангал</li>
                    <li>Столи зі зрубу в різних куточках</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <center>
                    <obout:ImageZoom ID="ImageZoomRelaxZones" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/RelaxZones"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
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
    <table>
        <tr>
            <td>
                <p class="H1Text">
                    Поштова адреса
                </p>
                смт. Східниця
                <br />
                вул. Промислова 58
                <br />
                Дрогобицький р-н
                <br />
                Львівська обл.
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Телефон
                </p>
                +38 (096) 812-20-98,
                <br />
                +38 (093) 873-83-94,
                <br />
                +38 (093) 566-66-89
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    E-mail:
                </p>
                <a href="mailto:ukr_root@ukr.net">ukr_root@ukr.net</a>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Як доїхати:
                </p>
                <a href="mailto:ukr_root@ukr.net">ukr_root@ukr.net</a>
            </td>
        </tr>
    </table>
</asp:Content>
