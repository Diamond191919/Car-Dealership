/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.BaoPhaCode.DAO;

import fptu.edu.vn.trainingcenter.Model.Account;
import fptu.edu.vn.trainingcenter.Model.Customer;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author pc
 */
public class AccountDAO {

    public ArrayList<Account> getAccountByName(String fullName) {

        ArrayList<Account> lAccount = new ArrayList<>();

        Connection cn = null;

        try {

            cn = DatabaseConnection.getConnection();
            String sqlSearchByFullName = "Select id, name, address, email, phone, password, roleID, status, sex\n"
                    + "From dbo.Account\n"
                    + "Where name LIKE ?";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            pst.setString(1, fullName);                                          // Repalce "?" by name
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    long id = RTable.getLong("id");
                    String name = RTable.getString("name");
                    String address = RTable.getString("address");
                    String email = RTable.getString("email");
                    String phone = RTable.getString("phone");
                    String password = RTable.getString("password");
                    String roleID = RTable.getString("roleID");
                    String status = RTable.getString("status");
                    String sex = RTable.getString("sex");
                    Account acc = new Account(id, name, address, email, phone, password, status, sex, roleID);

                    lAccount.add(acc);
                }
                cn.close();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lAccount;
    }

    public boolean addAccountForCustomer(Customer inputCus) {
        boolean result = false;
        Connection cn = null;
        long phone = Long.parseLong(inputCus.getPhone());
        String email = "";
        try {
            cn = DatabaseConnection.getConnection();  // Khởi tạo kết nối
            String sql = "   INSERT INTO dbo.Account (id, name, address, email, phone, password, roleID, status, sex)\n" +
                    "SELECT TOP 1 \n" +
                    "       id + 1,  -- ID mới cao hơn ID lớn nhất hiện có\n" +
                    "       ?, \n" +
                    "       ?, \n" +
                    "       ?, \n" +
                    "       ?, \n" +
                    "       '123456', \n" +
                    "       '2', \n" +
                    "       'Active', \n" +
                    "       ?\n" +
                    "FROM dbo.Account\n" +
                    "WHERE CAST(id AS VARCHAR) LIKE '11%' \n" +
                    "ORDER BY id DESC;";

            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, inputCus.getCustName());
            pst.setString(2, inputCus.getCusAddress());
            pst.setString(3, email);
            pst.setLong(4, phone);
            pst.setString(5, inputCus.getSex());

            int rowsInserted = pst.executeUpdate();  // Dùng executeUpdate() thay vì executeQuery()
            if (rowsInserted > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();  // Đóng kết nối sau khi sử dụng
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }

    public long selectMaxID() {
        long result = 0;
        Customer maxCusID = new Customer();
        Account maxAccount = null;
        ArrayList<Customer> lCutomer = new ArrayList<>();

        Connection cn = null;

        try {
            cn = DatabaseConnection.getConnection();                                                  // Khởi tạo kết nối
            String sqlSelectMaxID = "SELECT custID, cust_name, phone, sex,cust_address FROM Customer \n" +
                    "  WHERE  custID= (SELECT MAX(custID) FROM Customer)";

            PreparedStatement pst = cn.prepareStatement(sqlSelectMaxID);    //PreparedStatement replace "?" from index 1
            ResultSet RTable = pst.executeQuery();

            if (RTable != null) {
                while (RTable.next()) {
                    long custID = RTable.getLong("custID");
                    String cust_name = RTable.getString("cust_name");
                    String phone = RTable.getString("phone");
                    String sex = RTable.getString("sex");
                    String cust_address = RTable.getString("cust_address");
                    Customer cus = new Customer(custID, cust_name, phone, sex, cust_address);

                    lCutomer.add(cus);

                    if (!lCutomer.isEmpty()) {
                        maxCusID = lCutomer.get(0);
                    }
                    result = maxCusID.getCustID();
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean isExitOnlyAnAccount(ArrayList<Account> inputAccounts) {
        boolean result = false;

        if (inputAccounts.size() == 1) {
            result = true;
        } else {
            return result;
        }
        return result;

    }

    public Account getAnAccount(ArrayList<Account> inputAccounts) {

        Account result = inputAccounts.get(0);

        return result;
    }

    public boolean checkPasswordByAccount(Account inputAccount, String inputPassword) {
        boolean result = false;
        if (inputAccount.getPassword().equals(inputPassword)) {
            result = true;
        } else {
            return result;
        }
        return result;

    }

    /*
    input: anaccount, int role
    out: boolean; true correct role; false incorrect role
     */
    public boolean checkRole(Account inputAccount, String inputRole) {
        boolean result = false;

        if (inputAccount.getRoleID().equals(inputRole)) {
            result = true;
        }

        return result;
    }

    public boolean isSameName(String inputName) {
        boolean result = false;
        Connection cn = null;
        ArrayList<Account> lAccount = new ArrayList<>();
        try {
            cn = DatabaseConnection.getConnection();                                                  // Khởi tạo kết nối
            String sqlSearchByFullName = "Select id, name, address, email, phone, password, roleID, status, sex\n"
                    + "From dbo.Account\n"
                    + "Where name LIKE ?";

            PreparedStatement pst = cn.prepareStatement(sqlSearchByFullName);    //PreparedStatement replace "?" from index 1
            pst.setString(1, inputName);                                          // Repalce "?" by name
            ResultSet RTable = pst.executeQuery();                               // Execute SQL

            if (RTable != null) {
                while (RTable.next()) {
                    long id = RTable.getLong("id");
                    String name = RTable.getString("name");
                    String address = RTable.getString("address");
                    String email = RTable.getString("email");
                    String phone = RTable.getString("phone");
                    String password = RTable.getString("password");
                    String roleID = RTable.getString("roleID");
                    String status = RTable.getString("status");
                    String sex = RTable.getString("sex");
                    Account acc = new Account(id, name, address, email, phone, password, status, sex, roleID);

                    lAccount.add(acc);
                }
                cn.close();
                if (lAccount.isEmpty()) {
                    result = false;
                } else {
                    result = true;
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();  // Đóng kết nối
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }

    public boolean inactiveAccount(long AccountID) {
        boolean result = false;

        Connection cn = null;

        try {
            cn = DatabaseConnection.getConnection();                                                  // Khởi tạo kết nối
            String sqlInactiveAccount = "UPDATE Account \n"
                    + "SET status = 'Inactive' \n"
                    + "WHERE id = ?";

            PreparedStatement pst = cn.prepareStatement(sqlInactiveAccount);              //PreparedStatement replace "?" from index 1
            pst.setLong(1, AccountID);

            int rowsInserted = pst.executeUpdate();  // Dùng executeUpdate() thay vì executeQuery()
            if (rowsInserted > 0) {
                result = true;
            }

            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}

//    public Customer AnAccountToCustomer(Account inputAccount) {
//        Customer result = new Customer();
//        String name = inputAccount.getName();
//        CustomerDAO cd = new CustomerDAO();
//        result = cd.getAllCustomerByFullName(name).get(0);
//        return result;
//    }
//    public Mechanic AnAccountToMechanic(Account inputAccount) {
//
//        Mechanic result = new Mechanic();
//        MechanicDAO md = new MechanicDAO();
//
//        return result = md.getMechanicByName(inputAccount.getName());
//
//    }
//    public SalesPerson AnAccountToSalesPerson(Account inputAccount) {
//        SalesPerson result = new SalesPerson();
//        SalesPersonDAO sd = new SalesPersonDAO();
//        return result = sd.getSalesPersonByame(inputAccount.getName());
//    }

