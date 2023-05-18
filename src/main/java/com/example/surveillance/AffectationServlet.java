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
import java.util.List;

import java.util.Enumeration;
import java.util.stream.Collectors;


@WebServlet(name = "affectationServlet", value = "/affectation")
public class AffectationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Affectation> affectations = fetchAll();
        List<Local> locals = fetchLocals();
        List<Professeur> professeurs = GestionServlet.fetchProfesseurs();

        request.setAttribute("affectations", affectations);
        request.setAttribute("locals", locals);
        request.setAttribute("professeurs", professeurs);


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("affectation.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer horaireId = Integer.parseInt(request.getParameter("horaireId"));
        Enumeration<String> parameterNames = request.getParameterNames();

        deleteAllLocationsOfHoraire(horaireId);
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("cart_")) {
                String[] value = request.getParameterValues(paramName)[0].split("_");
                String localId = value[0];
                String surr = value[1];
                boolean success = insertLocation(horaireId, Integer.parseInt(localId), Integer.parseInt(surr));
            }
        }

        response.sendRedirect("affectation");
        //response.sendRedirect(request.getRequestURI());
    }

    //region fetchAll
    private List<Affectation> fetchAll() {
        List<Affectation> affectations = new ArrayList<>();

        String query = "SELECT DISTINCT h.id as id, filiere.nom as filiere, m.nom as module, date, heure, duree " +
                "from filiere" +
                "         left join filiere_annee fa on filiere.id = fa.id_filiere" +
                "         left join annee a on fa.id_annee = a.id\n" +
                "         left join semestre s on a.id = s.annee" +
                "         left join session s2 on s.session = s2.id" +
                "         left join filiere_module fm on filiere.id = fm.filiere" +
                "         left join module m on fm.module = m.id" +
                "         left join horaire h on m.id = h.module";

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

                Affectation affectation = new Affectation(horaireId, module, filiere, date, heure, duree);
                affectations.add(affectation);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return affectations;
    }

    public static List<Local> fetchLocals() {
        List<Local> locals = new ArrayList<>();

        String query = "SELECT * FROM locale";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nom = resultSet.getString("nom");
                int capacite = resultSet.getInt("capacite");
                int respo = resultSet.getInt("respo");

                Local local = new Local(id, nom, capacite, respo);
                locals.add(local);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return locals;
    }



    private List<Horaire> fetchHoraire() {
        List<Horaire> horaires = new ArrayList<>();

        String query = "SELECT * FROM horaire";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");

                Horaire horaire = new Horaire(id);
                horaires.add(horaire);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return horaires;
    }
    //endregion

    //region update
    public static boolean updateLocal(Integer id, Integer respo) {
        String query = "UPDATE locale SET respo = ? WHERE id = ?";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, respo);
            preparedStatement.setInt(2, id);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private boolean insertLocation(Integer horaireId, Integer localId, Integer surr) {
        String query = "INSERT location(locale, horaire,surr)  VALUES(?,?,?)";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, localId);
            preparedStatement.setInt(2, horaireId);
            preparedStatement.setInt(3, surr);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private void deleteAllLocationsOfHoraire(Integer id) {
        String query = "delete from location WHERE horaire = ?";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            int rowsAffected = preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
    //endregion
}
