/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.Utils;

/**
 *
 * @author Admin
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String DB_NAME = "Car_DealerShip";
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "12345";

    public DatabaseConnection() {
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;

        // Load JDBC Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");


        // Define connection URL
//        String url = "jdbc:sqlserver://LAPTOP-MRA262D7\\SQLEXPRESSCUSTOM:1433;"
//                + "databaseName=" + DB_NAME + ";"
//                + "encrypt=true;trustServerCertificate=true;"
//                + "useUnicode=true;characterEncoding=UTF-8;";
        //cau hinh database cua bao vao trong nay
//        String url = "jdbc:sqlserver://DESKTOP-O773SDH\\SQLEXPRESS:1433;"
//                + "databaseName=" + DB_NAME + ";"
//                + "encrypt=true;trustServerCertificate=true;"
//                + "useUnicode=true;characterEncoding=UTF-8;";
     //   cau hinh database cua Diamond vao trong nay
        String url = "jdbc:sqlserver://DESKTOP-J94HPC5\\SQLEXPRESS:1433;"
                + "databaseName=" + DB_NAME + ";"
                + "encrypt=true;trustServerCertificate=true;"
                + "useUnicode=true;characterEncoding=UTF-8;";




        // Connect to the database
        conn = DriverManager.getConnection(url, USER_NAME, PASSWORD);

        System.out.println("✅ Connection successful!");

        return conn;
    }
    
}
