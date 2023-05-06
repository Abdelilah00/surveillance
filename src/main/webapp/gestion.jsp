<%@ page import="com.example.surveillance.Dto.ProfAndModule" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.Module" %>
<%@ page import="com.example.surveillance.Dto.Professeur" %><%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        th {
            text-align: center;
        }

        .container {
            margin: 10px
        }
    </style>
</head>

<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section class="container-fluid">
    <div class="row">
        <div class="col-4">
            <div class="row">
                <form action="gestion" method="post">
                    <h3>Ajouter un nouveau Prof</h3>
                    <input type="hidden" name="action" value="addProf">
                    <div class="form-group">
                        <input type="text" id="nom" name="nom" placeholder="nom" required>
                    </div>
                    <div class="form-group">
                        <input type="text" id="prenom" name="prenom" placeholder="prenom" required>
                    </div>

                    <div class="form-group">
                        <select name="module">
                            <%
                                List<Module> modules = (List<Module>) request.getAttribute("modules");
                                if (modules != null && !modules.isEmpty()) {
                                    for (Module module : modules) { %>
                            <option value="<%=module.getId()%>"><%=module.getNom()%></option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No modules available</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Ajouter Prof</button>
                    <% if (request.getAttribute("errorAddProfMessage") != null) { %>
                    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorAddProfMessage") %>
                    </p>
                    <% } %>
                </form>
            </div>
            <div class="row">
                <form action="gestion" method="post">
                    <h3>Changer responsable de module</h3>
                    <input type="hidden" name="action" value="updateRespo">

                    <div class="form-group">
                        <select name="professeur">
                            <%
                                List<Professeur> professeurs = (List<Professeur>) request.getAttribute("professeurs");
                                if (professeurs != null && !professeurs.isEmpty()) {
                                    for (Professeur professeur : professeurs) { %>
                            <option value="<%=professeur.getId()%>"><%=professeur.getNom()%></option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No professors available</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <select name="module">
                            <%
                                if (modules != null && !modules.isEmpty()) {
                                    for (Module module : modules) { %>
                            <option value="<%=module.getId()%>"><%=module.getNom()%></option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No modules available</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Changer</button>
                    <% if (request.getAttribute("errorUpdateRespoMessage") != null) { %>
                    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorUpdateRespoMessage") %>
                    </p>
                    <% } %>
                </form>
            </div>
        </div>

        <div class="col-8">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th colspan="6">Session name</th>
                </tr>
                <tr>
                    <th>numero</th>
                    <th>Nom et prenom</th>
                    <th>Module</th>
                    <th>filiére</th>
                    <th>session</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<ProfAndModule> profAndModules = (List<ProfAndModule>) request.getAttribute("profAndModules");
                    if (profAndModules != null && !profAndModules.isEmpty()) {
                        for (ProfAndModule profAndModule : profAndModules) { %>
                <tr>
                    <td><%= profAndModule.getNumero() %></td>
                    <td><%= profAndModule.getNomAndPrenom() %></td>
                    <td><%= profAndModule.getModule() %></td>
                    <td><%= profAndModule.getFiliere() %></td>
                    <td><%= profAndModule.getSession() %></td>
                    <td>
                        <button class="btn btn-danger">Delete</button>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="6" class="text-center">No data available</td>
                </tr>
                <% } %>
                </tbody>
            </table>


        </div>
    </div>
</section>
</body>
</html>
