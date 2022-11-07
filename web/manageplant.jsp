<%-- 
    Document   : manageplant
    Created on : Oct 30, 2022, 5:59:31 PM
    Author     : LENOVO
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
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
        <h1 style="color: rgb(13, 13, 54); float: left">WELCOME ${sessionScope.user} to PRJ301 Manage Plant|</h1>
        <div style="float: right; text-align: center; margin-bottom: 20px">
            <form action="MainController" method="post">
                <input type="submit" value="Create Plant" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin-top: 30px">
            </form>
        </div>
        <section>
            <%                ArrayList<Plant> result = PlantDAO.showPlants();
                if (result != null || !result.isEmpty()) {
            %>

            <div style="margin-left: 10%; margin-right: 10%; padding-top: 20px" >
                <table border="1" width="100%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
                    <tr>
                        <th>PlantlID</th>
                        <th>Plant Name</th>
                        <th>Price</th>
                        <th>IMG</th>
                        <th>Discription</th>
                        <th>Status</th>
                        <th>CateID</th>
                        <th>Cate Name</th>
                        <th>Create Plants</th>
                    </tr>

                    <%
                        for (Plant plt : result) {
                    %>

                    <tr>
                        <td><%= plt.getId()%></td>
                        <td><%= plt.getName()%></td>
                        <td><%= plt.getPrice()%></td>
                        <td><img style="width: 40px" src="<%= plt.getImgpath()%>"></td>
                        <td><%= plt.getDescription()%></td>
                        <td><%= plt.getStatus()%></td>
                        <td><%= plt.getCateid()%></td>
                        <td><%= plt.getCatename()%></td>
                        <td>
                            <form action="MainController" method="get">
                                <input type="hidden" name="pid" value="<%= plt.getId() %>"/>
                                <input type="submit" value="Plant Updated" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin-top: 30px">
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
    </body>
</html>
