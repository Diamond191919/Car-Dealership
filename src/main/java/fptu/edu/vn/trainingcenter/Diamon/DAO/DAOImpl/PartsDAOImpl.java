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

import fptu.edu.vn.trainingcenter.Diamon.DAO.PartsDAO;
import fptu.edu.vn.trainingcenter.Model.Parts;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartsDAOImpl implements PartsDAO {

    @Override
    public List<Parts> getAllParts() {
        List<Parts> partsList = new ArrayList<>();
        String query = "SELECT * FROM Parts";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Parts part = new Parts(
                        rs.getInt("partID"),
                        rs.getString("part_name"),
                        rs.getDouble("purchasePrice"),
                        rs.getDouble("retailPrice")
                );
                partsList.add(part);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return partsList;
    }

    @Override
    public Parts getById(int id) {
        Parts part = null;
        String sql = "SELECT * FROM parts WHERE partID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                part = new Parts();
                part.setPartID(rs.getInt("partID"));
                part.setPartName(rs.getString("part_name"));
                part.setPurchasePrice(rs.getDouble("purchasePrice"));
                part.setRetailPrice(rs.getDouble("retailPrice"));
                // Thiết lập các thuộc tính khác của phần nếu cần
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return part;
    }

    @Override
    public List<Parts> getByPartsName(String partName) {
        List<Parts> partsList = new ArrayList<>();
        String query = "SELECT * FROM Parts WHERE LOWER(part_name) LIKE LOWER(?)";  // Dùng LOWER() để không phân biệt chữ hoa chữ thường

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, "%" + partName + "%");  // Dùng % để tìm theo phần tên
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Parts part = new Parts(
                        rs.getInt("partID"),
                        rs.getString("part_name"),
                        rs.getDouble("purchasePrice"),
                        rs.getDouble("retailPrice")
                );
                partsList.add(part);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return partsList;  // Trả về danh sách các phần khớp với từ khóa
    }

    @Override
    public boolean addPart(Parts part) {
        String checkQuery = "SELECT COUNT(*) FROM Parts WHERE part_name = ?";
        String maxIdQuery = "SELECT MAX(partID) FROM Parts";
        String insertQuery = "INSERT INTO Parts (partID, part_name, purchasePrice, retailPrice) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection()) {
            // 1. Kiểm tra xem partName đã tồn tại chưa
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setString(1, part.getPartName());
                ResultSet rsCheck = checkStmt.executeQuery();
                if (rsCheck.next() && rsCheck.getInt(1) > 0) {
                    System.out.println("Part name đã tồn tại, không thể thêm.");
                    return false;
                }
            }

            // 2. Lấy partID lớn nhất hiện tại
            int newId = 1; // Giá trị mặc định nếu bảng rỗng
            try (PreparedStatement maxIdStmt = conn.prepareStatement(maxIdQuery);
                    ResultSet rsMaxId = maxIdStmt.executeQuery()) {
                if (rsMaxId.next() && rsMaxId.getInt(1) > 0) {
                    newId = rsMaxId.getInt(1) + 1;
                }
            }

            // 3. Thêm part mới với ID vừa tính được
            try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                pstmt.setInt(1, newId);
                pstmt.setString(2, part.getPartName());
                pstmt.setDouble(3, part.getPurchasePrice());
                pstmt.setDouble(4, part.getRetailPrice());

                return pstmt.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updatePart(Parts part) {
        String selectQuery = "SELECT * FROM Parts WHERE partID=?";
        String updateQuery = "UPDATE Parts SET part_name=?, purchasePrice=?, retailPrice=? WHERE partID=?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement selectStmt = conn.prepareStatement(selectQuery)) {

            selectStmt.setInt(1, part.getPartID());
            ResultSet rs = selectStmt.executeQuery();

            if (rs.next()) {
                // Giữ nguyên giá trị cũ nếu không có dữ liệu mới
                String partName = part.getPartName().isEmpty() ? rs.getString("partName") : part.getPartName();
                double purchasePrice = part.getPurchasePrice() == -1 ? rs.getDouble("purchasePrice") : part.getPurchasePrice();
                double retailPrice = part.getRetailPrice() == -1 ? rs.getDouble("retailPrice") : part.getRetailPrice();

                try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                    updateStmt.setString(1, partName);
                    updateStmt.setDouble(2, purchasePrice);
                    updateStmt.setDouble(3, retailPrice);
                    updateStmt.setInt(4, part.getPartID());

                    return updateStmt.executeUpdate() > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deletePart(int id) {
        String query = "DELETE FROM Parts WHERE partID=?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
