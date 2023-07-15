<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.*" %>

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

        .container-fluid {
            padding: 20px;
        }

        .btn-primary {
            background-color: #00718D;
        }
    </style>

    <style id="table_style">
        table {
            margin-top: 50px;
            font-size: 14px;
            display: block;
            overflow: auto;
            background-color: #f9f9f9;
            border-radius: 4px;
            border-collapse: collapse;
        }

        table tbody tr:nth-of-type(odd) {
            background-color: #dee2e6;
        }

        table, td, th {
            border: 1px solid;
        }

        table tr:first-child {
            background-color: #bee5eb; /* Apply table-info style to the first row */
        }
        table tr td:first-child {
            background-color: #bee5eb; /* Apply table-info style to the first column */
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
    </div>

    <div id="tableContainer">
        <table>
            <thead>
            <% List<Consultation> affectations = (List<Consultation>) request.getAttribute("consultations"); %>
            <tr>
                <th colspan="<%= affectations.size() +1%>" id="tableHeader">
                    <%= request.getAttribute("tableHeader") %>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Filiere</td>
                <% for (Consultation affectation : affectations) { %>
                <td>
                    <%= affectation.getFiliere() %>
                </td>
                <% } %>
            </tr>
            <tr>
                <td>Epreuve</td>
                <% for (Consultation affectation : affectations) { %>
                <td>
                    <%= affectation.getModule() %>
                </td>
                <% } %>
            </tr>
            <tr>
                <td>Date</td>
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
                <td>Nom et Prenom</td>
                <% for (Consultation affectation : affectations) { %>
                <td>
                </td>
                <% } %>
            </tr>

            <% List<Professeur> profs = (List<Professeur>) request.getAttribute("profs"); %>
            <% for (Professeur prof : profs) { %>
            <tr>
                <td>
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
    </div>
</section>

<script>
    document.getElementById("printButton").addEventListener("click", function () {
        // Get the table HTML
        var tableHtml = document.querySelector("#tableContainer").innerHTML;

        // Create a print window
        var printWindow = window.open("", "Print");
        var table_style = document.getElementById("table_style").innerHTML;
        printWindow.document.write("<html><head><title>Table</title><style type = \"text/css\">" + table_style + "</style></head><body>");

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
