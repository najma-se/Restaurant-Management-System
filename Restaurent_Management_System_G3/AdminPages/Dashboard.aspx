<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="mb-4">Dashboard Overview</h2>
    <div class="container">
        <div class="row">
        <!-- Card: Today's Sales -->
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Today's Sales</h5>
                        <p class="card-text" id="lblTodaySales" runat="server">$0</p>
                    </div>
                </div>
            </div>

            <!-- Card: New Messages -->
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">New Messages</h5>
                        <p class="card-text" id="newMessagesCard" runat="server">0</p>
                    </div>
                </div>
            </div>

            <!-- Card: Low Stock -->
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Low Stock Items</h5>
                        <h3 id="newMessagesCard1">0</h3>
                    </div>
                </div>
            </div>

            <!-- Card: Active Orders -->
            <div class="col-md-3 mb-3">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Active Orders</h5>
                        <p class="card-text" id="lblActiveOrders" runat="server">0</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts -->
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card p-3">
                    <h5>Sales Today</h5>
                    <canvas id="salesTodayChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card p-3">
                    <h5>Sales This Month</h5>
                    <canvas id="salesMonthChart"></canvas>
                </div>
            </div>
        </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctxToday = document.getElementById('salesTodayChart').getContext('2d');
        new Chart(ctxToday, {
            type: 'bar',
            data: {
                labels: ['9am', '12pm', '3pm', '6pm', '9pm'],
                datasets: [{
                    label: 'Sales $',
                    data: [50, 75, 60, 90, 120],
                    backgroundColor: 'rgba(123, 30, 35, 0.7)'
                }]
            }
        });

        const ctxMonth = document.getElementById('salesMonthChart').getContext('2d');
        new Chart(ctxMonth, {
            type: 'line',
            data: {
                labels: ['Week1', 'Week2', 'Week3', 'Week4'],
                datasets: [{
                    label: 'Sales $',
                    data: [1200, 1500, 1300, 1700],
                    borderColor: 'rgba(123, 30, 35, 1)',
                    fill: false
                }]
            }
        });
    </script>

</asp:Content>
