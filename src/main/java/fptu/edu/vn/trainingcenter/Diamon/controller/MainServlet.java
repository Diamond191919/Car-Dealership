/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.controller;

import fptu.edu.vn.trainingcenter.Diamon.service.PartsService;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.PartsServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Parts;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Diamond1
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {

    private PartsService partsService;

    @Override
    public void init() {
        partsService = new PartsServiceImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String a = request.getParameter("action");
        String query = request.getParameter("query");
        System.out.println("Action: " + a);
        System.out.println("Query: " + query);
        if (a == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String url = "error.jsp";
        try {
            switch (a) {
                case "saler":
                    url = "/saler/dashboard";
                    break;

                case "savecreate":
                    url = request.getContextPath() + "/parts/dashboard";
                    break;
                case "listparts":
                    url = request.getContextPath() + "/parts/dashboard";
                    break;
                case "savepart":
                    url = request.getContextPath() + "/parts/dashboard";
                    break;
                case "search":
                    url = request.getContextPath() + "/parts/dashboard";
                    break;
                case "deletepart":
                    url = request.getContextPath() + "/parts/dashboard";
                    break;


                case "showAllInvoices":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "showAssignedInvoices":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "showUnassignedInvoices":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "activateInvoice":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "activateInvoices":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "addnewinvoice":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;
                case "addnew":
                    url = request.getContextPath() + "/invoice/dashboard";
                    break;

                case "mechanicTicket":
                    url = request.getContextPath() + "/servicetick/dashboard";
                    break;
                case "searchTicket":
                    url = request.getContextPath() + "/servicetick/dashboard";
                    break;

                case "customerticket":
                    url = request.getContextPath() + "/servicetick/dashboard";
                    break;

                case "logout":
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate(); // Hủy session
                    }
                    url = "auth/logout.jsp"; // Chuyển hướng tới trang logout
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}