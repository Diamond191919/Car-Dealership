package fptu.edu.vn.trainingcenter.TestConnection;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class  TestDataBaseConnection{
    public static void main(String[] args) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String dbname= "Car_DealerShip";
            if (connection != null) {
                System.out.println("✅ Connected to database: " + dbname);

                // Thực hiện SELECT từ bảng Cars
                String query = "SELECT C.carID, C.colour, C.year FROM Cars C";
                try (Statement stmt = connection.createStatement();
                     ResultSet rs = stmt.executeQuery(query)) {

                    System.out.println("\n🚗 Danh sách xe:");
                    while (rs.next()) {
                        int id = rs.getInt("CarID");
                        String colour = rs.getString("colour");
                        double year = rs.getDouble("year");
                        System.out.println("carID: " + id + " | colour: " + colour + " | Năm: " + year);
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Connection failed!");
            System.out.println(e.getMessage());
        }
    }
}
