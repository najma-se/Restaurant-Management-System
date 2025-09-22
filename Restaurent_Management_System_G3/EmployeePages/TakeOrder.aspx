<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePages/Emp.Master" AutoEventWireup="true" CodeBehind="TakeOrder.aspx.cs" Inherits="Restaurent_Management_System_G3.EmployeePages.TakeOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .customBtn{
            background-color: #7B1E23;
            color: white;
        }
    </style>
    
    

    <div class="container p-4">
        <h3 class="fw-bold text-center">MENU</h3>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

        <div class="d-flex justify-content-start mb-4">
            <input type="text" id="txtSearch" class="form-control me-2" 
                    style="width:300px" placeholder="Search menu item..." />
            <button type="button" class="btn customBtn" onclick="filterMenu()">Search</button>
            <button type="button" class="btn btn-secondary ms-2" onclick="clearSearch()">Clear</button>
        </div>
        <asp:Repeater ID="rptCategories" runat="server">
            <ItemTemplate>
                <div class="mb-4 category-block">
                    <h4 class="fw-bold text-danger"><%# Eval("CategoryName") %></h4>
                    <p class="text-muted"><%# Eval("Description") %></p>

                    <asp:Repeater ID="rptMenuItems" runat="server" DataSource='<%# Eval("MenuItems") %>'>
                        <ItemTemplate>
                            <div class="card mb-3 p-3 shadow-sm menu-card">
                                <div class="d-flex align-items-center">
                                    <img src='<%# Eval("ImageUrl") %>' alt="dish" width="80" height="80" class="rounded me-3" />
                                    <div>
                                        <h5 class="card-title mb-1">
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </h5>
                                        <p class="card-text mb-1"><%# Eval("Description") %></p>
                                        <p class="fw-bold text-success mb-1">$<%# Eval("Price") %></p>
                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" 
                                            Text="0" Width="70px" />
                                        <asp:HiddenField ID="hdnMenuId" runat="server" Value='<%# Eval("MenuItemId") %>' />
                                        <asp:HiddenField ID="hdnPrice" runat="server" Value='<%# Eval("Price") %>' />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="Label1" runat="server" CssClass="text-danger"></asp:Label>
        <br />

        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-lg mt-3 fw-bold customBtn" OnClick="btnNext_Click" />
    </div>

    <script>
        function filterMenu() {
            var input = document.getElementById("txtSearch").value.toLowerCase();
            var cards = document.querySelectorAll(".menu-card");

            cards.forEach(function (card) {
                var name = card.querySelector("h5").innerText.toLowerCase();
                var desc = card.querySelector(".card-text").innerText.toLowerCase();

                if (name.includes(input) || desc.includes(input)) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
                }
            });

            // hide categories with no visible cards
            var categories = document.querySelectorAll(".category-block");
            categories.forEach(function (cat) {
                var visibleCards = cat.querySelectorAll(".menu-card:not([style*='display: none'])");
                cat.style.display = visibleCards.length > 0 ? "" : "none";
            });
        }

        function clearSearch() {
            document.getElementById("txtSearch").value = "";
            filterMenu(); // show all
        }
    </script>




</asp:Content>
