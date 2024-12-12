<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Front.aspx.cs" Inherits="WebApplication1.Board.Front" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="../Scripts/jquery-3.7.0.js"></script>
    <title></title>
</head>
<script>
    function emptyChk() {
        if ($("#<%=txt_ID.ClientID%>").val() == "" || $("#<%=txt_PW.ClientID%>").val() == "") {
            alert("retry");
            return false;
        }
    }
</script>
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
            <asp:Button text="Login" runat="server" OnClientClick="return emptyChk();" OnClick="btn_LoginClick"/>
        </div>
    </form>
</body>
</html>
