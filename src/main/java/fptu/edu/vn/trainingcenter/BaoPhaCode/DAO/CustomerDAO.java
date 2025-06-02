/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.DAO;

import fptu.edu.vn.trainingcenter.Model.Customer;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author pc
 */
public class CustomerDAO {

    /*
    input: Customer name
    output: List Cusstomer
     */
    public ArrayList<Customer> getAllCustomerByName(String fullName) {

        ArrayList<Customer> listCustomer = new ArrayList<>();
        Connection cn = null;  //Create connection
        try {
            cn = DatabaseConnection.getConnection();

            String sqlSearchByFullName = "select custID, cust_name, phone, sex, cust_address\n"
                    + "from dbo.Customer\n"
                    + "where cust_name like ?";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            pst.setString(1, "%" + fullName + "%");                              // Repalce "?" by name
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    long custid = RTable.getLong("CustID");
                    String cusname = RTable.getString("cust_name");
                    String cusphone = RTable.getString("phone");
                    String cussex = RTable.getString("sex");
                    String cusaddress = RTable.getString("cust_address");
                    Customer c = new Customer(custid, cusname, cusphone, cussex, cusaddress);
                    listCustomer.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCustomer;
    }

    public boolean addCustomer(Customer addCus, long inputMaxID) {
        boolean result = false;
        Connection cn = null;

        try {
            cn = DatabaseConnection.getConnection();  // Khởi tạo kết nối

            String sql = "INSERT INTO Customer (custID, cust_name, phone, sex, cust_address)"
                    + " VALUES (?, ?, ?, ?, ?)";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setLong(1, inputMaxID);
            pst.setString(2, addCus.getCustName());
            pst.setString(3, addCus.getPhone());
            pst.setString(4, addCus.getSex());
            pst.setString(5, addCus.getCusAddress());

            int rowsInserted = pst.executeUpdate();  // Dùng executeUpdate() thay vì executeQuery()
            if (rowsInserted > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean deleteCustomer(String inputCusID) {
        boolean result = false;
        long custID = Long.parseLong(inputCusID);
        Connection cn = null;

        try {
            cn = DatabaseConnection.getConnection();  

            String sql = "DELETE FROM Customer "
                        + "WHERE custID = ?";  

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setLong(1, custID);  

            int rowsDeleted = pst.executeUpdate();  
            if (rowsDeleted > 0) {
                result = true;  // Nếu có dòng bị xóa, trả về true
            }

            cn.close();  

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public Customer selectMaxCusID() {

        Customer RCustomer = null;

        ArrayList<Customer> listCustomer = new ArrayList<>();
        Connection cn = null;  //Create connection
        try {
            cn = DatabaseConnection.getConnection();                                                     // Khởi tạo kết nối

            String sqlSearchByFullName = "SELECT * FROM Customer \n"
                    + "WHERE custID = (SELECT MAX(custID) FROM Customer)";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    long custid = RTable.getLong("CustID");
                    String cusname = RTable.getString("cust_name");
                    String cusphone = RTable.getString("phone");
                    String cussex = RTable.getString("sex");
                    String cusaddress = RTable.getString("cust_address");
                    Customer c = new Customer(custid, cusname, cusphone, cussex, cusaddress);
                    listCustomer.add(c);
                }
            }

            // Lấy khách hàng đầu tiên nếu danh sách không rỗng
            if (!listCustomer.isEmpty()) {
                RCustomer = listCustomer.get(0);
            }

            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return RCustomer;
    }

    public boolean updateCustomer(Customer uCus) {
        boolean result = false;
        Connection cn = null;
        long phone = Long.parseLong(uCus.getPhone());
        try {
            cn = DatabaseConnection.getConnection();  // Kết nối đến database

            String sql = "UPDATE Customer  \n"
                    + "SET cust_name = ?,  \n"
                    + "    phone = ?,  \n"
                    + "    sex = ?,  \n"
                    + "    cust_address = ?  \n"
                    + "WHERE custID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);

            pst.setString(1, uCus.getCustName());
            pst.setLong(2, phone);
            pst.setString(3, uCus.getSex());
            pst.setString(4, uCus.getCusAddress());
            pst.setString(5, String.valueOf(uCus.getCustID()));  // Đúng vị trí thứ 5

            int rowsAffected = pst.executeUpdate();  // Dùng executeUpdate() thay vì executeQuery()

            if (rowsAffected > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();  // Đóng kết nối
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public boolean isChanging(Customer oldCus, Customer newCus) {
        if (oldCus == null || newCus == null) {
            return false;  // Nếu có giá trị null, không thay đổi
        }

        return !(Objects.equals(oldCus.getCustName().trim(), newCus.getCustName().trim())
                && Objects.equals(oldCus.getPhone().trim(), newCus.getPhone().trim())
                && Objects.equals(oldCus.getSex().trim(), newCus.getSex().trim())
                && Objects.equals(oldCus.getCusAddress().trim(), newCus.getCusAddress().trim()));
    }

}
