package com.example.surveillance;

import com.example.surveillance.Dto.Consultation;
import com.example.surveillance.Dto.Session;
import com.example.surveillance.Dto.Tmp;
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
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(name = "consultationServlet", value = "/consultation")
public class ConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String action = request.getParameter("action");
        List<Consultation> consultations = fetchAll();

        request.setAttribute("consultations", consultations);
        request.setAttribute("sessions", fetchSessions());
        request.setAttribute("annees", fetchAnnees());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consultation.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }

    //region fetchAll


    private List<Consultation> fetchAll() {
        List<Consultation> consultations = new ArrayList<>();
        List<Tmp> locals = new ArrayList<>();

        String query = "SELECT h.id as horaireId, filiere.nom as filiere, m.nom as module, date, heure, duree " +
                "from filiere" +
                "         inner join filiere_annee fa on filiere.id = fa.id_filiere" +
                "         inner join annee a on fa.id_annee = a.id" +
                "         inner join semestre s on a.id = s.annee" +
                "         inner join session s2 on s.id = s2.semestre" +
                "         inner join module m on s.id = m.semestre" +
                "         inner join horaire h on m.id = h.module";

        String localsQuery = "select horaire.id as horaireId, l2.nom as localNom " +
                "from horaire" +
                "         inner join location l on horaire.id = l.horaire" +
                "         inner join locale l2 on horaire.local = l2.id";
        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            PreparedStatement preparedStatement2 = connection.prepareStatement(localsQuery);
            ResultSet resultSet2 = preparedStatement2.executeQuery();
            while (resultSet2.next()) {
                Integer horaireId = resultSet2.getInt("horaireId");
                String localNom = resultSet2.getString("localNom");
                locals.add(new Tmp(horaireId, localNom));
            }

            while (resultSet.next()) {
                Integer horaireId = resultSet.getInt("horaireId");
                String module = resultSet.getString("module");
                String filiere = resultSet.getString("filiere");
                String date = resultSet.getString("date");
                String heure = resultSet.getString("heure");
                String duree = resultSet.getString("duree");

                List<String> localsByHoraire = locals.stream().filter(item -> Objects.equals(item.getKey(), horaireId)).map(Tmp::getValue).collect(Collectors.toList());

                Consultation consultation = new Consultation(horaireId, module, filiere, date, heure, duree, localsByHoraire, 10);
                consultations.add(consultation);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return consultations;
    }

    public static List<Tmp> fetchHoraireLocal() {
        List<Tmp> locals = new ArrayList<>();

        String localsQuery = "select horaire.id as horaireId, l2.nom as localNom " +
                "from horaire" +
                "         inner join location l on horaire.id = l.horaire" +
                "         inner join locale l2 on horaire.local = l2.id";
        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement2 = connection.prepareStatement(localsQuery);

            ResultSet resultSet2 = preparedStatement2.executeQuery();
            while (resultSet2.next()) {
                Integer horaireId = resultSet2.getInt("horaireId");
                String localNom = resultSet2.getString("localNom");
                locals.add(new Tmp(horaireId, localNom));
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return locals;
    }

    public static List<Session> fetchSessions() {
        List<Session> sessions = new ArrayList<>();

        String localsQuery = "select * from session";
        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement2 = connection.prepareStatement(localsQuery);

            ResultSet resultSet2 = preparedStatement2.executeQuery();
            while (resultSet2.next()) {
                Integer id = resultSet2.getInt("id");
                String nom = resultSet2.getString("nom");
                String type = resultSet2.getString("type");
                sessions.add(new Session(nom, type));
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return sessions;
    }

    public static List<Tmp> fetchAnnees() {
        List<Tmp> annees = new ArrayList<>();

        String localsQuery = "select * from annee";
        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement2 = connection.prepareStatement(localsQuery);

            ResultSet resultSet2 = preparedStatement2.executeQuery();
            while (resultSet2.next()) {
                Integer id = resultSet2.getInt("id");
                String nom = resultSet2.getString("nom");
                annees.add(new Tmp(id, nom));
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return annees;
    }

    //endregion
}
