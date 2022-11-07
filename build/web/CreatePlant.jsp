<%-- 
    Document   : CreatePlant
    Created on : Oct 30, 2022, 8:05:29 PM
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
        <h1 style="color: rgb(13, 13, 54);">WELCOME ${sessionScope.user} to PRJ301 Create Plants</h1>
        <form action="MainController" method="post">
            <div style="text-align: center; margin-top: 10%">
                <input type="text" placeholder="Input PlantName..." name="txtpname" style="height: 30px" required>
                <br/>
                <br/>
                <input type="number" placeholder="Input Price..." name="price" style="height: 30px" required>
                <br/>
                <br/>
                <input type="text" placeholder="Input Discription..." name="discript" style="height: 30px" required>
                <br/>
                <br/>
                <input type="number" placeholder="Input Status..." name="statustxt" style="height: 30px" required>
                <br/>
                <br/>
                <input type="number" placeholder="Input Categories ID..." name="catetxt" style="height: 30px" required>
                <br/>
                <br/>
                <input type="submit" value="Plant Created" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px">
            </div>
        </form>
    </body>
</html>
