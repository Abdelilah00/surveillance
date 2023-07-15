<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,400;0,500;0,600;1,700&display=swap" rel="stylesheet">

    <title>Login Page</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Montserrat', sans-serif;
        }

        section {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .login-form {
            width: 600px;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 4px 6px 19px 0px rgb(99, 136, 166);
        }

        .login-form h1 {
            margin-bottom: 15px;
            text-align: center;
            color: #00718D;
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
            border-color: #00718D;
        }

        .btn {
            margin: 25px;
            display: block;
            width: 90%;
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
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section>
    <div class="login-form">
        <h1>Services</h1>
        <button class="btn" onclick="window.location.href = 'affectation';"><i class="fa-regular fa-user"
                                                                               style="color: #f5f5f5;"></i> Affectation
            Des surveillances
        <button class="btn" onclick="window.location.href = 'consultation';"><i class="fa-regular fa-clipboard"></i>
            Consultation
        </button>

        </button>
        <button class="btn" onclick="window.location.href = 'gestion';"><i class="fa-solid fa-book"></i> Gestion des
            profs et modules
        </button>
    </div>
</section>

</body>
</html>