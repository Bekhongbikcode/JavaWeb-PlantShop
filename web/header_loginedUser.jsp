<%-- 
    Document   : header_loginedUser
    Created on : Oct 26, 2022, 10:30:18 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <style>
        .header{
            display: flex;
            background-color: rgb(199, 209, 209);
            list-style: none;
            height: 100px;
            padding-top: 30px;
            padding-left: 30px;

        }

        .header li a{
            text-decoration: none;
            padding-right: 80px;
            color:  #006666;
            font-size: 20px;
        }

        .header li a:hover{
            text-decoration: none;
            padding-right: 80px;
            color:  #073c3c;
            font-size: 25px;
        }
    </style>

    <body>
        <nav class="header">
            <li><a href="MainController?action=userHome">Home</a></li>
            <li><a href="MainController?action=userSearchPlant">Search Plant</a></li>
            <li><a href="MainController?action=userViewOrder">View Order</a></li>
            <li><a href="MainController?action=changeProfile">Change Profile</a></li>
            <li><a href="MainController?action=logout">Log out</a></li>
        </nav>
    </body>
</html>
