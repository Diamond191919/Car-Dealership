package fptu.edu.vn.trainingcenter.CommonController;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.AccountServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/navigate/login")
public class NavigationController extends HttpServlet {
    private IAccountService accountService;

    public NavigationController() {
        this.accountService = new AccountServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập encoding
        request.setCharacterEncoding("UTF-8");

        // Lấy các tham số từ form login
        String email = request.getParameter("typeEmail");
        String password = request.getParameter("typePassword");
        String selectedRole = request.getParameter("typeRole");

        // Lấy roleId từ tên role (ví dụ: "Mechanic" -> "3")
        String roleId = accountService.getRoleIdByName(selectedRole);

        // Nếu roleId bằng "3" thì chuyển hướng đến controller của Hải
        if ("3".equals(roleId)) {
            // Giả sử controller của Hải được map tại /login (LoginController)
            // Chuyển các tham số cần thiết qua query string
            String targetURL = request.getContextPath() + "/login?typeEmail=" + email
                    + "&typePassword=" + password + "&typeRole=" + selectedRole;
            response.sendRedirect(targetURL);
        } else if ("4".equals(roleId)) {
            String targetURL = request.getContextPath() + "/login?typeEmail=" + email
                    + "&typePassword=" + password + "&typeRole=" + selectedRole;
            response.sendRedirect(targetURL);
        } else if ("2".equals(roleId)) {
            String targetURL = request.getContextPath() + "/login?typeEmail=" + email
                    + "&typePassword=" + password + "&typeRole=" + selectedRole;
            response.sendRedirect(targetURL);
        } else {
            // Các trường hợp khác có thể được xử lý hoặc thông báo lỗi
            response.sendRedirect(request.getContextPath() + "/default/dashboard");
        }
    }
}
