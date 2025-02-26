<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lb_ID" runat="server">ID</asp:Label>
            <asp:TextBox ID="txt_ID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lb_PW" runat="server">PW</asp:Label>
            <asp:TextBox ID="txt_PW" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button text="Login" runat="server" OnClientClick="return emptyChk();" OnClick="Login_Click"/>
        </div>
    </form>
</body>
</html>
