<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="min-height:100vh; padding:20px;">
        <h2 class="text-center text-white fw-bold mb-4 custom" style="background-color: #7B1E23">Sales & Revenue Reports <br /></h2>
        <div class="container">
        
            <!-- Daily Sales -->
            <h4 class="mt-5 fw-bold"> Daily Sales Report</h4>
            <asp:GridView ID="gvDailySales" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>

            <!-- Monthly/Weekly -->
            <h4 class="mt-5 fw-bold"> Monthly / Weekly Revenue Summary</h4>
            <asp:GridView ID="gvMonthlySales" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>

            <!-- Top Selling Items --> 
            <h4 class="mt-5 fw-bold">Top-Selling Menu Items</h4>
            <asp:GridView ID="gvTopItems" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>

            <!-- Waiter Performance -->
            <h4 class="mt-5 fw-bold">Waiter Performance Report</h4>
            <asp:GridView ID="gvWaiterPerformance" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>
        </div>
    </div>   
</asp:Content>
