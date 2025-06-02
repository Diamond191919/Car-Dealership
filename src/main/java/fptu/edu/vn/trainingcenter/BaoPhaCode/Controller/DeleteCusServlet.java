/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller;

import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.AccountDAO;
import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class DeleteCusServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            request.setCharacterEncoding("UTF-8");
            String cusID = (String) request.getAttribute("custID");
            long accountID = Long.parseLong(cusID);
            String cusName = (String) request.getAttribute("custName");

            if (cusID == null && cusName == null) {
                request.getRequestDispatcher("Action?action=start").forward(request, response);
            }

            CustomerDAO cd = new CustomerDAO();
            AccountDAO ad = new AccountDAO();

            boolean isDelete;
            
            //delete cus
            if (cd.deleteCustomer(cusID)) {
                out.println("<h5>Cus delete: " + cusName + " success</h5>");
                //inactive account
                if (ad.inactiveAccount(accountID)) {
                    out.println("<h5>Cus delete account: " + cusName + " success</h5>");
                    isDelete = true;
                } else {
                    out.println("<h5>Cus delete account: " + cusName + " fail</h5>");
                    isDelete = false;
                }
            } else {
                out.println("<h5>Cus delete: " + cusName + " fail</h5>");
                isDelete = false;
            }
            request.setAttribute("isDelete", isDelete);
            request.setAttribute("cusName", cusName);

            request.getRequestDispatcher("Action?action=AfterDelete").forward(request, response);
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
