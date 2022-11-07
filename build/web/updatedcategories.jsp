<%-- 
    Document   : updatedcategories
    Created on : Nov 1, 2022, 7:53:30 AM
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
        <form action="MainController" method="post">
            <div style="text-align: center; margin-top: 10%">
                <input type="text" placeholder="Input CateName..." name="txtcatename" style="height: 30px" required>
                <br/>
                <br/>
                <input type="hidden" name ="cateid" value="<%= request.getAttribute("categoriesid")%>">
                <input type="submit" value="UpdatingCate" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px">
            </div>
        </form>
    </body>
</html>
