<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="AddMenuItem.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.AddMenuItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-4" style="min-height:100vh;">
        <h3>Add New Menu Item</h3>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

        <div class="mb-3">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" />
        </div>

        <div class="mb-3">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                <asp:ListItem Text="-- Select Category --" Value="0" />
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <asp:CheckBox ID="chkAvailable" runat="server" Text="Available" Checked="true" />
        </div>

        <div class="mb-3">
            <label>Image</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnAdd" runat="server" Text="Add Menu Item" CssClass="btn btn-success" OnClick="btnAdd_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" PostBackUrl="MenuManagement.aspx" />

    </div>
</asp:Content>
