<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="EditMenuItem.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.EditMenuItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-4">
        <h3>Edit Menu Item</h3>
        <asp:HiddenField ID="hfMenuItemId" runat="server" />

        <div class="mb-3">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label>Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="mb-3">
            <label>Availability</label>
            <asp:CheckBox ID="chkAvailable" runat="server" Text="Available" />
        </div>

        <div class="mb-3">
            <label>Image</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            <asp:Image ID="imgPreview" runat="server" CssClass="img-thumbnail mt-2" Width="150" />
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" PostBackUrl="MenuManagement.aspx" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>
