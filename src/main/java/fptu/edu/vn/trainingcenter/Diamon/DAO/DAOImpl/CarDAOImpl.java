/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import fptu.edu.vn.trainingcenter.Diamon.DAO.CarDAO;
import fptu.edu.vn.trainingcenter.Model.Car;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;

/**
 *
 * @author Diamond1
 */
public class CarDAOImpl implements CarDAO {

    @Override
    public List<Car> getAvailableCars() {
        List<Car> availableCars = new ArrayList<>();
        String query = "SELECT * FROM Cars c WHERE NOT EXISTS (SELECT 1 FROM SalesInvoice s WHERE c.carID = s.carID)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                availableCars.add(new Car(
                        rs.getLong("carID"),
                        rs.getString("car_name"),
                        rs.getDouble("price"),
                        rs.getString("serialNumber"),
                        rs.getString("model"),
                        rs.getString("colour"),
                        rs.getInt("year"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getString("description")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return availableCars;
    }

}
