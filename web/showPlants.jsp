<%-- 
    Document   : showPlants
    Created on : Oct 17, 2022, 9:17:25 AM
    Author     : LENOVO
--%>

<%@page import="dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Plant Page</title>
    </head>
    <body>
        <%@include file="header_loginedUser.jsp"%>

        <div style="padding-bottom: 150px">
            <div style="float: left">
                <h1 style="color: rgb(13, 13, 54);">WELCOME ${sessionScope.user} to PRJ301 PLANTS SHOP|</h1>
            </div>
            <div style="float: right">
                <form action="MainController" method="get">
                    <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch") != null) ? request.getParameter("txtsearch") : ""%>"/>
                    <% //neu nhu  != null(tim kiem) thi giu con lai thi in ra khoang trang %>
                    <input type="submit" name="action" value="Search Plant" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px"/>
                </form>
            </div>
        </div>


        <%
            //xuat plant list
            ArrayList<Plant> kq = (ArrayList) request.getAttribute("result");// tu search servlet
            if (kq != null && kq.size() > 0) {

        %>
        <div style="margin-left: 20%; margin-right: 10%" >
            <table  border="1" width="80%" style="border-collapse: collapse; border: 1px solid activeborder" >
                <tr>
                    <th style="text-align:center" width="5px">ID</th>
                    <th style="text-align:center" width="70px">Name</th>
                    <th style="text-align:center" width="20px">Image</th>
                    <th style="text-align:center" width="10px">Price</th>
                    <th style="text-align:center" width="5px">Add to cart</th>
                </tr>
                <%            for (Plant s : kq) {
                %>


                <tr>

                    <td style="text-align:center"><%= s.getId()%></td>
                    <td style="text-align:center"><%= s.getName()%></td>
                    <td style="text-align:center"><img style="width: 20%" src="<%= s.getImgpath()%>"></td>
                    <td style="text-align:center"><%= s.getPrice()%></td>
                <form action="MainController" method="post">
                    <input type="hidden" value="<%= s.getId()%>" name="id"/>
                    <td style="text-align:center"><input type="submit" value="Add" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10;"/></td>
                </form>
                </tr>


                <%
                    }
                %>
            </table>
        </div>
        <%
            }
        %>


        <%//hien thi thong bao ad them sp vao cart neu co
            String msg = request.getParameter("msg");
            if (msg != null) {
        %>
        <Script>
            alert("added");
        </Script>
        <%
            }
        %>

        <p><a href="MainController?action=View" style="text-decoration: none; border-radius: 7px; background-color: rgb(41, 41, 112); color: white; padding: 5px 5px 5px 5px; margin: 0 30% 0 45%; font-weight: bold">View Cart</a></p>
    </body>
</html>
