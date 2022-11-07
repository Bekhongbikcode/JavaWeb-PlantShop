<%-- 
    Document   : orderDetail
    Created on : Oct 26, 2022, 11:39:15 AM
    Author     : LENOVO
--%>

<%@page import="dao.OrderDAO"%>
<%@page import="dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail Page</title>
    </head>
    <body>
        <%@include file="header_loginedUser.jsp" %>

        <%
            String orderid = request.getParameter("orderid");
            if (orderid != null) {
                int orderID = Integer.parseInt(orderid.trim());
                ArrayList<OrderDetail> list = OrderDAO.getOrderDetails(orderID);
                if (list != null && !list.isEmpty()) {
                    int money = 0;
        %>

        <div style="margin-left: 10%; margin-right: 10%; padding-top: 20px" >
            <table border="1" width="90%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
                <tr>
                    <th>OrderID</th>
                    <th>Plant ID</th>
                    <th>Plant Name</th>
                    <th>Img</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>

                <%
                    for (OrderDetail detail : list) {

                %>

                <tr>
                    <td><%= detail.getOrderID()%></td>
                    <td><%= detail.getPlantID()%></td>
                    <td><%= detail.getPlantName()%></td>
                    <td><img style="width: 20px" src="<%= detail.getImgPath()%>"></td>
                    <td><%= detail.getPrice()%> VND</td>
                    <td><%= detail.getQuantity()%></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>

                </tr>

                <%
                    }%>
            </table>
        </div>
        <h3>Total Money: <%=money%> VND</h3>
        <%
        } else {
        %>
        <p>You do not have any order</p>
        <%
                }

            }
        %>
    </body>
</html>
