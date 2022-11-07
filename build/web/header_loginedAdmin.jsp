<%-- 
    Document   : header_loginedAdmin
    Created on : Oct 26, 2022, 11:01:59 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <style>
        .headerAdmin{
            display: flex;
            background-color: rgb(199, 209, 209);
            list-style: none;
            height: 100px;
            padding-top: 30px;
            padding-left: 30px;

        }

        .headerAdmin li a{
            text-decoration: none;
            padding-right: 80px;
            color:  #006666;
            font-size: 20px;
        }

        .headerAdmin li a:hover{
            text-decoration: none;
            padding-right: 80px;
            color:  #073c3c;
            font-size: 25px;
        }
    </style>
    <body>
        <%
            String email = (String) session.getAttribute("user");
            if (email == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>
        
        <nav class="headerAdmin">
            <li><a href="MainController?action=adminHome">Home</a></li>
            <li><a href="MainController?action=adminManageAccount">Manage Account</a></li>
            <li><a href="MainController?action=adminManageOrder">View Orders</a></li>
            <li><a href="MainController?action=adminManagePlant">Manage Plants</a></li>
            <li><a href="MainController?action=adminManageCategories">Manage Categories</a></li>
            <li><a href="MainController?action=logout">Log out</a></li>
        </nav>
        
        <%}
        %>
    </body>
</html>
