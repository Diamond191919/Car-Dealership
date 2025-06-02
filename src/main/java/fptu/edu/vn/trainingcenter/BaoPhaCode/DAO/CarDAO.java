/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.DAO;

import fptu.edu.vn.trainingcenter.Model.Car;
import fptu.edu.vn.trainingcenter.Model.Customer;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;
import org.hibernate.mapping.Array;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




/**
 *
 * @author pc.
 */
public class CarDAO {

    public ArrayList<Car> getAllAvailableCar() {
        ArrayList<Car> LCar = new ArrayList<>();
        
        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            String sqlGetAllAvailableCar = "SELECT *\n" +
                    "FROM dbo.Cars\n" +
                    "WHERE status = 'Available'";

            PreparedStatement pst = cn.prepareStatement(sqlGetAllAvailableCar);    //PreparedStatement replace "?" from index 1
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    Long carID = RTable.getLong("carID");
                    String car_name = RTable.getString("car_name");
                    double price = RTable.getDouble("price");
                    String serialNumber = RTable.getString("serialNumber");
                    String model = RTable.getString("model");
                    String colour = RTable.getString("colour");
                    int year = RTable.getInt("year");
                    String img = RTable.getString("img");
                    String status = RTable.getString("status");
                    String description = RTable.getString("description");
                    Car car = new Car(carID, car_name,price,serialNumber,model,colour,year,img,status,description);
                    LCar.add(car);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return LCar;
    }
    
    
    public ArrayList<Car> getAllCarBySerialNumber(String intputSerialNumber) {
        ArrayList<Car> LCar = new ArrayList<>();
        
        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            String sqlSearchByFullName = "SELECT carID, serialNumber, model, colour, year\n"
                    + "FROM dbo.Cars\n"
                    + "WHERE serialNumber LIKE ?";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            pst.setString(1, intputSerialNumber);                              // Repalce "?" by name
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    int carID = RTable.getInt("carID");
                    String serialNumber = RTable.getString("serialNumber");
                    String model = RTable.getString("model");
                    String colour = RTable.getString("colour");
                    int year = RTable.getInt("year");
                   // Car c = new Car(carID, serialNumber, model, colour, year);
                   // LCar.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return LCar;
    }


    public ArrayList<Car> getAllCar() {
        ArrayList<Car> LCar = new ArrayList<>();

        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            String sqlSearchByFullName = "SELECT \n" +
                    "    carID,\n" +
                    "    car_name,\n" +
                    "    price,\n" +
                    "    serialNumber,\n" +
                    "    model,\n" +
                    "    colour,\n" +
                    "    year,\n" +
                    "    img,\n" +
                    "    status,\n" +
                    "    description\n" +
                    "FROM cars;";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    Long carID = RTable.getLong("carID");
                    String car_name = RTable.getString("car_name");
                    double price = RTable.getDouble("price");
                    String serialNumber = RTable.getString("serialNumber");
                    String model = RTable.getString("model");
                    String colour = RTable.getString("colour");
                    int year = RTable.getInt("year");
                    String img = RTable.getString("img");
                    String status = RTable.getString("status");
                    String description = RTable.getString("description");
                    Car car = new Car(carID, car_name,price,serialNumber,model,colour,year,img,status,description);
                    LCar.add(car);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return LCar;
    }


    public ArrayList<Car> findCar(String inputCar_name, String inputSerialNumber, String inputModel, String inputYear) {
        ArrayList<Car> LCar = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DatabaseConnection.getConnection();  // Kết nối database

            // Câu SQL dùng dấu ? thay vì @param
            String sqlSearchByFullName = "SELECT " +
                    "carID, car_name, price, serialNumber, model, colour, year, img, status, description " +
                    "FROM cars " +
                    "WHERE " +
                    "(? IS NULL OR car_name LIKE ?) " +
                    "AND (? IS NULL OR serialNumber LIKE ?) " +
                    "AND (? IS NULL OR model LIKE ?) " +
                    "AND (? IS NULL OR year LIKE ?)";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);

            // Xử lý tham số đầu vào: Nếu null hoặc rỗng -> truyền NULL
            pst.setObject(1, (inputCar_name == null || inputCar_name.trim().isEmpty()) ? null : inputCar_name);
            pst.setObject(2, (inputCar_name == null || inputCar_name.trim().isEmpty()) ? null : "%" + inputCar_name + "%");

            pst.setObject(3, (inputSerialNumber == null || inputSerialNumber.trim().isEmpty()) ? null : inputSerialNumber);
            pst.setObject(4, (inputSerialNumber == null || inputSerialNumber.trim().isEmpty()) ? null : "%" + inputSerialNumber + "%");

            pst.setObject(5, (inputModel == null || inputModel.trim().isEmpty()) ? null : inputModel);
            pst.setObject(6, (inputModel == null || inputModel.trim().isEmpty()) ? null : "%" + inputModel + "%");

            pst.setObject(7, (inputYear == null || inputYear.trim().isEmpty()) ? null : inputYear);
            pst.setObject(8, (inputYear == null|| inputYear.trim().isEmpty()) ? null : "%" + inputYear + "%");
            //pst.setObject(8, (inputYear == 0) ? null : inputYear);

            ResultSet RTable = pst.executeQuery();  // Thực thi truy vấn

