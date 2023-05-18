package com.example.surveillance;

import com.example.surveillance.Dto.Location;
import com.google.gson.Gson;
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

@WebServlet("/api/locations/*")
public class LocationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); // /{horaireId}

        if (pathInfo != null) {
            String[] pathParts = pathInfo.split("/");
            String horaireIdStr = pathParts[1]; // {horaireId}

            Integer horaireId = Integer.parseInt(horaireIdStr);
            List<Location> locations = fetchLocationsByHoraire(horaireId);

            // Convert locations to JSON and write it to the response
            Gson gson = new Gson();
            String locationsJson = gson.toJson(locations);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(locationsJson);
        }
    }

    public static List<Location> fetchLocationsByHoraire(Integer horaireId) {
        List<Location> locals = new ArrayList<>();
        String query = "SELECT * FROM location WHERE horaire = ?";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, horaireId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int locale = resultSet.getInt("locale");
                int horaire = resultSet.getInt("horaire");
                int respo = resultSet.getInt("surr");

                Location local = new Location(id, locale, horaire, respo);
                locals.add(local);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return locals;
    }

}