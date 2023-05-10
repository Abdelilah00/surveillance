<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.*" %>
<%@ page import="com.example.surveillance.Dto.Module" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.Collectors" %><%--
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

        /* Style for the row container */
        /*    .row {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }*/

        /* Style for the form */
        .container {
            padding: 10px;
        }

        form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 80%;
            max-width: 500px;
            padding: 20px;
            background-color: #f8f8f8;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        /* Style for the form heading */
        form h3 {
            margin-top: 0;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }

        /* Style for the form inputs */
        .form-group {
            margin-bottom: 10px;
            width: 100%;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Style for the form submit button */
        button[type="submit"] {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0069d9;
        }

        /* Style for the error message */
        p {
            margin: 15px 0;
            color: red;
            font-size: 16px;
        }

    </style>
</head>

<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section class="container">
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
                            <option value="<%=module.getId()%>"><%=module.getNom()%>
                            </option>
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
                    <input type="hidden" name="action" value="updateModule">

                    <div class="form-group">
                        <select name="professeur">
                            <%
                                List<Professeur> professeurs = (List<Professeur>) request.getAttribute("professeurs");
                                if (professeurs != null && !professeurs.isEmpty()) {
                                    for (Professeur professeur : professeurs) { %>
                            <option value="<%=professeur.getId()%>"><%=professeur.getNom()%>
                            </option>
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
                            <option value="<%=module.getId()%>"><%=module.getNom()%>
                            </option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No modules available</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Changer</button>
                    <% if (request.getAttribute("errorUpdateRespoModuleMessage") != null) { %>
                    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorUpdateRespoMessage") %>
                    </p>
                    <% } %>
                </form>
            </div>

            <div class="row">
                <form action="gestion" method="post">
                    <h3>Changer responsable de filiere</h3>
                    <input type="hidden" name="action" value="updateFiliere">

                    <div class="form-group">
                        <select name="professeur">
                            <% if (professeurs != null && !professeurs.isEmpty()) {
                                for (Professeur professeur : professeurs) { %>
                            <option value="<%=professeur.getId()%>"><%=professeur.getNom()%>
                            </option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No professors available</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <select name="filiere">
                            <%
                                List<Tmp> filieres = (List<Tmp>) request.getAttribute("filieres");
                                if (filieres != null && !filieres.isEmpty()) {
                                    for (Tmp filiere : filieres) { %>
                            <option value="<%=filiere.getKey()%>"><%=filiere.getValue()%>
                            </option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No modules available</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Changer</button>
                    <% if (request.getAttribute("errorUpdateRespoFiliereMessage") != null) { %>
                    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorUpdateRespoMessage") %>
                    </p>
                    <% } %>
                </form>
            </div>

            <div class="row">
                <form action="gestion" method="post">
                    <h3>Changer responsable de locale</h3>
                    <input type="hidden" name="action" value="updateLocal">

                    <div class="form-group">
                        <select name="professeur">
                            <% if (professeurs != null && !professeurs.isEmpty()) {
                                for (Professeur professeur : professeurs) { %>
                            <option value="<%=professeur.getId()%>"><%=professeur.getNom()%>
                            </option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No professors available</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <select name="local">
                            <%
                                List<Local> locals = (List<Local>) request.getAttribute("locals");
                                if (locals != null && !locals.isEmpty()) {
                                    for (Local module : locals) { %>
                            <option value="<%=module.getId()%>"><%=module.getNom()%>
                            </option>
                            <% }
                            } else { %>
                            <option value="" disabled selected>No modules available</option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Changer</button>
                    <% if (request.getAttribute("errorUpdateRespoLocaleMessage") != null) { %>
                    <p style="color: red; margin-top: 15px;"><%= request.getAttribute("errorUpdateRespoMessage") %>
                    </p>
                    <% } %>
                </form>
            </div>
        </div>

        <div class="col-8">
            <%
                List<ProfAndModule> profAndModules = (List<ProfAndModule>) request.getAttribute("profAndModules");
                if (profAndModules != null && !profAndModules.isEmpty()) {
                    // Group the ProfAndModule objects by session name
                    Map<String, List<ProfAndModule>> groups = profAndModules.stream()
                            .collect(Collectors.groupingBy(ProfAndModule::getSession));

                    // Loop over the groups and create a table for each session name
                    for (Map.Entry<String, List<ProfAndModule>> entry : groups.entrySet()) {
                        String sessionName = entry.getKey();
                        List<ProfAndModule> sessionData = entry.getValue();
            %>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th colspan="6"><h3><%= sessionName %>
                    </h3>
                    </th>
                </tr>
                <tr>
                    <th>numero</th>
                    <th>Nom et prenom</th>
                    <th>Module</th>
                    <th>filiére</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% for (ProfAndModule profAndModule : sessionData) { %>
                <tr>
                    <td><%= profAndModule.getNumero() %>
                    </td>
                    <td><%= profAndModule.getNomAndPrenom() %>
                    </td>
                    <td><%= profAndModule.getModule() %>
                    </td>
                    <td><%= profAndModule.getFiliere() %>
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteModule('<%= profAndModule.getModule() %>')">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%
                }
            } else { %>
            <p>No data available</p>
            <%
                } %>
        </div>
    </div>
</section>
<script>
    function deleteModule(moduleName) {
        fetch('gestion?action=delete-module-respo&moduleName=' + moduleName, {
            method: 'POST',
        })
            .then(response => {
                // Handle the response
                window.location.reload(); // Reload the current page
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>
</body>
</html>
