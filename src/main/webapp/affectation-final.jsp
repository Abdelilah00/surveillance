<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.*" %><%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Affectation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,400;0,500;0,600;1,700&display=swap"
          rel="stylesheet">

    <style>
        th {
            text-align: center;
        }

        .container {
            margin-top: 10px;
        }
        .container-fluid{
            padding: 20px;
        }
        .btn-primary {
            background-color: #00718D;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section class="container-fluid">
    <div class="row d-flex justify-content-between" style="padding: 0 50px">
        <div>
            <div>
                <button class="btn btn-primary" id="printButton"><i class="fa-solid fa-print"></i> Imprimer</button>
                <button class="btn btn-primary" onclick="window.location='gestion'"><i
                        class="fa-solid fa-pen-to-square"></i> Modifier
                </button>
                <button class="btn btn-primary" onclick="window.location='affectation'"><i class="fa-solid fa-link"></i>Affecter
                </button>
            </div>
        </div>

        <form method="POST" action="affectation-final">
            <select name="annee" id="annee">
                <%
                    List<Tmp> annees = (List<Tmp>) request.getAttribute("annees");
                    if (annees != null && !annees.isEmpty()) {
                        for (Tmp annee : annees) { %>
                <option <% if (request.getAttribute("anneeSelected") != null && request.getAttribute("anneeSelected").equals(annee.getKey())) { %>
                        selected <% } %> value="<%=annee.getKey()%>"><%=annee.getValue()%>
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
                <option <% if (request.getAttribute("sessionSelected") != null && request.getAttribute("sessionSelected").equals(session1.getId())) { %>
                        selected <% } %> value="<%=session1.getId()%>"><%=session1.getNom()%> / <%=session1.getType()%>
                </option>
                <% }
                } else { %>
                <option value="" disabled selected>No modules available</option>
                <% } %>
            </select>

            <button class="btn btn-primary" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    </div>

    <table class="table table-bordered table-striped" style="margin-top: 50px; font-size: 14px; display: block; overflow: auto">
        <thead>
        <% List<Consultation> affectations = (List<Consultation>) request.getAttribute("consultations"); %>
        <tr class="table-info">
            <th colspan="<%= affectations.size() +1%>" id="tableHeader">
                <%= request.getAttribute("tableHeader") %>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td  class="table-info">Filiere</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getFiliere() %>
            </td>
            <% } %>
        </tr>
        <tr>
            <td  class="table-info">Epreuve</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getModule() %>
            </td>
            <% } %>
        </tr>
        <tr>
            <td class="table-info">Date</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getDate() %>
            </td>
            <% } %>
        </tr>
        <tr>
            <td class="table-info">Heure</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getHeure() %>
            </td>
            <% } %>
        </tr>
        <tr>
            <td class="table-info">Duree</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getDuree() %>
            </td>
            <% } %>
        </tr>

        <tr>
            <td class="table-info">Nom et Prenom</td>
            <% for (Consultation affectation : affectations) { %>
            <td>
            </td>
            <% } %>
        </tr>

        <% List<Professeur> profs = (List<Professeur>) request.getAttribute("profs"); %>
        <% for (Professeur prof : profs) { %>
        <tr>
            <td class="table-info">
                <%=prof.getNomComplet() %>
            </td>
            <% for (Consultation affectation : affectations) { %>
            <td>
                <%= affectation.getLocalOf(prof.getNom()) %>
            </td>
            <% } %>
        </tr>
        <% } %>
        </tbody>
    </table>
</section>

<script>
    document.getElementById("printButton").addEventListener("click", function () {
        // Get the table HTML
        var tableHtml = document.querySelector("table").outerHTML;

        // Create a print window
        var printWindow = window.open("", "Print");
        printWindow.document.write("<html><head><title>Table</title></head><body>");

        // Add the table HTML to the print window
        printWindow.document.write(tableHtml);

        // Close the print window after the print dialog is closed
        printWindow.onafterprint = function () {
            printWindow.close();
        };

        // Print the window
        printWindow.document.write("</body></html>");
        printWindow.document.close();
        printWindow.print();
    });
</script>
</body>
</html>
