<%@ page import="com.example.surveillance.Dto.Consultation" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.Tmp" %>
<%@ page import="com.example.surveillance.Dto.Session" %><%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultation</title>
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
<div class="container-fluid">
    <div class="row d-flex justify-content-between">
        <div>
            <button class="btn btn-primary" onclick="console.log('create a function that export this table')">Imprimer
            </button>
            <button class="btn btn-primary" onclick="window.location='affectation'">modifier</button>
            <button class="btn btn-primary" onclick="window.location='affectation'">affecter</button>
        </div>

        <div>
            <select name="annee" id="annee">
                <%
                    List<Tmp> annees = (List<Tmp>) request.getAttribute("annees");
                    if (annees != null && !annees.isEmpty()) {
                        for (Tmp module : annees) { %>
                <option value="<%=module.getValue()%>"><%=module.getValue()%>
                </option>
                <% }
                } else { %>
                <option value="" disabled selected>No modules available</option>
                <% } %>
            </select>

            <select name="session" id="session">
                <%
                    List<Session> sessions = (List<Session>) request.getAttribute("sessions");
                    if (sessions != null && !sessions.isEmpty()) {
                        for (Session session1 : sessions) { %>
                <option value="<%=session1.getId()%>"><%=session1.getNom()%> / <%=session1.getType()%>
                </option>
                <% }
                } else { %>
                <option value="" disabled selected>No modules available</option>
                <% } %>
            </select>

            <button class="btn btn-primary" onclick="console.log('search')">search icon</button>
        </div>
    </div>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th colspan="6" id="tableHeader">Annee / session.nom / session.type</th>
        </tr>
        <tr>
            <th>Filiere</th>
            <th>Epreuve</th>
            <th>Date</th>
            <th>Heure</th>
            <th>Duree</th>
            <th>Locaux</th>
            <th>Nbs</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Consultation> consultations = (List<Consultation>) request.getAttribute("consultations");
            if (consultations != null && !consultations.isEmpty()) {
                for (Consultation consultation : consultations) { %>
        <tr>
            <td><%= consultation.getFiliere() %>
            </td>
            <td><%= consultation.getModule() %>
            </td>
            <td><%= consultation.getDate() %>
            </td>
            <td><%= consultation.getHeure() %>
            </td>
            <td><%= consultation.getDuree() %>
            </td>
            <td><%= consultation.getFormattedLocals() %>
            </td>
            <td><%= consultation.getNbs() %>
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
    <script>

    </script>
</div>
</body>

</html>
