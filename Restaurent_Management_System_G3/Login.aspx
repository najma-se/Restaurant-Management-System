<%@ Page Title="" Language="C#" MasterPageFile="~/PublicPages/Public.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Restaurent_Management_System_G3.PublicPages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #f6f6f6;
        }
        .custom-color{
            background-color: #400f12;
        }
        .custom-color:hover {
            background-color: #250103; /* stays same on hover */
            color: #fff; /* keeps text white */
        }
       
        .mb-3 {
            margin-bottom: 1.5rem !important;
        }
    </style>
    <div class="d-flex justify-content-center align-items-center" style="min-height: 100vh; padding-top: 20px; padding-bottom: 60px;">
        <div class="card p-4 m-8" style="width: 100%; max-width: 500px; border-radius: 12px;">
            <div class="text-center ">
                <h1 class="fw-bolder">Login</h1>
            </div>
            <br />

            <!-- Username / Email -->
            <div class="mb-3">
                <asp:Label runat="server" Text="Username" CssClass="form-label" />
                <asp:TextBox ID="TextBox1username" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <asp:Label runat="server" Text="Password" CssClass="form-label" />
                <asp:TextBox ID="TextBox2password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>

            <!-- Show Password -->
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="showPasswordCheck" onclick="togglePassword()">
                <label class="form-check-label" for="showPasswordCheck">Show Password</label>
            </div>

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Log in" CssClass="btn fw-bold text-light custom-color" OnClick="btnLogin_Click" />

             <!-- OR separator -->
            <div class="text-center my-3">
                <span class="text-muted">OR</span>
            </div>

             <!-- Social Login Buttons -->
            <div class="d-grid gap-2 mb-3">
                <button type="button" class="btn btn-outline-danger"><i class="fab fa-google me-2"></i> Continue with Google</button>
            </div>

            <!-- Validation message -->
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-2 d-block text-center"></asp:Label>
        </div>
    </div>

    <script>
    function togglePassword() {
        var passwordInput = document.getElementById('<%= TextBox2password.ClientID %>');
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
    </script>

</asp:Content>
