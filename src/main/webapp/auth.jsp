<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,400;0,500;0,600;1,700&display=swap" rel="stylesheet">

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
            flex-direction: column;
        }

        .login-form {
            width: 500px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 4px 6px 19px 0px rgb(99, 136, 166);
        }

        .login-form h1 {
            margin-bottom: 15px;
            text-align: center;
            color: #00718D;
            font-family: 'Montserrat', sans-serif;
            font-size: 30px;
        }

        .form-group {
            margin: 25px 0;
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
            border-color: #00718D;
        }

        .btn {
            display: block;
            margin: 30px 0 0 20%;
            width: 60%;
            padding: 10px;
            background-color: #00718D;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 25px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #FA7F15;
        }

    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="login-form">
    <div style="margin-top: 20px; display: flex; justify-content: center">
        <img src="logo.jpg" alt="logo" height="100">
    </div>
    <h1 style="margin-bottom: 30px; margin-top: 5px" >Welcome to</h1>


    <form action="auth" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
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