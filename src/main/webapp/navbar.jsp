<%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- navbar.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>

    <style>
        .navbar {
            background-color: #333;
            overflow: hidden;
            display: flex;
            justify-content: end;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="home.jsp">Home</a>
    <a href="consultation">Consultation</a>
    <a href="affectation">Affectation</a>
    <a href="gestion">Gestion</a>
    <a href="auth.jsp">logout</a>
</div>
</body>
</html>