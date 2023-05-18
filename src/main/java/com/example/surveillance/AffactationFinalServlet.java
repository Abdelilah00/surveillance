package com.example.surveillance;

import com.example.surveillance.Dto.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "affectationFinalServlet", value = "/affectation-final")
public class AffactationFinalServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Session> sessions = ConsultationServlet.fetchSessions();
        List<Tmp> annees = ConsultationServlet.fetchAnnees();
        var s = sessions.get(0);
        var a = annees.get(0);

        List<Consultation> consultations = fetchAll().stream().filter(item -> item.getSessionId().equals(s.getId()) && item.getAnneeId().equals(a.getKey())).collect(Collectors.toList());


        request.setAttribute("consultations", consultations);
        request.setAttribute("sessions", sessions);
        request.setAttribute("annees", annees);

        request.setAttribute("tableHeader", a.getValue() + " / " + s.getNom() + " / " + s.getType());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("affectation-final.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer anneeId = Integer.parseInt(request.getParameter("annee"));
        Integer sessionId = Integer.parseInt(request.getParameter("session"));

        List<Consultation> consultations = fetchAll().stream().filter(item -> item.getSessionId().equals(sessionId) && item.getAnneeId().equals(anneeId)).collect(Collectors.toList());
        List<Session> sessions = ConsultationServlet.fetchSessions();
        List<Tmp> annees = ConsultationServlet.fetchAnnees();


        request.setAttribute("consultations", consultations);
        request.setAttribute("sessions", sessions);
        request.setAttribute("annees", annees);

        request.setAttribute("sessionSelected", sessionId);
        request.setAttribute("anneeSelected", anneeId);

        var s = sessions.stream().filter(item -> item.getId().equals(sessionId)).collect(Collectors.toList()).get(0);
        var a = annees.stream().filter(item -> item.getKey().equals(anneeId)).collect(Collectors.toList()).get(0);
        request.setAttribute("tableHeader", a.getValue() + " / " + s.getNom() + " / " + s.getType());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("affectation-final.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }

    static class LocalProf {
        Integer horaireId;
        String localName;
        String respoName;

        public LocalProf(Integer horaireId, String localName, String respoName) {
            this.horaireId = horaireId;
            this.localName = localName;
            this.respoName = respoName;
        }

        public Integer getHoraireId() {
            return horaireId;
        }

        public String getLocalName() {
            return localName;
        }

        public String getRespoName() {
            return respoName;
        }
    }

    //region fetchAll
    private List<Consultation> fetchAll() {
        List<Consultation> affectations = new ArrayList<>();
        List<LocalProf> localProfs = new ArrayList<>();

        String query = "SELECT DISTINCT h.id as id, filiere.nom as filiere, m.nom as module, date, heure, duree, a.id as anneeId, s2.id as sessionId " +
                "from filiere" +
                "         inner join filiere_annee fa on filiere.id = fa.id_filiere" +
                "         inner join annee a on fa.id_annee = a.id" +
                "         inner join semestre s on a.id = s.annee" +
                "         inner join session s2 on s.id = s2.semestre" +
                "         inner join filiere_module fm on filiere.id = fm.filiere" +
                "         inner join module m on fm.module = m.id and s.id = m.semestre" +
                "         inner join horaire h on m.id = h.module";

        String query2 = "select horaire.id as horaireId, p.nom as respoName, l2.nom as localName " +
                "from horaire " +
                "inner join location l on horaire.id = l.horaire " +
                "inner join locale l2 on l.locale = l2.id " +
                "inner join professeur p on l2.respo = p.id";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement2 = connection.prepareStatement(query2);
            ResultSet resultSet2 = preparedStatement2.executeQuery();

            while (resultSet2.next()) {
                Integer horaireId = resultSet2.getInt("horaireId");
                String respoName = resultSet2.getString("respoName");
                String localName = resultSet2.getString("localName");

                LocalProf affectation = new LocalProf(horaireId, localName, respoName);
                localProfs.add(affectation);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                Integer horaireId = resultSet.getInt("id");
                String module = resultSet.getString("module");
                String filiere = resultSet.getString("filiere");
                String date = resultSet.getString("date");
                String heure = resultSet.getString("heure");
                String duree = resultSet.getString("duree");
                Integer anneeId = resultSet.getInt("anneeId");
                Integer sessionId = resultSet.getInt("sessionId");

                List<String> localProfsString = localProfs.stream()
                        .filter(item -> item.getHoraireId().equals(horaireId))
                        .map(item -> new StringBuilder()
                                .append(item.getLocalName())
                                .append(" (")
                                .append(item.getRespoName())
                                .append(")")
                                .toString())
                        .collect(Collectors.toList());


                //fill locals local-prof
                Consultation affectation = new Consultation(horaireId, module, filiere, date, heure, duree, localProfsString, 0, anneeId, sessionId);
                affectations.add(affectation);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


        return affectations;
    }

    //endregion
}
