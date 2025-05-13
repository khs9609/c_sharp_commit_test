<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Pages.Front.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .front-main  { margin : auto; text-align:center;}

        .front-main .first-contents                         { margin-bottom:15px; display:flex; justify-content:space-between; }
        .front-main .first-contents > div                   { height:300px; background-color:#ddd; }
        .front-main .first-contents .first-contents-title   { height:20%; background-color:teal; }
        .front-main .first-contents .first-contents-content { height:80%; background-color:lightcoral; }

        .front-main .second-contents    { width : 100% ;height : 300px; background : #ddd; margin : auto;}

    </style>
    
    <div class="front-main">

        <div class="first-contents">
            <div style="width : 35%">
                <div class="first-contents-title">
                    <div><a href="../Board/BasicBoard.aspx"><b><span>GridView 게시판</span></b></a></div>
                    <div><a href="../Board/BasicBoard_2.aspx"><b><span>Table 게시판</span></b></a></div>
                </div>
                <div class="first-contents-content">so</div>
            </div>
            <div style="width : 65%">
                테스트2
            </div>
        </div>

        <div class="second-contents">
            <div>테스트</div>
        </div>

    </div>
</asp:Content>
