<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/admin.Master" AutoEventWireup="true" CodeBehind="EmployeeM.aspx.cs" Inherits="Restaurent_Management_System_G3.AdminPages.EmployeeM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row m-3">
            
            <!-- Left Form -->
            <div class="col-md-6 shadow-sm p-3">
                <h1>Employee Registration</h1>
                <br />

                ID  
                <asp:TextBox ID="txtId" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>

                Username  
                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>

                Password  
                <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>

                Name  
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>

                Email  
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" EnableClientScript="False" ErrorMessage="Email is Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
&nbsp;          <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>

                Role  
                <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server">
                    <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Waiter" Value="Waiter"></asp:ListItem>
                </asp:DropDownList>

                <br />

                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnUpdate" CssClass="btn btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />

                <br /><br />
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
            </div>

            <!-- Right Grid -->
            <div class="col-md-6 shadow-sm p-3">
                <h1>Registered Employees</h1>
                <br /> 
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateSelectButton="True"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    CssClass="table table-bordered table-hover" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
