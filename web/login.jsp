<%-- 
    Document   : login
    Created on : Oct 17, 2022, 8:14:26 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="_login">
            <p>LOGIN</p>
            <form action="MainController" method="post">
                <div class="_font01">
                    Email
                </div>
                <input type="text" name="txtemail">
                <br>
                <br>
                <div class="_font02">
                    Password
                </div>
                <input type="password" name="txtpass">
                <br>
                <br>
                <br>
                <br>
                <div class="buttton_here">
                    <input type="submit" value="Login" name="action"/> 
                    <input type="submit" value="Sign Up" name="action"/>
                </div>
                <br>
                <br>
                <div class="link_here">
                    <a href="MainController?action=showPlant">Click here to buy Plants</a>
                </div>
            </form>
        </div>
    </body>
</html>
