/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller;

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
public class Action extends HttpServlet {

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
// Đặt mã hóa trước khi lấy dữ liệu từ request
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            String url = "";
            String a = request.getParameter("action");
            if (a == null) {
                a = "start";
            }

            switch (a) {
                case "start":
                    url = "BaoPhaCode/LoginSale.jsp";
                    break;

                case "login":
                    // Lấy dữ liệu từ form
                    String name = request.getParameter("name");
                    String password = request.getParameter("password");
                    request.setAttribute("name", name);
                    request.setAttribute("password", password);
                    url = "LoginServlet";
                    break;

                case "SalePersonDashboard":
                    url = "BaoPhaCode/SalePersonDashboard.jsp";
                    break;

                case "SearchCus":
                    request.setAttribute("nameCus", request.getParameter("nameCus"));
                    url = "SearchCusServlet";
                    break;

                case "BackWithCusList":
                    request.setAttribute("LCus", request.getAttribute("LCus"));
                    request.setAttribute("hasRequestedListCus", true);
                    request.setAttribute("cusName", request.getAttribute("cusName"));
                    url = "BaoPhaCode/SalePersonDashboard.jsp";
                    break;

                case "ChooseCusUpdate":
                    request.setAttribute("custID", request.getParameter("custID"));
                    request.setAttribute("custName", request.getParameter("custName"));
                    request.setAttribute("phone", request.getParameter("phone"));
                    request.setAttribute("sex", request.getParameter("sex"));
                    request.setAttribute("cusAddress", request.getParameter("cusAddress"));
                    url = "UpdateCusServlet";
                    break;

                case "UpdateCus":
                    request.setAttribute("uCus", request.getAttribute("uCus"));
                    url = "BaoPhaCode/UpdateCustomer.jsp";
                    break;

                case "Update":
                    request.setAttribute("custID", request.getParameter("custID"));
                    request.setAttribute("oldCustName", request.getParameter("oldCustName"));
                    request.setAttribute("oldPhone", request.getParameter("oldPhone"));
                    request.setAttribute("oldCusAddress", request.getParameter("oldCusAddress"));
                    request.setAttribute("oldSex", request.getParameter("oldSex"));

                    request.setAttribute("custName", request.getParameter("custName"));
                    request.setAttribute("phone", request.getParameter("phone"));
                    request.setAttribute("cusAddress", request.getParameter("cusAddress"));
                    request.setAttribute("sex", request.getParameter("sex"));
                    url = "DoUpdateCusServlet";
                    break;

                case "AfterUpdate":
                    request.setAttribute("isChanging", request.getAttribute("isChanging"));
                    request.setAttribute("isUpdate", request.getAttribute("isUpdate"));
                    url = "BaoPhaCode/SalePersonDashboard.jsp";
                    break;

                case "ChooseCusDelete":
                    request.setAttribute("custID", request.getParameter("custID"));
                    request.setAttribute("custName", request.getParameter("custName"));
                    url = "DeleteCusServlet";
                    break;
                 
                case "AfterDelete":
                    request.setAttribute("isDelete", request.getAttribute("isDelete"));
                    request.setAttribute("cusName", request.getAttribute("cusName"));
                    url = "BaoPhaCode/SalePersonDashboard.jsp";
                    break;
                    
                    
                    
                    
                    
                    
                    
                    

                case "AddCustomer":
                    request.setAttribute("Validate", true);
                    url = "BaoPhaCode/AddCustomer.jsp";
                    break;
                case "EnterAdd":
                    request.setAttribute("custName", request.getParameter("custName"));
                    request.setAttribute("sex", request.getParameter("sex"));
                    request.setAttribute("phone", request.getParameter("phone"));
                    request.setAttribute("cusAddress", request.getParameter("cusAddress"));

                    url = "AddCustomerServlet";
                    break;
                    
                case "AfterAddCustomer":
                    request.setAttribute("isAdd", request.getAttribute("isAdd"));
                    request.setAttribute("isSame", request.getAttribute("isSame"));

                    url = "BaoPhaCode/SalePersonDashboard.jsp";
                    break;

            }

            request.getRequestDispatcher(url).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi để kiểm tra nếu có vấn đề
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
