/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller;

import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.AccountDAO;
import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.CustomerDAO;
import fptu.edu.vn.trainingcenter.Model.Customer;
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
public class AddCustomerServlet extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");

            String custName = (String) request.getAttribute("custName");
            custName = custName.trim();
            String sex = (String) request.getAttribute("sex");
            sex = sex.trim();
            String phone = (String) request.getAttribute("phone");
            phone = phone.trim();
            String cusAddress = (String) request.getAttribute("cusAddress");
            cusAddress = cusAddress.trim();
            out.print("<h5>Name add: " + custName + " </h5>");



            CustomerDAO cd = new CustomerDAO();
            AccountDAO ad = new AccountDAO();

            Customer addCus = new Customer(0, custName, phone, sex, cusAddress);







            boolean isAdd, isSame;

            if (ad.isSameName(addCus.getCustName())) {
                out.print("<h5>trung ten database</h5>");
                isSame = true;
                isAdd = false;

            } else {
                isSame = false;
                out.print("<h5>Khog trung ten database</h5>");
                if (ad.addAccountForCustomer(addCus)) {
                    out.print("<h5>Add account thanh cong</h5>");
                    isAdd = true;
                } else {
                    out.print("<h5>Add account that bai</h5>");
                    isAdd = false;
                }
            }
            request.setAttribute("isAdd", isAdd);
            request.setAttribute("isSame", isSame);
            
            request.getRequestDispatcher("Action?action=AfterAddCustomer").forward(request, response);


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