            while (RTable.next()) {
                Long carID = RTable.getLong("carID");
                String car_name = RTable.getString("car_name");
                double price = RTable.getDouble("price");
                String serialNumber = RTable.getString("serialNumber");
                String model = RTable.getString("model");
                String colour = RTable.getString("colour");
                int year = RTable.getInt("year");
                String img = RTable.getString("img");
                String status = RTable.getString("status");
                String description = RTable.getString("description");

                // Tạo đối tượng Car và thêm vào danh sách
                Car car = new Car(carID, car_name, price, serialNumber, model, colour, year, img, status, description);
                LCar.add(car);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();  // Đóng kết nối database
            } catch (Exception ignored) {}
        }

        return LCar;
    }


    public boolean deleteCar(Long inputDleteCarID) {
        boolean isDeleted = false;


        ArrayList<Car> LCar = new ArrayList<>();

        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            // Câu lệnh SQL để xóa xe theo carID
            String sqlDeleteCar = "UPDATE Cars SET status = N'UnAvailable' WHERE carID = ?";
            PreparedStatement pst = cn.prepareStatement(sqlDeleteCar);

            pst = cn.prepareStatement(sqlDeleteCar);
            pst.setLong(1, inputDleteCarID);  // Thay thế tham số ? bằng inputDleteCarID

            // Thực thi câu lệnh
            int rowsAffected = pst.executeUpdate();

            // Kiểm tra xem có dòng nào bị ảnh hưởng không (tức là xe đã bị xóa)
            if (rowsAffected > 0) {
                isDeleted = true;  // Thành công, có ít nhất một xe bị xóa
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

    public boolean updateCar(Car inputUpdateCar) {
        boolean isUpdated = false;
        ArrayList<Car> LCar = new ArrayList<>();

        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            // Câu lệnh SQL để xóa xe theo carID
            String sqlDeleteCar = "UPDATE cars\n" +
                    "SET car_name = ?, price = ?, serialNumber = ?, model = ?, colour = ?, year = ?, img = ?, status = ?, description = ?\n" +
                    "WHERE carID = ?;";
            PreparedStatement pst = cn.prepareStatement(sqlDeleteCar);
            pst.setString(1, inputUpdateCar.getCar_name());
            pst.setDouble(2, inputUpdateCar.getPrice());
            pst.setString(3, inputUpdateCar.getSerialNumber());
            pst.setString(4, inputUpdateCar.getModel());
            pst.setString(5, inputUpdateCar.getColour());
            pst.setInt(6, inputUpdateCar.getYear());
            pst.setString(7, inputUpdateCar.getImg());
            pst.setString(8, inputUpdateCar.getStatus());
            pst.setString(9, inputUpdateCar.getDescription());

            // Thực thi câu lệnh
            int rowsAffected = pst.executeUpdate();

            // Kiểm tra xem có dòng nào bị ảnh hưởng không (tức là xe đã bị xóa)
            if (rowsAffected > 0) {
                isUpdated = true;  // Thành công, có ít nhất một xe bị xóa
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public long getNextCarID() {
        Connection cn = null;
        long nextID = 1; // Giá trị mặc định nếu bảng chưa có dữ liệu

        try {
            cn = DatabaseConnection.getConnection(); // Kết nối database
            String sql = "SELECT MAX(carID) FROM cars";

            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                long maxID = rs.getLong(1); // Lấy ID cao nhất
                nextID = maxID + 1; // Cộng thêm 1
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (Exception ignored) {}
        }

        return nextID;
    }



    public boolean CreateCar(Car inputCar) {
        boolean isCreate = false;
        inputCar.setCarID(getNextCarID()); // Lấy ID tiếp theo

        Connection cn = null;
        PreparedStatement pst = null;

        try {
            cn = DatabaseConnection.getConnection(); // Kết nối database

            String sqlCreate = "INSERT INTO cars (carID, car_name, price, serialNumber, model, colour, year, img, status, description) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pst = cn.prepareStatement(sqlCreate);

            pst.setLong(1, inputCar.getCarID());      // carID
            pst.setString(2, inputCar.getCar_name()); // car_name
            pst.setDouble(3, inputCar.getPrice());    // price
            pst.setString(4, inputCar.getSerialNumber()); // serialNumber
            pst.setString(5, inputCar.getModel());    // model
            pst.setString(6, inputCar.getColour());   // colour
            pst.setInt(7, inputCar.getYear());        // year
            pst.setString(8, inputCar.getImg());      // img
            pst.setString(9, "Available");            // status (sửa lỗi sai cú pháp)
            pst.setString(10, inputCar.getDescription()); // description

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                isCreate = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (cn != null) cn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return isCreate;
    }

    public Car getCarByID(long inputCarID) {
        Car car = new Car();

        ArrayList<Car> LCar = new ArrayList<>();

        Connection cn = null;  //Create connection

        try {
            cn = DatabaseConnection.getConnection();                                                    // Khởi tạo kết nối

            // Câu lệnh SQL để xóa xe theo carID
            String sqlGetCarByID = "SELECT carID, car_name, price, serialNumber, model, colour,year,img, status, description\n" +
                    "FROM dbo.Cars\n" +
                    "WHERE carID = ?";

            PreparedStatement pst = cn.prepareStatement(sqlGetCarByID);
            pst.setLong(1,inputCarID);//PreparedStatement replace "?" from index 1
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    Long carID = RTable.getLong("carID");
                    String car_name = RTable.getString("car_name");
                    double price = RTable.getDouble("price");
                    String serialNumber = RTable.getString("serialNumber");
                    String model = RTable.getString("model");
                    String colour = RTable.getString("colour");
                    int year = RTable.getInt("year");
                    String img = RTable.getString("img");
                    String status = RTable.getString("status");
                    String description = RTable.getString("description");
                    Car c = new Car(carID, car_name,price,serialNumber,model,colour,year,img,status,description);
                    LCar.add(c);
                }

            }


            if (!LCar.isEmpty()) {
                car = LCar.get(0);
            }

            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }



        return car;
    }


    
}
