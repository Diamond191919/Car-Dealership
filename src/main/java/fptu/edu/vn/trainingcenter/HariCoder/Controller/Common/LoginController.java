package fptu.edu.vn.trainingcenter.HariCoder.Controller.Common;


/**
 *
 * @author Admin
 */
import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.AccountServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Account;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginControler", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private IAccountService accountService;

    public LoginController() {
        this.accountService = new AccountServiceImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String email = request.getParameter("typeEmail");
            String password = request.getParameter("typePassword");
            Account account = accountService.checkAccountBeforeLogin(email, password);
            if (account != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("SHOW_LOGIN_MESSAGE", true);
                switch (account.getRoleID()) {
                    case "3": // For mechanic
                        session.setAttribute("USER", account);
                        response.sendRedirect(request.getContextPath() + "/mechanic/dashboard");
                        break;
                    case "4": // For saler
                        session.setAttribute("USER", account);
                        response.sendRedirect(request.getContextPath() + "/saler/dashboard");
                        break;
                    case "2": // For saler
                        session.setAttribute("USER", account);
                        response.sendRedirect(request.getContextPath() + "/cust/dashboard");
                        break;
                    default:
                        // Handle any other cases (optional)
                        response.sendRedirect("/default/dashboard");
                        break;
                }
            }
            else {
                request.setAttribute("ERROR", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");  // Redirect to an error page
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
