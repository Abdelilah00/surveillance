package com.example.surveillance;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "auth", value = "/auth")
public class AuthServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            if (validateUserCredentials(email, password)) {
                // Login successful, redirect to a success page or set session attributes
                request.getSession().setAttribute("email", email);
                response.sendRedirect("home.jsp");
            } else {
                // Login failed, redirect to an error page or set an error message
                request.setAttribute("errorMessage", "Invalid email or password.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("auth.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean validateUserCredentials(String username, String password) throws SQLException {
        String query = "SELECT * FROM professeur WHERE email = ? AND password = ? AND admin = true";

        try {
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("email", null);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("auth.jsp");
        requestDispatcher.forward(request, response);

        // Not supported, send an error response
        // response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported for this action.");
    }
}
