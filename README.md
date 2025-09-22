# Restaurant Management System (RMS)

## Overview
The Restaurant Management System (RMS) is a web-based application built using *ASP.NET Web Forms (C#)* and *SQL Server. It is designed to simplify and digitalize restaurant operations by providing a centralized platform for **administrators* and *employees*.

The system handles:
- Menu management
- Employee management
- Order processing
- Reporting and analytics
- Secure login/logout system

---

##  Features
###  Authentication
- Secure login and logout functionality
- Role-based access (Admin and Employee)

### Admin Module
- Add, edit, and remove menu items
- Manage employee records
- View and process customer orders
- Generate sales reports
- Access messages from (customers)

###  Employee Module
- Can see availble menu
- Take customer orders
- View their order history

###  Public Module
- Contains Home, menu and contact pages
- Customers can communicate the admin throught Contact page
---

## 🛠 Technology Stack
- *Frontend*: ASP.NET Web Forms, Bootstrap
- *Backend*: C# (.NET Framework)
- *Database*: SQL Server
- *Other Tools*: ADO.NET, Dataset Integration

---

##  Project Structure

Restaurent_Management_System_G3/
├── Database/                  ← SQL script for database
├── Restaurent_Management_System_G3.sln
├── Restaurent_Management_System_G3/  ← ASP.NET project code
├── packages/                  ← NuGet packages (ignored by Git)
├── .gitignore



Restaurent_Management_System_G3/
│── AdminPages/       # Admin dashboards and management pages
│── EmployeePages/    # Employee-side pages
│── PublicPages/      # Public side pages
│── App_Code/         # Helper classes (e.g., SecurityHelper.cs)
│── Login.aspx        # Login page
│── Logout.aspx       # Logout page
│── RMSDataSet        # Database dataset integration
│── Global.asax       # Application config

---

## ⚙ Installation & Setup
1. Clone or download this repository.
2. Open the solution file Restaurent_Management_System_G3.sln in *Visual Studio*.
3. Restore NuGet packages if needed (for styling).
4. Configure your *SQL Server connection string* in Web.config.
5. Run the database scripts (if provided) to set up initial tables.
6. Press *F5* or click *Run* in Visual Studio to launch the project.

---

##  User Roles
- *Admin* – full access to menu, employees, orders, and reports.
- *Employee* – can place orders and receive admin messages.

---

### ⚠ Limitations
- No email verification: Admin can register with non-existent emails.
- No external APIs are integrated (e.g., email, SMS, or payment gateways).
- Basic security (authentication works but could be enhanced with hashing & validation).

---

## 📊 Future Improvements
- Stock management
- Add customer-facing online ordering system
- Implement modern frontend (React/Angular/Blazor)
- Enhance reporting with data visualization
- Role-based granular permissions


---

##  License
This project is developed for academic/learning purposes. Modify and extend as needed.

