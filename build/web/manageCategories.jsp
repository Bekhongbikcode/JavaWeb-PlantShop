<%-- 
    Document   : manageCategories
    Created on : Nov 1, 2022, 7:21:42 AM
    Author     : LENOVO
--%>

<%@page import="dao.CategoriesDAO"%>
<%@page import="dto.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header_loginedAdmin.jsp" %>
        <h1 style="color: rgb(13, 13, 54); float: left">WELCOME ${sessionScope.user} to PRJ301 Manage Categories|</h1>
        <div style="float: right; text-align: center; margin-bottom: 20px">


            <section>
                <%                ArrayList<Categories> result = CategoriesDAO.showCategories();
                    if (result != null || !result.isEmpty()) {
                %>

                <div style="text-align: center; margin-right: 500px; padding-top: 50px" >
                    <table border="1" width="100%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
                        <tr>
                            <th>Categories ID</th>
                            <th>Categories Name</th>
                            <th>Update Categories</th>
                            <th>Create Categories</th>
                        </tr>

                        <%
                            for (Categories cts : result) {
                        %>

                        <tr>
                            <td><%= cts.getCateid()%></td>
                            <td><%= cts.getCatename()%></td>
                            <td>
                                <form action="MainController" method="get">
                                    <input type="hidden" name="cateid" value="<%= cts.getCateid()%>"/>
                                    <input type="submit" value="Categories Updated" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin-top: 30px">
                                </form>
                            </td>
                            <td>
                                <form action="MainController" method="post">
                                    <input type="submit" value="Create Categories" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin-top: 30px">
                                </form>
                            </td>
                            <%
                                }
                            %>
                    </table>
                </div>

                <%
                } else {
                %>

                <p>You do not have any order</p>
                <%}%>
            </section>
        </div>

    </body>
</html>
