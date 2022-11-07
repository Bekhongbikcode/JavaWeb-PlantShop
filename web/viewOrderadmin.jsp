<%-- 
    Document   : viewOrderadmin
    Created on : Oct 29, 2022, 9:47:24 AM
    Author     : LENOVO
--%>

<%@page import="dto.OrderDetail"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Admin Page</title>
    </head>
    <body>
        <%@include file="header_loginedAdmin.jsp" %>
        <h1 style="color: rgb(13, 13, 54);">WELCOME ${sessionScope.user} to PRJ301 OrderDetail|</h1>
        <section>
            <%                ArrayList<OrderDetail> result = OrderDAO.getOrderDetails();
                if (result != null || !result.isEmpty()) {
            %>

            <div style="margin-left: 10%; margin-right: 10%; padding-top: 20px" >
                <table border="1" width="100%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
                    <tr>
                        <th>DetailID</th>
                        <th>OrderID</th>
                        <th>Plant ID</th>
                        <th>Plant Name</th>
                        <th>Price</th>
                        <th>IMG</th>
                        <th>Quantity</th>

                    </tr>

                    <%
                        for (OrderDetail ord : result) {
                    %>

                    <tr>
                        <td><%= ord.getOrderDetailID()%></td>
                        <td><%= ord.getOrderID()%></td>
                        <td><%= ord.getPlantID()%></td>
                        <td><%= ord.getPlantName()%></td>
                        <td><%= ord.getPrice()%></td>
                        <td><img style="width: 200px" src="<%= ord.getImgPath()%>"></td>
                        <td><%= ord.getQuantity()%></td>

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
