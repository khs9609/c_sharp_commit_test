<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicBoard_2.aspx.cs" Inherits="WebApplication1.Pages.Board.BasicBoard_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .board-table-area .board-table { width:99%; border:1px solid #303030; border-collapse : collapse;}
    </style>

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
                                <td><%# HttpUtility.HtmlEncode(Eval("ItemID")) %></td>
                                <td><%# HttpUtility.HtmlEncode(Eval("Title")) %></td>
                                <td><%# HttpUtility.HtmlEncode(Eval("CreateUserName")) %></td>
                                <td><%# HttpUtility.HtmlEncode(((DateTime)Eval("CreateDT")).ToString("yyyy-MM-dd")) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </div>

</asp:Content>
