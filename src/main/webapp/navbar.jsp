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
            padding: 0;
            margin: 0;
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
            /*background-color: #ddd;*/
            background-color: #106c93;

            color: black;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>
<%
    String email = (String) request.getSession().getAttribute("email");
    if (email == null) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("auth");
        dispatcher.forward(request, response);
    }
%>
<div class="navbar">
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <a href="consultation"><i class="fa-regular fa-clipboard"></i> Consultation</a>
    <a href="affectation"><i class="fa-regular fa-user" style="color: #f5f5f5;"></i> Affectation</a>
    <a href="gestion"><i class="fa-solid fa-book"></i> Gestion</a>
    <a href="auth"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
</div>
</body>
</html>