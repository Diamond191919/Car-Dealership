/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller;

import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.AccountDAO;
import fptu.edu.vn.trainingcenter.Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
public class LoginServlet extends HttpServlet {

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
        try {
            request.setCharacterEncoding("UTF-8");
            //Dùng getAttribute thay vì getParameter neu dung Action
            String inputName = (String) request.getAttribute("name");
            String inputPassword = (String) request.getAttribute("password");
            inputName.trim();
            inputPassword.trim();
            //String inputName = (String) request.getParameter("name");
            //String inputPassword = (String) request.getParameter("password");

            if (inputName.isEmpty() && inputPassword.isEmpty()) {
                request.setAttribute("ErrorMsg", "Please Enter name!!!");
                request.getRequestDispatcher("Action?action=start").forward(request, response);
            }

            //add DAO
            AccountDAO ad = new AccountDAO();

            //add LIST
            ArrayList<Account> lAccount = ad.getAccountByName(inputName);  //check account in database => input: name + pass

            // add object
            Account anAccount = new Account();

            //check name
            if (ad.isExitOnlyAnAccount(lAccount)) {
                anAccount = ad.getAnAccount(lAccount);
            } else {
                if (inputName == null || inputName.isEmpty()) {
                    String ErorrMsg = "Name empty!!";
                    request.setAttribute("ErrorMsg", ErorrMsg);
                    request.getRequestDispatcher("Action?action=start").forward(request, response);
                    return;
                } else {
                    String ErorrMsg = "Name incorect!!";
                    request.setAttribute("ErrorMsg", ErorrMsg);
                    request.getRequestDispatcher("Action?action=start").forward(request, response);
                    return;
                }

            }

            //check password
            if (ad.checkPasswordByAccount(anAccount, inputPassword)) {
                
             
                //check role
                if (ad.checkRole(anAccount, "4")) {
                    HttpSession s = request.getSession(true);
                    s.setAttribute("USER", anAccount);
                    request.getRequestDispatcher("Action?action=SalePersonDashboard").forward(request, response);
                }
                else{
                   String ErrorrMsg = "You not SalePerson!!";
                request.setAttribute("ErrorMsg", ErrorrMsg);
                request.getRequestDispatcher("Action?action=start").forward(request, response); 
                }
                
                

            } else {
                String ErrorrMsg = "Password incorect!!";
                request.setAttribute("ErrorMsg", ErrorrMsg);
                request.getRequestDispatcher("Action?action=start").forward(request, response);
            }

        } catch (Exception e) {

        }
    }
}
