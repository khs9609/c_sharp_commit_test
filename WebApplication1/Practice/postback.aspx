<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postback.aspx.cs" Inherits="WebApplication1.Practice.postback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Name : <asp:TextBox ID="name" runat="server" /><br />
            Age: <asp:TextBox ID="age" runat="server" /> <br /><br />
            <asp:Button runat="server" Text="Click" OnClick="btn_Click"/>
        </div>
    </form>
</body>
</html>
