<%-- 
    Document   : viewcart
    Created on : Oct 17, 2022, 5:37:01 PM
    Author     : LENOVO
--%>

<%@page import="dao.PlantDAO"%>
<%@page import="dto.Plant"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart Page</title>
        <Script>
            function warning() {
                var ans = window.confirm("Do you want to delete this item");
                if (ans === true)
                    return true;
                return false;
            }
        </script>
    </head>
    <body>

        <%//lay cart trong session
            HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
            if (cart == null || cart.size() == 0) {
                response.sendRedirect("emptycartnotice.jsp");
            } else {
        %>
        <h1 style="color: rgb(13, 13, 54); text-align: center">Your Cart</h1>
        <table border="1" width="80%" style="border-collapse: collapse; border: 1px solid activeborder;text-align:center">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>IMG</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%        
                int sum = 0;
                for (String i : cart.keySet()) {
                    //lay thong tin sp theo id( bien i)
                    Plant p = PlantDAO.getPlant(Integer.parseInt(i.trim()));
                    sum = sum + p.getPrice() * cart.get(i);
            %>

            <form action="MainController" method="post">
                <tr>
                    <td><%= p.getId()%></td>
                    <td><%= p.getName()%></td>
                    <td><img style="width: 20px" src="<%= p.getImgpath()%>"></td>
                    <td><%= p.getPrice()%></td>
                    <td><input type="number" value="<%= cart.get(i)%>" name="quantity" min="1" max="10" style="text-align: center"></td>
                <input type="hidden" value="<%= p.getId()%>" name="id"/>
                <td><input type="submit" value="UpdateCart" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10;"></td>
                <td>  <input type="submit" value="DeleteCart" name="action" onclick="return warning()" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10;"></td>
                </tr>  
            </form>
            <%
                }

            %>
        </table>
        <h2 style="margin-left: 75%; margin-top: 100px">Total: <%= sum%> VND</h2>
        <form action="MainController" method="post">
            <div style="display: flex; margin-left: 70%">
                <input type="submit" value="Buy" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; height: 30px; width: 80px; margin-right: 20px"/>
                <input type="submit" value="Add more book" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; height: 30px; width: 150px"/>
            </div>
        </form>
        <%}%>

    </body>
</html>
