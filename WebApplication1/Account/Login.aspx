<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="../scripts/jquery-3.7.0.js"></script>
    <script>
        $(function () {

        });

        function emptyChk() {
            let ID = $("#<%=txt_ID.ClientID%>").val();
            let PW = $("#<%=txt_PW.ClientID%>").val();

            if (ID == "" || PW == "") {
                alert("fail");
                return false;
            }
        }
    </script>
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
