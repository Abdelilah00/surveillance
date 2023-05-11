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

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-image: url("blue.jpg");
            background-color: #d70505;
        }

        .login-form {
            width: 500px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 6px 6px 11px 5px rgb(99, 136, 166);
            background-image: url("blue.jpg");
        }

        .login-form h1 {
            margin-bottom: 15px;
            text-align: center;
        }

        .form-group {
            margin: 20px 0;
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
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4A90E2;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 30px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: rgb(241, 123, 13);
        }
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="login-form">
    <h1>Authentification</h1>
    <form action="auth" method="post">
        <div class="form-group">
            <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password"><i class="fa-solid fa-lock"></i> Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn">Login</button>
    </form>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorMessage") %>
    </p>
    <% } %>

</div>
</body>
</html>