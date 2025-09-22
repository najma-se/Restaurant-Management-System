<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container p-4">
        <h3 class="mb-4">Orders</h3>

        <asp:Repeater ID="rptOrders" runat="server">
            <HeaderTemplate>
                <div class="row g-3">
            </HeaderTemplate>

            <ItemTemplate>
                <div class="col-md-12">
                    <div class="card shadow-sm mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Order #<%# Eval("OrderId") %> - <small class="text-muted">Waiter: <%# Eval("WaiterName") %></small></h5>
                            <p class="card-text">
                                Customer: <%# Eval("CustomerName") %><br />
                                Table: <%# Eval("TableNumber") %><br />
                                Date: <%# Eval("OrderDate") %><br />
                                Total: $<%# Eval("TotalAmount") %>
                            </p>

                            <h6>Items:</h6>
                            <asp:Repeater ID="rptOrderItems" runat="server" DataSource='<%# Eval("OrderItems") %>'>
                                <ItemTemplate>
                                    <p>- <%# Eval("Name") %> x <%# Eval("Quantity") %> ($<%# Eval("Price") %>)</p>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
