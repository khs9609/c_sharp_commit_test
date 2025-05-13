<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicBoard_2.aspx.cs" Inherits="WebApplication1.Pages.Board.BasicBoard_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .board-table-area .board-table { width:100%; border:1px solid #303030; border-collapse : collapse; }
        .board-table-area .board-table tr { text-align : center;}
        .board-table-area .board-table th,td { padding : 5px;}
        .board-table-area .board-table th,td a { color : #000 ;text-decoration : none; }

        .board-btn-area { text-align : right; margin-top :10px;}
        .board-btn-area button,input { padding : 5px 20px; background-color : #212529; color : #fff; border-radius : 5px; text-align : center; }
        /* padding : 5px 20px; background-color : #000; color : #fff; border-radius : 5px; text-align : center; */

    </style>

    <script>
        function fn_write() {
            location.href = "./BasicBoardEdit.aspx";
        }
    </script>
    <div class="container">
        <h3>Repeat Control</h3>
        
        <div class="board-table-area">
            <table class="board-table">
                <colgroup>
                    <col width="5%"/>
                    <col width="60%"/>
                    <col width="15%"/>
                    <col width="20%"/>
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptBasicBoard" runat="server" ItemType="DBCon.Board.BoardEntity" >
                        <ItemTemplate>
                            <tr>
                                <td class="tb_data"><%# HttpUtility.HtmlEncode(Eval("ItemID")) %></td>
                                <td class="tb_data" style="text-align:left;"><a href="./BasicBoardView.aspx?ItemID=<%# HttpUtility.HtmlEncode(Eval("ItemID")) %>"> <%# HttpUtility.HtmlEncode(Eval("Title")) %> </a></td>
                                <td class="tb_data"><%# HttpUtility.HtmlEncode(Eval("CreateUserName")) %></td>
                                <td class="tb_data"><%# HttpUtility.HtmlEncode(((DateTime)Eval("CreateDT")).ToString("yyyy-MM-dd")) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <div class="board-btn-area">
            <div>
                <asp:Button Text="작성" runat="server" OnClientClick="fn_write();return false;"/>
            </div>
        </div>

    </div>

</asp:Content>
