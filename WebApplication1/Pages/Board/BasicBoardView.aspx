<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicBoardView.aspx.cs" Inherits="WebApplication1.Pages.Board.BasicBoardView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .board_view {margin : auto; padding :10px; /*background-color : #eeeeee; */ border-radius : 10px ;}
        
        .board_view .board_title_area { border : 1px solid #7e7e7e; border-radius : 5px; padding : 10px 20px; margin-bottom : 10px;}
        .board_view .board_title_area .board_title { }
        .board_view .board_title_area .board_info {display : flex; padding-top : 5px; font-size : 12px; }
        .board_view .board_title_area .board_info .txt_createDT { opacity: .5;}
        .board_view .board_title_area .board_info .txt_createUser { padding-left : 10px; font-weight : bold;}

        .board_view .board_content_area  {}
        .board_view .board_content_area .board_content {border : 1px solid #7e7e7e; min-height : 600px;  border-radius : 5px; padding : 10px 20px;}

        .board_view .board_button_area { padding : 10px 0px; }
        .board_view .board_button_area .board_button { display :flex; justify-content : flex-end; gap : 10px; }
        .board_view .board_button_area .board_button .board_button_control {padding : 5px 20px; background-color : #212529; color : #fff; border-radius : 5px; text-align : center;}

    </style>

    <script>
        function fn_DelConfirm() {
            if (confirm("삭제")) {
                $("#<%=Hidden_Button_Delete.ClientID %>").click();
            }
        }
    </script>
    <div class="board_view">
        <asp:Button ID="Hidden_Button_Delete" runat="server" Text="Hidden" OnClick="btn_Delete_Click" style="display:none;" />

        <div class="board_title_area">
            <div class="board_title">
                <div><asp:Label ID="lb_Title" runat="server" Font-Bold="true" Font-Size="20"></asp:Label></div>
            </div>

            <div class="board_info">
                <div><asp:Label ID="lb_CreateDT" runat="server" CssClass="txt_createDT"></asp:Label></div>
                <div><asp:Label ID="lb_CreateUserName" runat="server" CssClass="txt_createUser"></asp:Label></div> 
            </div>
        </div>

        <div class="board_content_area">
            <div class="board_content">
                <asp:Label ID="lb_Contents" runat="server"></asp:Label>
            </div>
        </div>

        <div class="board_button_area">
            <div class="board_button">
                <% if (CreateUserYN) {  %>
                <asp:Button Text="수정" ID="btn_Modify" CssClass="board_button_control" runat="server" OnClick="btn_Modify_Click"/>
                <asp:Button Text="삭제" ID="btn_Delete" CssClass="board_button_control" runat="server" OnClientClick="fn_DelConfirm();return false;"/>
                <% } %>
                <asp:Button Text="목록" ID="btn_List" CssClass="board_button_control" runat="server" OnClientClick="window.location='BasicBoard_2.aspx'; return false;" />
            </div>
        </div>

    </div>

</asp:Content>
