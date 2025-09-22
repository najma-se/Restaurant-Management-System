<%@ Page Title="" Language="C#" MasterPageFile="~/PublicPages/Public.Master" AutoEventWireup="true" CodeBehind="MenuPage.aspx.cs" Inherits="Restaurent_Management_System_G3.PublicPages.MenuPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        html {
          scroll-behavior: smooth;
        }
        body {
            font-family: 'Georgia', serif;
            background-color: #f6f6f6;
        }

        .nav-menu {
            background-color: #a3292f;
            padding: 0.5rem 1rem;
            top: 56px;
        }

        .nav-menu a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
        }

        .nav-menu a.active {
            color: #c03c2d;
            font-weight: bold;
            text-decoration: underline;
        }

        .menu-title {
            text-align: center;
            color: #b23220;
            font-size: 2rem;
            margin-top: 1rem;
        }

        .menu-subtext {
            text-align: center;
            font-style: italic;
            color: #555;
            font-size: 0.9rem;
        }

        .menu-section {
            max-width: 800px;
            margin: 2rem auto;
            border-top: 1px dotted #999;
            padding-top: 2rem;
        }

        .menu-item {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px dotted #ccc;
            padding: 0.5rem 0;
        }

        .menu-item span {
            color: #b23220;
            font-weight: bold;
        }

        .arrow {
            font-size: 2rem;
            color: #b23220;
            cursor: pointer;
        }

        .arrow-container {
            display: flex;
            justify-content: space-between;
            padding: 0 5%;
        }
    </style>

    <!-- Navigation Menu -->
    <!-- Navigation Menu -->
    <div class="nav-menu text-center sticky-top">
        <a href="#breakfast" >Breakfast</a>
        <a href="#lunch">Lunch</a>
        <a href="#dinner">Dinner</a>
        <a href="#dessert">Dessert</a>
        <a href="#brunch">Brunch</a>
        <a href="#beverages">Beverages</a>
    </div>

    <!-- Left and Right Arrows -->
    <div class="arrow-container my-4">
        <div class="arrow">&#8592;</div>
        <div class="arrow">&#8594;</div>
    </div>

    <!-- Breakfast -->
    <div id="breakfast" class="menu-title">Breakfast</div>
    <div class="menu-subtext">
        Monday – Friday | 7:30 a.m. – 10:00 a.m.<br />
        
    </div>


    <!-- Menu Items: Breakfast -->
    <div class="menu-section">
        <h5 class="text-uppercase text-muted">Succo Fresco</h5>
        <div class="menu-item">Orange & Grapefruit <span>$7</span></div>
        <div class="menu-item">Verde | Apple, Fennel, Kale & Parsley <span>$10</span></div>
        <div class="menu-item">Carote | Carrot, Apple & Ginger <span>$10</span></div>

        <h5 class="text-uppercase text-muted mt-4">Pasticcini</h5>
        <div class="menu-item">Olive Oil Muffin <span>$5.5</span></div>
        <div class="menu-item">Croissant <span>$6.5</span></div>
        <div class="menu-item">Blueberry Scone <span>$4.5</span></div>
    </div>

    <!-- Lunch -->
    <div id="lunch" class="menu-section">
        <div class="menu-title">Lunch</div>
        <div class="menu-subtext">
            Monday – Friday | 11:30 a.m. – 2:30 p.m.<br />
            Fresh and seasonal ingredients.
        </div>

        <h5 class="text-uppercase text-muted">Starters</h5>
        <div class="menu-item">Soup of the Day <span>$8</span></div>
        <div class="menu-item">Caesar Salad <span>$10</span></div>
        <div class="menu-item">Bruschetta Trio <span>$9</span></div>

        <h5 class="text-uppercase text-muted mt-4">Mains</h5>
        <div class="menu-item">Grilled Chicken Sandwich <span>$14</span></div>
        <div class="menu-item">Pasta Primavera <span>$16</span></div>
        <div class="menu-item">Beef Burger with Fries <span>$15</span></div>
    </div>

    <!-- Dinner -->
    <div id="dinner" class="menu-section">
        <div class="menu-title">Dinner</div>
        <div class="menu-subtext">
            Monday – Saturday | 5:30 p.m. – 10:00 p.m.<br />
            A perfect end to your day.
        </div>

        <h5 class="text-uppercase text-muted">Appetizers</h5>
        <div class="menu-item">Seared Scallops <span>$18</span></div>
        <div class="menu-item">Stuffed Mushrooms <span>$14</span></div>
        <div class="menu-item">Caprese Salad <span>$12</span></div>

        <h5 class="text-uppercase text-muted mt-4">Entrées</h5>
        <div class="menu-item">Grilled Salmon with Asparagus <span>$28</span></div>
        <div class="menu-item">Ribeye Steak with Garlic Butter <span>$32</span></div>
        <div class="menu-item">Vegetarian Risotto <span>$24</span></div>
    </div>

    <!-- Dessert -->
    <div id="dessert" class="menu-section">
        <div class="menu-title">Dessert</div>
        <div class="menu-subtext">
            Every meal deserves a sweet finish.
        </div>

        <h5 class="text-uppercase text-muted">Sweet Treats</h5>
        <div class="menu-item">Tiramisu <span>$8</span></div>
        <div class="menu-item">Chocolate Lava Cake <span>$9</span></div>
        <div class="menu-item">Panna Cotta <span>$7</span></div>
        <div class="menu-item">Seasonal Fruit Tart <span>$8</span></div>
    </div>

    <!-- Brunch -->
    <div id="brunch" class="menu-section">
        <div class="menu-title">Brunch</div>
        <div class="menu-subtext">
            Saturday & Sunday | 10:00 a.m. – 2:00 p.m.<br />
            A leisurely start to your weekend.
        </div>

        <h5 class="text-uppercase text-muted">Favorites</h5>
        <div class="menu-item">Avocado Toast <span>$12</span></div>
        <div class="menu-item">Eggs Benedict <span>$15</span></div>
        <div class="menu-item">Pancakes with Maple Syrup <span>$14</span></div>
        <div class="menu-item">French Toast <span>$13</span></div>
    </div>

    <!--Beverages -->
    <div id="beverages" class="menu-section">
        <div class="menu-title">Beverages</div>
        <div class="menu-subtext">
            Refresh and unwind.
        </div>

        <h5 class="text-uppercase text-muted">Hot Drinks</h5>
        <div class="menu-item">Espresso <span>$4</span></div>
        <div class="menu-item">Cappuccino <span>$5</span></div>
        <div class="menu-item">Herbal Tea <span>$4.5</span></div>

        <h5 class="text-uppercase text-muted mt-4">Cold Drinks</h5>
        <div class="menu-item">Iced Latte <span>$5</span></div>
        <div class="menu-item">Fresh Lemonade <span>$4.5</span></div>
        <div class="menu-item">Sparkling Water <span>$3.5</span></div>
    </div>

</asp:Content>
