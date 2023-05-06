<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        section {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .login-form {
            width: 300px;
            padding: 30px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
        }

        .login-form h2 {
            margin-bottom: 15px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 3px;
            font-size: 14px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #4A90E2;
        }

        .btn {
            margin: 10px;
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4A90E2;
            border: none;
            border-radius: 3px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #3f7dc6;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section>
    <div class="login-form">
        <h2>Services</h2>

        <button class="btn" onclick="window.location.href = 'consultation';">Consultation</button>
        <button class="btn" onclick="window.location.href = 'affectation';">Affectation Des surveillances</button>
        <button class="btn" onclick="window.location.href = 'gestion';">Gestion des profs et modules</button>
    </div>
</section>

</body>
</html>