<%-- 
    Document   : registratePage
    Created on : Oct 3, 2022, 1:51:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrate New Account Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="_registrate">
            <h1>Create new account</h1>
            <form action="MainController" method="post">
                <input type="text" name="email" placeholder="Input email" required>
                <br>
                <br>
                <input type="password" name="pass" placeholder="Input pass" required>
                <br>
                <br>
                <input type="text" name="fullname" placeholder="Input name" required>
                <br>
                <br>
                <input type="text" name="phone" placeholder="Input phone" required>
                <br>
                <br>
                <br>
                <br>
                <div class="input_submit">
                    <input type="submit" name="action" value="Create Account">
                </div>
            </form>

        </div>
    </body>
</html>
