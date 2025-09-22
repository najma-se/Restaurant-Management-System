<%@ Page Title="" Language="C#" MasterPageFile="~/PublicPages/Public.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="Restaurent_Management_System_G3.PublicPages.ContactPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: white;
        }
    </style>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-lg-7">
                <div class="card shadow-lg rounded-3 border-0" style="background-color: white;">
                    <div class="card-body p-5">
                        <h2 class="card-title text-center fw-bold mb-4">Contact Us</h2>
                        <h5 class="text-center text-muted mb-4">Leave a Comment</h5>

                        <div class="mb-4">
                            <label for="TextBoxMessage" class="form-label fw-semibold">Message</label>
                            <asp:TextBox ID="TextBoxMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control form-control-lg rounded-3 shadow-sm"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="TextBoxName" class="form-label fw-semibold">Name</label>
                            <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control form-control-lg rounded-3 shadow-sm"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="TextBoxEmail" class="form-label fw-semibold">Email</label>
                            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control form-control-lg rounded-3 shadow-sm"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label for="TextBoxWebsite" class="form-label fw-semibold">Website</label>
                            <asp:TextBox ID="TextBoxWebsite" runat="server" CssClass="form-control form-control-lg rounded-3 shadow-sm"></asp:TextBox>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="btn btn-dark btn-lg fw-bold px-5 rounded-pill" OnClick="btnSubmit_Click" />
                            <asp:Label ID="LabelMessage" runat="server" CssClass="ms-3 align-self-center text-success fw-semibold"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br /> <br />

</asp:Content>
