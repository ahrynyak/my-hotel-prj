<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="MyHotel.LoginForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/loginStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="main_header_div">
            <span class="MainHeaderBigP1">ЗЕЛЕНА </span><span class="MainHeaderBigP2">САДИБА</span>
            <br />
            <span class="MainHeaderSmall">ОЗДОРОВЛЕННЯ ТА ВІДПОЧИНОК</span>
        </div>
        <table width="100%">
            <tr>
                <td align="center">
                    <asp:Login ID="LoginData" runat="server" OnAuthenticate="LoginData_Authenticate"
                        CssClass="loginForm" FailureText="Спроба ввійти не вдалася. Будь ласка, спробуйте ще раз."
                        LoginButtonText="Вхід" PasswordLabelText="Пароль:" PasswordRequiredErrorMessage="Пароль вимагається."
                        RememberMeText="Запам'ятати мене наступного разу." TitleText="Автентифікація"
                        UserNameLabelText="Ім'я:" UserNameRequiredErrorMessage="Ім'я вимагається.">
                        <CheckBoxStyle CssClass="NormalText" />
                        <LabelStyle CssClass="NormalText" Font-Bold="True" HorizontalAlign="Left" />
                        <TitleTextStyle CssClass="NormalText" Font-Bold="True" />
                    </asp:Login>
                </td>
            </tr>
        </table>
    </div>
    </div>
    </form>
</body>
</html>
