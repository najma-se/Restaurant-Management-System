<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePages/Emp.Master" AutoEventWireup="true" CodeBehind="SubmitOrder.aspx.cs" Inherits="Restaurent_Management_System_G3.EmployeePages.SubmitOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-4">
        <h3 class="mb-4">Submit Order</h3>

        <!-- Order Summary Section -->
        <div class="mb-4">
            <h5>Order Summary</h5>
            <asp:Repeater ID="rptOrderItems" runat="server">
                <ItemTemplate>
                    <div class="card mb-2 shadow-sm">
                        <div class="card-body d-flex justify-content-between">
                            <div>
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="mb-1">Quantity: <%# Eval("Quantity") %></p>
                                <p class="mb-0">Price: $<%# Eval("Price") %></p>
                            </div>
                            <div class="text-end">
                                <h6 class="text-success">$<%# Convert.ToDecimal(Eval("Quantity")) * Convert.ToDecimal(Eval("Price")) %></h6>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Total -->
            <div class="alert alert-info mt-3">
                <strong>Total: </strong> $<asp:Label ID="lblTotalAmount" runat="server" />
            </div>
        </div>

        <!-- Customer Info Section -->
        <h5>Customer & Table Information</h5>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

        <div class="mb-3">
            <label>Customer Name</label>
            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Table Number</label>
            <asp:TextBox ID="txtTableNumber" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" CssClass="btn btn-success" OnClick="btnSubmitOrder_Click" />
    </div>
</asp:Content>
