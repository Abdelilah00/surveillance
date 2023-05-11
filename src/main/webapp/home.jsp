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
            background-image: url("gray (2).jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .login-form {
            width: 600px;
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
            margin: 25px 0;
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5c98de;
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
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section>
    <div class="login-form">
        <h1>Services</h1>
        <button class="btn" onclick="window.location.href = 'consultation';"><i class="fa-regular fa-clipboard"></i>
            Consultation
        </button>
        <button class="btn" onclick="window.location.href = 'affectation';"><i class="fa-regular fa-user"
                                                                               style="color: #f5f5f5;"></i> Affectation
            Des surveillances
        </button>
        <button class="btn" onclick="window.location.href = 'gestion';"><i class="fa-solid fa-book"></i> Gestion des
            profs et modules
        </button>
    </div>
</section>

</body>
</html>