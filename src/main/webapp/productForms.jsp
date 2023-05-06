<%@ page import="com.example.surveillance.Dto.ProfAndModule" %><%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 05/05/2023
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Update Product Form -->
<!-- Update Product Form -->
<% ProfAndModule product = (ProfAndModule) request.getAttribute("product"); %>
<form action="YourServlet" method="post">
  <input type="hidden" name="action" value="update">
  <label for="updateId">ID:</label>
  <input type="number" name="updateId" id="updateId" value="<%= product != null ? product.getId() : "" %>" required readonly>
  <label for="updateName">Name:</label>
  <input type="text" name="updateName" id="updateName" value="<%= product != null ? product.getName() : "" %>" required>
  <label for="updatePrice">Price:</label>
  <input type="number" step="0.01" name="updatePrice" id="updatePrice" value="<%= product != null ? product.getPrice() : "" %>" required>
  <button type="submit">Update Product</button>
</form>

<% if (request.getAttribute("errorMessage") != null) { %>
<p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>

<!-- Insert Product Form -->
<form action="YourServlet" method="post">
  <input type="hidden" name="action" value="insert">
  <label for="insertName">Name:</label>
  <input type="text" name="insertName" id="insertName" required>
  <label for="insertPrice">Price:</label>
  <input type="number" step="0.01" name="insertPrice" id="insertPrice" required>
  <button type="submit">Insert Product</button>
</form>

</body>
</html>
