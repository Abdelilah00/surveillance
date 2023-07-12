<%--
  Created by IntelliJ IDEA.
  User: AbdelilahDehaoui
  Date: 04/05/2023
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.surveillance.Dto.*" %>
<%@ page import="com.example.surveillance.AffectationServlet" %>
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
            margin-top: 10px
        }

        table {
            margin-top: 70px;
            border-radius: 6px;
        }

        .btn-primary {
            background-color: #00718D;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .table-responsive {
            width: 100%;
            overflow-y: auto;
            margin: 0;
            padding: 0;
        }

        input[type="checkbox"] {
            height: 50px;
            width: 50px;
            margin-left: 25px;
        }
    </style>

</head>
<body>
<header>
    <jsp:include page="navbar.jsp"/>
</header>
<section class="container">
    <button class="btn btn-primary" onclick="window.history.back()"><i
            class="fa-solid fa-arrow-right fa-rotate-180"></i> Back
    </button>
    <table class="table table-bordered table-striped">
        <thead>
        <%--            <tr>
                        <th colspan="6">Annee/session.nom/session.type</th>
                    </tr>--%>
        <tr class="table-info">
            <th>Filiere</th>
            <th>Epreuve</th>
            <th>Date</th>
            <th>Heure</th>
            <th>Duree</th>
            <th>Options</th>
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
            <td style="justify-content: center">
                <button class="btn btn-primary"
                        onclick="loadCartesianData(event,'<%= affectation.getHoraireId() %>')">
                    Affectation
                </button>
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

    <button class="btn btn-primary" onclick="window.location.href='affectation-final'">Valider</button>
</section>

<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="table-responsive">
            <form action="affectation" method="post">
                <input type="hidden" name="horaireId" id="horaireId">
                <table class="table table-bordered table-striped">
                    <%
                        List<Local> locals = (List<Local>) request.getAttribute("locals");
                        List<Professeur> professeurs = (List<Professeur>) request.getAttribute("professeurs");
                    %>
                    <thead>
                    <tr>
                        <th></th> <!-- Empty cell for the corner -->
                        <% if (professeurs != null && !professeurs.isEmpty()) {
                            for (Professeur professeur : professeurs) {
                        %>
                        <th><%= professeur.getNom() %></th> <!-- Replace with your actual method -->
                        <% }
                        } %>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (locals != null && !locals.isEmpty()) {
                        for (Local local : locals) {
                    %>
                    <tr>
                        <th><%= local.getNom() %></th> <!-- Replace with your actual method -->
                        <% if (professeurs != null && !professeurs.isEmpty()) {
                            for (Professeur professeur : professeurs) {
                        %>
                        <td>
                            <input type="checkbox" name="cart_<%= local.getId() %>_<%= professeur.getId() %>"
                                   value="<%= local.getId() %>_<%= professeur.getId() %>"
                                   onclick="checkCheckboxCount(this);"/>
                        </td>
                        <% }
                        } %>
                    </tr>
                    <% }
                    } %>
                    </tbody>
                </table>
                <script>
                    function checkCheckboxCount(checkbox) {
                        var column = checkbox.parentNode.cellIndex;
                        var checkedCheckboxes = document.querySelectorAll("tbody td:nth-child(" + (column + 1) + ") input:checked");
                        if (checkedCheckboxes.length > 5) {
                            checkbox.checked = false;
                            alert("You can select a maximum of 5 locals for each professor.");
                        }
                    }
                </script>


                <button type="submit" class="btn btn-primary">Submit</button>
                <button id="closeBtn" class="btn btn-info">Close</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");
    // Get the button that opens the modal
    // Get the <span> element that closes the modal
    var close = document.getElementById("closeBtn");

    // When the user clicks the button, open the modal

    function loadCartesianData(e, horaireId) {
        e.preventDefault()
        console.log(horaireId)
        modal.style.display = "block";
        document.getElementById("horaireId").value = horaireId;

        fetch('api/locations/' + horaireId)
            .then(response => response.json())
            .then(locations => {
                const checkboxes = document.querySelectorAll('input[type="checkbox"]');
                checkboxes.forEach(checkbox => {
                    const [locale, professeur] = checkbox.value.split('_').map(Number);
                    const locationExists = locations.some(location => location.locale === locale && location.surr === professeur);
                    if (locationExists) {
                        checkbox.checked = true;
                    }
                });
            })
            .catch(console.error);

    }


    // When the user clicks on <span> (x), close the modal
    close.onclick = function () {
        modal.style.display = "none";
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = false;
        });
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
            });
        }
    }
</script>


</body>
</html>
