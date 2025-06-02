/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.DAO;

import fptu.edu.vn.trainingcenter.Model.Account;

/**
 *
 * @author Admin
 */
public interface IAccountDAO {
    boolean createAccount(Account account);
    boolean updateProfileAccount(Account account);
    Account getAccountById(Long accountId);
    Account checkAccountBeforeLogin(String email, String password);
    String getRoleIdByName(String roleName);
}
