
package fptu.edu.vn.trainingcenter.HariCoder.Controller.Common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GeneralRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = "/error.jsp";

        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "home";
            }

            switch (action) {
                case "home":
                    url = "home.jsp";
                    break;
                case "initiateRegistration":
                    url = "RegisterController";
                    break;
                case "LoginSession":
                    url = "NavigationController";
                    break;
                case "viewProfile":
                    url = "/profile.jsp";
                    break;
                case "endSession":
                    url = "LogoutController";
                    break;
                case "customerDashboard":
                    url = "/customer/dashboard";
                    break;
                case "mechanicDashboard":
                    url = "/mechanic/dashboard";
                    break;
                case "editProfileCustomer":
                    url = "/profile";
                    break;
                default:
                    url = "/error.jsp";
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // Process the GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Process the POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}