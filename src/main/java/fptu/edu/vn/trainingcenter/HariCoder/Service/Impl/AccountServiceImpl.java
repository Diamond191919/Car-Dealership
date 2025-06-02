/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.Service.Impl;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.IAccountDAO;
import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.AccountDAOImpl;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.Model.Account;

/**
 *
 * @author Admin
 */
public class AccountServiceImpl implements IAccountService {
    private IAccountDAO accountDAO;

    public AccountServiceImpl() {
        this.accountDAO = new AccountDAOImpl();
    }

    @Override
    public Account checkAccountBeforeLogin(String email, String password) {
        return accountDAO.checkAccountBeforeLogin(email, password);
    }
    @Override
    public String getRoleIdByName(String roleName) {
        return accountDAO.getRoleIdByName(roleName);
    }
    @Override
    public boolean updateProfileAccount(Account account) {
        return accountDAO.updateProfileAccount(account);
    }

    @Override
    public Account getAccountById(Long accountId) {
        return accountDAO.getAccountById(accountId);
    }

    @Override
    public boolean createAccount(Account account) {
        return accountDAO.createAccount(account);
    }
}
