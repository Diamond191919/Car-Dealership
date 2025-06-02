/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller;

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
public class DoUpdateCusServlet extends HttpServlet {

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

            //get old cus
            String stringOldCustID = (String) request.getAttribute("custID");
            stringOldCustID = stringOldCustID.trim();
            int oldCusID = Integer.parseInt(stringOldCustID);
            String oldCustName = (String) request.getAttribute("oldCustName");
            oldCustName = oldCustName.trim();
            String oldPhone = (String) request.getAttribute("oldPhone");
            oldPhone = oldPhone.trim();
            String oldCusAddress = (String) request.getAttribute("oldCusAddress");
            oldCusAddress = oldCusAddress.trim();
            String oldSex = (String) request.getAttribute("oldSex");
            oldSex = oldSex.trim();
            Customer oldCus = new Customer(oldCusID, oldCustName, oldPhone, oldSex, oldCusAddress);

            //get new cus
            int newCusID = oldCusID;
            String newCustName = (String) request.getAttribute("custName");
            newCustName = newCustName.trim();
            String newPhone = (String) request.getAttribute("phone");
            newPhone = newPhone.trim();
            String newCusAddress = (String) request.getAttribute("cusAddress");
            newCusAddress = newCusAddress.trim();
            String newSex = (String) request.getAttribute("sex");
            newSex = newSex.trim();
            Customer newCus = new Customer(newCusID, newCustName, newPhone, newSex, newCusAddress);

            // chack validate usser
            if (oldCus == null) {
                request.getRequestDispatcher("Action?action=start").forward(request, response);
            }

            CustomerDAO cd = new CustomerDAO();
            boolean isChanging, isUpdate;
            // kiem tra so ddien thoai hop le
            
            
            
            if (cd.isChanging(oldCus, newCus)) {
                out.println("<script>alert('Customer is changing!');</script>");
                isChanging = true;
                if (cd.updateCustomer(newCus)) {
                    //out.println("<script>alert('Customer updated successfully!');</script>");
                    System.out.println(" Customer updated successfully!");
                    isUpdate = true;
                } else {
                    //out.println("<script>alert('Customer update failed!');</script>");
                    System.out.println(" Customer update failed!");
                    isUpdate = false;
                }
            } else {
                isChanging = false;
                isUpdate = false;
                //out.println("<script>alert('No changes detected in customer data.');</script>");
                System.out.println("️ No changes detected in customer data.");
            }
            
            request.setAttribute("isChanging", isChanging);
            request.setAttribute("isUpdate", isUpdate);

            
            request.getRequestDispatcher("Action?action=AfterUpdate").forward(request, response);
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
