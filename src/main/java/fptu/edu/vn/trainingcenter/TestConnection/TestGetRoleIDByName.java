package fptu.edu.vn.trainingcenter.TestConnection;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.AccountDAOImpl;

public class TestGetRoleIDByName {
    public static void main(String[] args) {
        // Khởi tạo đối tượng DAO của Role
        AccountDAOImpl roleDAO = new AccountDAOImpl();

        // Danh sách các tên role cần test
        String[] roleNames = {"Admin", "Customer", "Mechanic", "Sale"};

        // Lấy và in ra roleID cho từng tên role
        for (String roleName : roleNames) {
            String roleId = roleDAO.getRoleIdByName(roleName);
            System.out.println("Role Name: " + roleName + " -> RoleID: " + roleId);
        }
    }
}
