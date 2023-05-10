<%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.surveillance.Dto.Affectation" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.Local" %>
<%@ page import="com.example.surveillance.Dto.Tmp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Affectation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        th {
            text-align: center;
        }

        .container {
            margin-top: 10px
        }
        table{
            margin-top: 10px;
        }
    </style>

</head>
<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section class="container">
    <button class="btn btn-primary" onclick="window.history.back()"><i class="fa-solid fa-arrow-right fa-rotate-180"></i> Back</button>

    <form action="affectation" method="POST">
        <table class="table table-bordered">
            <thead>
<%--            <tr>
                <th colspan="6">Annee/session.nom/session.type</th>
            </tr>--%>
            <tr>
                <th>Filiere</th>
                <th>Epreuve</th>
                <th>Date</th>
                <th>Heure</th>
                <th>Duree</th>
                <th style="width: 60%">Locaux</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Affectation> affectations = (List<Affectation>) request.getAttribute("affectations");
                if (affectations != null && !affectations.isEmpty()) {
                    for (Affectation affectation : affectations) { %>
            <tr>
                <td><%= affectation.getFiliere() %>
                </td>
                <td><%= affectation.getModule() %>
                </td>
                <td><%= affectation.getDate() %>
                </td>
                <td>
                    <%= affectation.getHeure() %>
                    <input type="hidden" name="horaireId_<%=affectation.getHoraireId()%>"
                           value="<%=affectation.getHoraireId()%>"/>
                </td>
                <td><%= affectation.getDuree() %>
                </td>
                <td>
                    <div class="form-group">
                        <% List<Local> locals = (List<Local>) request.getAttribute("locals");
                            List<Tmp> horaireLocals = (List<Tmp>) request.getAttribute("horaireLocals");
                            if (locals != null && !locals.isEmpty()) {
                                for (Local local : locals) {
                        %>
                        <label>
                            <input type="checkbox" name="locals_<%=affectation.getHoraireId()%>"
                                   value="<%=local.getId()%>"
                                    <% if (horaireLocals.stream().anyMatch(item -> item.getKey().equals(affectation.getHoraireId()) && item.getValue().equals(local.getNom()))) { %>
                                   checked="checked" <% } %>
                            />
                            <%=local.getNom()%>
                        </label>
                        <%
                            }
                        } else {
                        %>
                        <label>
                            <input type="checkbox" name="locals_<%=affectation.getHoraireId()%>" value="" disabled/>
                            No professors available
                        </label>
                        <%
                            }
                        %>
                    </div>
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
        <button class="btn btn-primary" type="submit">Valider</button>
    </form>
</section>
</body>
</html>
