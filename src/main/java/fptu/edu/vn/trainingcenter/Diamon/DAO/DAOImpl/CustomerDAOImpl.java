/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;

import fptu.edu.vn.trainingcenter.Diamon.DAO.CustomerDAO;
import fptu.edu.vn.trainingcenter.Model.Customer;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diamond1
 */
public class CustomerDAOImpl implements CustomerDAO {

    @Override
    public List<Customer> getCustomersNotInSalesInvoice() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM Customer c WHERE NOT EXISTS ("
                + "SELECT 1 FROM SalesInvoice s WHERE c.custID = s.custID)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                customers.add(new Customer(
                        rs.getLong("custID"),
                        rs.getString("cust_name"),
                        rs.getString("phone"),
                        rs.getString("sex"),
                        rs.getString("cust_address")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }
}
