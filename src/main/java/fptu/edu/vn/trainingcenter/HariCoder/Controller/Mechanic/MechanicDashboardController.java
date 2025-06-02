/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Admin
 */
@WebServlet("/mechanic/dashboard")
public class MechanicDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        if (session != null && session.getAttribute("USER") != null) {
            System.out.println("USER found in session, forwarding to mechanicDashboard.jsp");
            request.getRequestDispatcher("/Haricoder/mechanicDashboard.jsp").forward(request, response);
        } else {
            System.out.println("No USER found in session, redirecting to home");
            response.sendRedirect(request.getContextPath() + "/GeneralRequest?action=home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doGet(request, response);
    }
}

