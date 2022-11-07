<%-- 
    Document   : searchAccount
    Created on : Oct 17, 2022, 8:49:47 AM
    Author     : LENOVO
--%>

<%@page import="dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Search Account Page</title>
    </head>
    <body>
        <%@include file="header_loginedAdmin.jsp" %>
        <div style="padding: 20px 10px 0 70px">
            <p>Welcome, ${sessionScope.user} to MVC2 Project</p>
        </div>
        <h1 style="color: rgb(13, 13, 54); text-align: center; font-size: 40px; margin-bottom: 0">Search Account</h1>
        <div style="text-align: center; margin-top: 0; margin-bottom: 20px">
            <form action="MainController" method="get">
                Search Value <input type="text" name="search" value="<%=(request.getParameter("search") != null) ? request.getParameter("search") : ""%>" style="width: 50%; height: 30px"/>
                <input type="submit" name="action" value="Search Account" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white; margin: 0 10 0 10; margin-top: 30px; height: 35px"/>
            </form>
        </div>

        <%
            //xuat acc list
            ArrayList<Account> kq = (ArrayList) request.getAttribute("result");
            if (kq != null && kq.size() > 0) {
        %>


        <div style="margin-left: 200px">
            <table  border="1" width="80%" style="border-collapse: collapse; border: 1px solid activeborder">
                <thead>
                    <tr>
                        <th style="text-align:center; width: 20px" >ID</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th style="text-align:center; width: 40px">Phone</th>
                        <th style="text-align:center; width: 10px">Status</th>
                        <th style="text-align:center; width: 10px">Role</th>
                        <th style="text-align:center; width: 10px">Delete</th>
                        <th style="text-align:center; width: 10px">Update</th>
                    </tr>
                </thead>

                <%
                    for (Account acc : kq) {
                %>


                <tbody>
                    <tr>
                        <td><%= acc.getAccid()%></td>
                        <td><%= acc.getEmail()%></td>
                        <td><%= acc.getPassword()%></td>
                        <td><%= acc.getFullname()%></td>
                        <td><%= acc.getPhone()%></td>
                        <td style="text-align: center"><%= acc.getStatus()%></td>
                        <td style="text-align: center"><%= acc.getRole()%></td>
                <form action="MainController" method="post">
                    <input type="hidden" value="<%= acc.getAccid()%>" name="id"/>
                    <input type="hidden" value="<%= acc.getEmail()%>" name="email"/>
                    <input type="hidden" value="<%= acc.getStatus()%>" name="status"/>
                    <input type="hidden" value="<%= acc.getRole()%>" name="role"/>
                    <td style="text-align:center"><input type="submit" value="Ban" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white"/></td>
                    <td style="text-align:center"><input type="submit" value="Unban" name="action" style="border-radius: 7px; background-color: rgb(41, 41, 112); color: white"/></td>
                </form>
                </tr>
                </tbody>


                <%
                    }

                %>

            </table>
        </div>


        <%                        }
        %>
    </body>
</html>
