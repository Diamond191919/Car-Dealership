/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.Utils;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.AccountServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Account;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AccountSessionHelper {

    private static IAccountService accountService = new AccountServiceImpl();

    public static boolean isLoggedIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Account currentAccount = (Account) session.getAttribute("USER");

        if (currentAccount == null) {
            response.sendRedirect("/GeneralRequest?action=home");
            return false;
        }

        Account accountFromDB = accountService.getAccountById(currentAccount.getId());
        if (accountFromDB == null) {
            response.sendRedirect("/GeneralRequest?action=home");
            return false;
        }
        return true;
    }
}
