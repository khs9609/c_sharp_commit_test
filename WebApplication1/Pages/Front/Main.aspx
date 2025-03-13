<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Pages.Front.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .front-main  {margin : auto;}
        .front-main .first-contents {display : flex; justify-content : space-around; text-align:center;}
    </style>
    
    <div class="front-main">
        <div class="first-contents">
            <div style="width:20%;background-color:#ddd">테스트 01</div>
            <div style="width:20%;background-color:#ddd">테스트 02</div>
        </div>
        
    </div>
</asp:Content>
