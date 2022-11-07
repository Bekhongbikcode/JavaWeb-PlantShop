<%-- 
    Document   : changeProfileCustomer
    Created on : Oct 28, 2022, 8:16:20 AM
    Author     : LENOVO
--%>

<%@page import="dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Profile</title>
        
    </head>
    <body>
        <%@include file="header_loginedUser.jsp" %>
        <h1 style="color: rgb(13, 13, 54);">WELCOME ${sessionScope.user} to PRJ301 Change Profile</h1>
        <form action="MainController" method="post">
            <div style="text-align: center; margin-top: 10%">
                <input type="text" placeholder="Input FullName..." name="txtfullname" style="height: 30px" required>
                <br/>
                <br/>
                <input type="text" placeholder="Input Phone..." name="txtphone" style="height: 30px" required>
                <br/>
                <br/>
                <input type="submit" value="Changed Profile" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px">
            </div>
        </form>
    </body>
</html>
