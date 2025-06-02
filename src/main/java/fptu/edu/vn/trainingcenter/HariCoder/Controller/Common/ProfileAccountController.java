package fptu.edu.vn.trainingcenter.HariCoder.Controller.Common;

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

@WebServlet( urlPatterns = {"/profile"})
public class ProfileAccountController extends HttpServlet {
    private IAccountService accountService;

    public ProfileAccountController() {
        this.accountService = new AccountServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account getAccountFromSession = (Account) session.getAttribute("USER");

        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (getAccountFromSession != null) {
            Account checkExistAccountById = accountService.getAccountById(getAccountFromSession.getId());
            if (checkExistAccountById != null) {
                request.setAttribute("account", getAccountFromSession);
                request.getRequestDispatcher("/profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("/GeneralRequest?action=home");
            }
        } else {
            response.sendRedirect("/GeneralRequest?action=home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account currentAccount = (Account) session.getAttribute("USER");
        if (currentAccount == null) {
            response.sendRedirect("/GeneralRequest?action=home");
            return;
        }
        try {
            // Lấy dữ liệu từ database để đảm bảo dữ liệu mới nhất
            Account accountFromDB = accountService.getAccountById(currentAccount.getId());
            if (accountFromDB == null) {
               response.sendRedirect("/GeneralRequest?action=home");
                return;
            }

            // Sao lưu giá trị cũ
            String oldName = accountFromDB.getName();
            String oldPhone = accountFromDB.getPhone().trim();
            String oldSex = accountFromDB.getSex();
            String oldAddress = accountFromDB.getAddress();

            // Lấy thông tin mới từ form
            String newName = request.getParameter("name");
            String newPhone = request.getParameter("phone").trim();
            String newSex = request.getParameter("sex");
            String newAddress = request.getParameter("address");

            // Cập nhật thông tin mới
            if (newName != null && !newName.trim().isEmpty()) {
                accountFromDB.setName(newName);
            }
            if (newPhone != null && !newPhone.trim().isEmpty()) {
                accountFromDB.setPhone(newPhone.trim());
            }
            if (newSex != null && !newSex.trim().isEmpty()) {
                accountFromDB.setSex(newSex);
            }
            if (newAddress != null && !newAddress.trim().isEmpty()) {
                accountFromDB.setAddress(newAddress);
            }

            // Kiểm tra thay đổi
            boolean hasChanges =
                    !accountFromDB.getName().equals(oldName) ||
                            !accountFromDB.getPhone().equals(oldPhone) ||
                            !accountFromDB.getSex().equals(oldSex) ||
                            !accountFromDB.getAddress().equals(oldAddress);
            if (!hasChanges) {
                session.setAttribute("SHOW_NOTHINGCHANGE_MESSAGE", true);
                response.sendRedirect("GeneralRequest?action=mechanicDashboard");
                return;
            }

            // Cập nhật database
            boolean updated = accountService.updateProfileAccount(accountFromDB);
            if (updated) {
                // Cập nhật session với dữ liệu mới nhất
                session.setAttribute("USER", accountFromDB);
                //request.setAttribute("DATABASE_UPDATE_SUCCESS", "Update complete! Continue your journey with fresh data.");
                //request.getRequestDispatcher("/profile.jsp").forward(request, response);
                session.setAttribute("DATABASE_UPDATE_SUCCESS", true);
                response.sendRedirect("/profile");
            } else {
                request.setAttribute("account", accountFromDB);
                request.setAttribute("DATABASE_UPDATE_ERROR", "Warning!Failed to update profile.");
                request.getRequestDispatcher("/profile").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "An error occurred while updating your profile.");
            request.setAttribute("account", currentAccount);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        }
    }
}
