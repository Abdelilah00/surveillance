package com.example.surveillance;

import com.example.surveillance.Dto.Module;
import com.example.surveillance.Dto.ProfAndModule;
import com.example.surveillance.Dto.Professeur;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.Inet4Address;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.prefs.Preferences;

@WebServlet(name = "gestionServlet", value = "/gestion")
public class GestionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String action = request.getParameter("action");
        List<ProfAndModule> profAndModules = fetchProfAndModules();
        List<Module> modules = fetchModules();
        List<Professeur> professeurs = fetchProfesseurs();

        request.setAttribute("profAndModules", profAndModules);
        request.setAttribute("modules", modules);
        request.setAttribute("professeurs", professeurs);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("gestion.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addProf".equals(action)) {
            int module = Integer.parseInt(request.getParameter("module"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");

            int profId = insertProf(nom, prenom);
            // Handle the result, e.g., show a message or redirect to another page
            if (profId > -1) {
                if (updateModule(module, profId))
                    response.sendRedirect(request.getRequestURI());
                else
                    request.setAttribute("errorMessage", "Invalid email or password.");
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
            }

            response.sendRedirect(request.getRequestURI());

        } else if ("updateRespo".equals(action)) {
            Integer professeur = Integer.parseInt(request.getParameter("professeur"));
            Integer module = Integer.parseInt(request.getParameter("module"));

            boolean success = updateModule(module, professeur);
            // Handle the result, e.g., show a message or redirect to another page
            if (!success) {
                request.setAttribute("errorMessage", "Invalid email or password.");
            }
            response.sendRedirect(request.getRequestURI());
        } else {
            // Handle unknown action or show an error message
            response.sendRedirect("error.jsp");
        }
    }

    //region fetchAll
    private List<ProfAndModule> fetchProfAndModules() {
        List<ProfAndModule> profAndModules = new ArrayList<>();

        String query = "SELECT professeur.nom as nom, prenom, m.nom as module, f.nom as filiere, s2.nom as session" +
                " from professeur" +
                "         inner join module m on professeur.id = m.respo" +
                "         inner join filiere f on professeur.id = f.respo" +
                "         inner join semestre s on m.semestre = s.id" +
                "         inner join session s2 on s.id = s2.semestre";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            int i = 0;
            while (resultSet.next()) {
                //int id = resultSet.getInt("id");
                //int numero = resultSet.getInt("numero");
                String nomAndPrenom = resultSet.getString("nom") + " " + resultSet.getString("prenom");
                String module = resultSet.getString("module");
                String filiere = resultSet.getString("filiere");
                String session = resultSet.getString("session");

                ProfAndModule profAndModule = new ProfAndModule(i++, nomAndPrenom, module, filiere, session);
                profAndModules.add(profAndModule);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return profAndModules;
    }
    private List<Module> fetchModules() {
        List<Module> modules = new ArrayList<>();

        String query = "SELECT * FROM module";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nom = resultSet.getString("nom");

                Module module = new Module(id, nom);
                modules.add(module);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return modules;
    }
    private List<Professeur> fetchProfesseurs() {
        List<Professeur> professeurs = new ArrayList<>();

        String query = "SELECT * FROM professeur";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nom = resultSet.getString("nom");
                String prenom = resultSet.getString("prenom");

                Professeur professeur = new Professeur(id, nom, prenom);
                professeurs.add(professeur);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return professeurs;
    }
    //endregion

    //region insert
    private int insertProf(String nom, String prenom) {
        String query = "INSERT INTO professeur (nom, prenom, admin) VALUES (?, ?, false)";
        int generatedId = -1;

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, nom);
            preparedStatement.setString(2, prenom);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }
    //endregion

    //region update
    private boolean updateModule(Integer id, Integer respo) {
        String query = "UPDATE module SET respo = ? WHERE id = ?";

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
    //endregion

    private ProfAndModule fetchProduct(int id) {
        String query = "SELECT * FROM products WHERE id = ?";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");

                return new ProfAndModule(id, name, name, name, name);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}