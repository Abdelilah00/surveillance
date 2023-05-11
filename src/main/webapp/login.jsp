<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

   <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <!--Stylesheet-->
    <style media="screen">
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color : #dcdcdc ; 
    
}
.background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 150px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: white ;
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: white ;
    right: -30px;
    bottom: -80px;
}
form{
    height: 340px;
    width: 500px;
    background-image:  url("gray (2).jpg");
    background-repeat: no-repeat;
    background-size: cover;
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border-top: 5px solid #6495ED;
    border-bottom: 5px solid #6495ED;
    border-left: 5px solid #FF8C00;
    border-right: 5px solid #FF8C00;
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
form *{
    font-family: 'Poppins',sans-serif;
    color: black;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}
h4{
color : #6495ED;
margin-left : 50px;
}
label{
    display: block;
    margin-top: 10px;
    font-size: 16px;
    font-weight: 500;
}
input{
    display: block;
    height: 30px;
    width: 100%;
    
    background-color:white ;
    border-radius: 0px;
    padding: 0 10px;
    margin-top: 4px;
    font-size: 14px;
    font-weight: 200;
}
::placeholder{
    color: black;
}
button{
    margin-top: 30px;
    margin-left: 75px;
    width: 60%;
    position : center;
    height: 15%;
    background-color: #6495ED;
    color: black;
    padding: 0px 0;
    font-size: 18px;
    font-weight: 500;
    border-radius: 5px;
    cursor: pointer;
}
button:hover{
    background-color :#FF8C00;

}
header{
width: 100%;
height: 85px;
background : #A9A9A9;

}
img{
height: 75px;
width: 12%;
margin-left : 580px;
}
p{
text-align:center ;
padding-top:30px;
color: red;
}



    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<header> <img src="image/logo_umi.png"  width="600" height="400"></header>
  <form method="POST" action="servlet1">
        <h4>Service Central d'Authentification</h4>

        <label for="mail">Email<i class=" fa fa-envelope"></i></label>
        
        <input type="email" placeholder="Saisir mail" name="mail" id="mail"  required>

        <label for="password">Mot de passe<i class=" fa fa-lock"></i></label>
        <input type="password" placeholder="Saisir mot de passe" name="password" id="password" required >
        

        <button>Se connecter
        <i class=" fa fa-chevron-right" ></i>
        </button>
        
          <% String message = (String) request.getAttribute("message"); %>
          <p><%= message %></p>
        
        
    </form>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
         var status = document.getElementById("status").value;
         if(status == "failed"){
        	 swal("desolé","mail ou mot de passe incorrecte","failed");
         }
         
    </script>
</body>
</html>