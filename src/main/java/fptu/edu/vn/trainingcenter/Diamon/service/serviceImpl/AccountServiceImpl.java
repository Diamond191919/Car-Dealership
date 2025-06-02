/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.AccountDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.AccountDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.AccountService;
import fptu.edu.vn.trainingcenter.Model.Account;

/**
 *
 * @author Diamond1
 */
public class AccountServiceImpl implements AccountService {
    private final AccountDAO accountDAO = new AccountDAOImpl();
    
    @Override
    public Account checkAccountBeforeLogin(String email, String password) {
        return accountDAO.checkAccountBeforeLogin(email, password);
    }
}
