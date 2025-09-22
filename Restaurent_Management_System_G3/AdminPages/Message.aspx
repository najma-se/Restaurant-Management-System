<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<div class="container my" >
    <h2 class="mb-4 fw-bold">Messages</h2>
    <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand"  CssClass="table table-striped table-bordered table-hover" HeaderStyle-CssClass="table-blue"
        PagerStyle-CssClass="d-flex justify-content-center">
    </asp:GridView>
</div>
    

    
</asp:Content>
