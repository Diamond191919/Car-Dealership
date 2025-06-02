/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO;


import fptu.edu.vn.trainingcenter.Model.Account;

/**
 *
 * @author Diamond1
 */
public interface AccountDAO {
    Account checkAccountBeforeLogin(String email, String password);
    
}
