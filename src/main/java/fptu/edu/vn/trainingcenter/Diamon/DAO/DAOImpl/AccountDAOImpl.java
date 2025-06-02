/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;

/**
 *
 * @author Diamond1
 */

import fptu.edu.vn.trainingcenter.Diamon.DAO.AccountDAO;
import fptu.edu.vn.trainingcenter.Model.Account;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAOImpl implements AccountDAO {

    @Override
    public Account checkAccountBeforeLogin(String email, String password) {
        Account account = null;
        String query = "SELECT * FROM Account WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, email.trim()); // Xử lý khoảng trắng thừa
            pstmt.setString(2, password.trim());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                account = new Account(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("password"),
                        rs.getString("roleID"),
                        rs.getString("status"),
                        rs.getString("sex")
                );
            }
            System.out.println("DEBUG - Email: [" + email + "], Password: [" + password + "]");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }
}
