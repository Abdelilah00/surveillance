package com.example.surveillance;

import com.example.surveillance.Dto.Affectation;
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

@WebServlet(name = "affectationFinalServlet", value = "/affectation-final")
public class AffactationFinalServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Affectation> affectations = fetchAll();

        request.setAttribute("affectations", affectations);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("affectation-final.jsp");
        requestDispatcher.forward(request, response);
        //this.getServletContext().getRequestDispatcher("/views/employes/gestion.jsp")
    }


    //region fetchAll
    private List<Affectation> fetchAll() {
        List<Affectation> affectations = new ArrayList<>();

        String query = "SELECT h.id as id, filiere.nom as filiere, m.nom as module, date, heure, duree " +
                "from filiere" +
                "         inner join filiere_annee fa on filiere.id = fa.id_filiere" +
                "         inner join annee a on fa.id_annee = a.id" +
                "         inner join semestre s on a.id = s.annee" +
                "         inner join session s2 on s.id = s2.semestre" +
                "         inner join module m on s.id = m.semestre" +
                "         inner join horaire h on m.id = h.module";

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

    //endregion
}
