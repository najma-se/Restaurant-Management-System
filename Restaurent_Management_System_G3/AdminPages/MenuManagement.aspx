<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="MenuManagement.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.MenuManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .customBtn{
            background-color: #7B1E23;
            color: white;
        }
    </style>

    <h3 class="mb-4 fw-bold text-center">Menu Management</h3>
    <div class="d-flex justify-content-start mb-4">
        <input type="text" id="txtSearch" class="form-control me-2" 
                style="width:300px" placeholder="Search menu item..." />
        <button type="button" class="btn customBtn" onclick="filterMenu()">Search</button>
        <button type="button" class="btn btn-secondary ms-2" onclick="clearSearch()">Clear</button>
    </div>
    <asp:HyperLink ID="hlAddMenu" runat="server" NavigateUrl="AddMenuItem.aspx" CssClass="btn btn-success mb-3 fw-bold"> + Add New Dish </asp:HyperLink>

    <div class="container p-4" style="background-color:#f6f6f6; min-height:100vh;">
        <!-- Outer Repeater: Categories -->
        <asp:Repeater ID="rptCategories" runat="server">
            <ItemTemplate>
                <h4 class="mb-3 fw-bold category-block" style="color:#7B1E23;"><%# Eval("CategoryName") %></h4>
                <div class="row g-3">
                    <!-- Inner Repeater: Menu Items per Category -->
                    <asp:Repeater ID="rptMenuItems" runat="server" DataSource='<%# Eval("MenuItems") %>'>
                        <ItemTemplate>
                            <div class="col-md-4 menu-card">
                                <div class="card h-100 shadow-sm">
                                    <img src='<%# string.IsNullOrEmpty(Eval("ImageUrl").ToString()) ? "/images/default-food.jpg" : Eval("ImageUrl") %>' 
                                        class="card-img-top" style="height:180px; object-fit:cover;" />
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Name") %></h5>
                                        <p class="card-text"><%# Eval("Description") %></p>
                                        <p class="fw-bold text-success">$<%# Eval("Price") %></p>
                                        <p>
                                            <span class="badge <%# (bool)Eval("Available") ? "bg-success" : "bg-danger" %>">
                                                <%# (bool)Eval("Available") ? "Available" : "Not Available" %>
                                            </span>
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm"
                                                CommandName="EditDish" CommandArgument='<%# Eval("MenuItemId") %>' OnCommand="btnEdit_Command" />
                                            <asp:Button ID="btnToggle" runat="server" 
                                                Text='<%# (bool)Eval("Available") ? "Set Unavailable" : "Set Available" %>' 
                                                CssClass="btn btn-warning btn-sm"
                                                CommandName="ToggleAvailability" CommandArgument='<%# Eval("MenuItemId") %>' OnCommand="MenuItem_Command" />
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                                                CommandName="DeleteDish" CommandArgument='<%# Eval("MenuItemId") %>' OnCommand="MenuItem_Command" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ItemTemplate>
        </asp:Repeater>
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
