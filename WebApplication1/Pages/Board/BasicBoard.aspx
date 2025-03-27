<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicBoard.aspx.cs" Inherits="WebApplication1.Pages.Board.BasicBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {margin : auto;}

        .container .board-table { width : 99%; text-align :center;}
    </style>

    <div class="container">
        <h3>GridViewTable</h3>

        <asp:GridView ID="GridViewBoard" runat="server" AutoGenerateColumns="false" CssClass="board-table" >
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="번호" SortExpression="ItemID" ItemStyle-Width="5%"/>
                <asp:BoundField DataField="Title" HeaderText="제목" SortExpression="Title" ItemStyle-Width="60%"/>
                <asp:BoundField DataField="CreateUserName" HeaderText="작성자" SortExpression="CreateUserName" ItemStyle-Width="24%" />
                <asp:BoundField DataField="CreateDT" HeaderText="작성날짜" SortExpression="CreateDT" DataFormatString="{0:yyyy-MM-dd}"  ItemStyle-Width="21%" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
