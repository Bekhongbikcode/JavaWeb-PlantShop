<%-- 
    Document   : createCategories
    Created on : Nov 1, 2022, 7:38:23 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header_loginedAdmin.jsp" %>
        <form action="MainController" method="get">
            <div style="text-align: center; margin-top: 10%">
            <input type="text" name="txtcate" placeholder="Input CategoriesName....." required>
            <br/>
            <br/>
            <input type="submit" value="Create New Categories" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px">
            </div>
        </form>
    </body>
</html>
