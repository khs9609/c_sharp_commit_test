<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicBoardEdit.aspx.cs" Inherits="WebApplication1.Pages.Board.BasicBoardEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .container {margin : auto; }

    .board-edit-area ::placeholder { padding-left : 3px;}

    .board-edit-area .edit-title {margin : 10px 0px 20px 0px;}
    .board-edit-area .edit-content {margin : 10px 0px;}

    .board-btn-area { text-align : right; }
</style>

<script>
    function fn_save() {

    }

    function fn_list() {
        location.href = "./BasicBoard_2.aspx";
    }
</script>
<asp:HiddenField ID="hdf_UserName" runat="server" />

<div class="container">
    <div class="board-edit-area">
        <div class="edit-title">
            <div style="font-weight : bold">제목</div>
            <div><asp:TextBox ID="txt_Title" runat="server" Width="100%" placeholder="제목을 입력하세요"></asp:TextBox></div>
        </div>

        <div class="edit-content">
            <div><asp:TextBox ID="txt_Content" TextMode="MultiLine" Rows="7" runat="server" Width="100%"  placeholder="내용을 입력하세요"></asp:TextBox></div>
        </div>
    </div>

    <div class="board-btn-area">
        <!-- 저장버튼 -->
        <asp:Button ID="btn_Save" Text="저장" runat="server" OnClientClick="" OnClick="btn_Save_Click"/>
        <asp:Button ID="btn_Cancle" Text="취소" runat="server" OnClientClick="fn_list(); return false;" />
    </div>
</div>

</asp:Content>

