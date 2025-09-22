<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePages/Emp.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="Restaurent_Management_System_G3.EmployeePages.ViewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function printReceipt(receiptId) {
            var receiptContent = document.getElementById(receiptId).innerHTML;
            var originalContent = document.body.innerHTML;

            document.body.innerHTML = "<h2 style='text-align:center;'>Restaurant Receipt</h2>" + receiptContent;
            window.print();
            document.body.innerHTML = originalContent;
            location.reload(); // reload to restore scripts and styles
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4 fw-bold">ORDER HISTORY</h2>
        <div class="card-body" id="receipt_<%# Eval("OrderId") %>"> 
            <asp:Repeater ID="rptOrders" runat="server" OnItemDataBound="rptOrders_ItemDataBound">
                <ItemTemplate>
                    <div class="card mb-4 shadow-sm">
                        <div class="card-header text-white" style="background-color: #7B1E23">
                            <h5 class="mb-0">
                                Order #<%# Eval("OrderId") %> - Table <%# Eval("TableNumber") %>
                            </h5>
                            <h5 class="card-title"><small class=" text-white fw-bold">Waiter: <%# Eval("WaiterName") %></small></h5>

                        </div>
                        <div class="card-body" id="receipt_<%# Eval("OrderId") %>">

                            <p><strong>Customer:</strong> <%# Eval("CustomerName") %></p>
                            <p><strong>Date:</strong> <%# Eval("OrderDate") %></p>
                            <p><strong>Total Bill:</strong> $<%# Eval("TotalAmount") %></p>

                            <h6 class="fw-bold mt-3">Ordered Items:</h6>
                            <asp:Repeater ID="rptOrderItems" runat="server">
                                <HeaderTemplate>
                                    <ul class="list-group">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <%# Eval("Name") %> (x<%# Eval("Quantity") %>)
                                        <span class="badge bg-success">$<%# Eval("Price") %></span>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div class="text-end mt-3">
                                <button type="button" class="btn btn-primary text-white fw-bold" onclick="printReceipt('receipt_<%# Eval("OrderId") %>')">
                                    Print Receipt
                                </button>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        
    </div>

    

</asp:Content>
