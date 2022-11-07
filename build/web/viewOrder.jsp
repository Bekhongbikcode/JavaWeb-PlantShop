<%-- 
    Document   : viewOrder
    Created on : Oct 26, 2022, 11:19:12 AM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order User</title>
    </head>
    <body>
        <section>
            <%
                String email = (String) session.getAttribute("user");
                if (email == null) {
            %>
            <p>must login</p>
            <%
            } else
            %>
            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <section>
                <h3>Welcome <%= email%> comeback</h3>
            </section>

            <section>
                <%
                    ArrayList<Order> result = OrderDAO.getOrders(email);
                    String[] status = {"", "Processing", "Complete", "Canceled"};
                    if (result != null || !result.isEmpty()) {
                %>

                <div style="margin-left: 10%; margin-right: 10%" >
                    <table border="1" width="90%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
                        <tr>
                            <th>OrderID</th>
                            <th>Order Date</th>
                            <th>Ship Date</th>
                            <th colspan="2">Order`s Status</th>
                            <th>Action</th>
                        </tr>

                        <%
                            for (Order ord : result) {
                        %>

                        <tr>
                            <td><%= ord.getOrderID()%></td>
                            <td><%= ord.getOrderDate()%></td>
                            <td><%= ord.getShipDate()%></td>
                            <td><%= status[ord.getStatus()]%></td>
                            <td> 
                                <form action="MainController" method="post">
                                    <input type="hidden" name="orderid" value="<%= ord.getOrderID()%>"/>
                                    <input type="hidden"  name="statusorder" value="<%= ord.getStatus()%>"/>
                                    <% if (ord.getStatus() == 1)%> <input type="submit" name="action" value="Cancel" style="color: red; text-decoration: none"></input>
                                    <% if (ord.getStatus() == 3)%> <input type="submit" name="action" value="OrderAgain" style="color: blue; text-decoration: none"></input>
                                </form>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>" style="border-radius: 5px; color: green; padding: 2px 2px; text-decoration: none">Detail</a></td>
                        </tr>

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
