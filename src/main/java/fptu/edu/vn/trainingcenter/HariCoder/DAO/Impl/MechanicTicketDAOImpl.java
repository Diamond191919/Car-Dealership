package fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl;


import fptu.edu.vn.trainingcenter.HariCoder.DAO.IMechanicTicketDAO;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;
import fptu.edu.vn.trainingcenter.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MechanicTicketDAOImpl implements IMechanicTicketDAO {

    public List<ServiceMechanic> getAllServiceTicketsForMechanicUpdate() {
        List<ServiceMechanic> serviceMechanics = new ArrayList<>();
        String sql = "SELECT serviceTicketID, serviceID, mechanicID, hours, comment, rate " +
                "FROM [Car_DealerShip].[dbo].[ServiceMechanic]";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                ServiceMechanic sm = new ServiceMechanic();
                sm.setServiceTicketID(rs.getInt("serviceTicketID"));
                sm.setServiceID(rs.getInt("serviceID"));
                sm.setMechanicID(rs.getLong("mechanicID"));
                sm.setHours(rs.getInt("hours"));
                sm.setComment(rs.getString("comment"));
                sm.setRate(rs.getDouble("rate"));
                serviceMechanics.add(sm);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return serviceMechanics;
    }

    @Override
    public boolean updateServiceTicket(ServiceMechanic serviceMechanic) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // Cập nhật bảng ServiceMechanic
            String sql1 = "UPDATE [dbo].[ServiceMechanic] SET hours = ?, comment = ?, rate = ? " +
                    "WHERE serviceTicketID = ? AND serviceID = ? AND mechanicID = ?";
            try (PreparedStatement ps1 = connection.prepareStatement(sql1)) {
                ps1.setInt(1, serviceMechanic.getHours());
                ps1.setString(2, serviceMechanic.getComment());
                ps1.setDouble(3, serviceMechanic.getRate());
                ps1.setInt(4, serviceMechanic.getServiceTicketID());
                ps1.setInt(5, serviceMechanic.getServiceID());
                ps1.setLong(6, serviceMechanic.getMechanicID());
                int rowsAffected = ps1.executeUpdate();

                // Nếu update thành công, cập nhật bảng Service
                if (rowsAffected > 0) {
                    String sql2 = "UPDATE [dbo].[Service] SET hourly_rate = ? WHERE serviceID = ?";
                    try (PreparedStatement ps2 = connection.prepareStatement(sql2)) {
                        ps2.setDouble(1, serviceMechanic.getRate());
                        ps2.setInt(2, serviceMechanic.getServiceID());
                        ps2.executeUpdate();
                    }
                    connection.commit();
                    return true;
                } else {
                    connection.rollback();
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }




    public ServiceMechanic getServiceTicketById(int serviceTicketID, int serviceID, Long mechanicID) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // Sử dụng HQL để tìm kiếm theo 3 tham số
            String hql = "FROM ServiceMechanic sm WHERE sm.serviceTicketID = :serviceTicketID " +
                    "AND sm.serviceID = :serviceID AND sm.mechanicID = :mechanicID";
            Query<ServiceMechanic> query = session.createQuery(hql, ServiceMechanic.class);
            query.setParameter("serviceTicketID", serviceTicketID);
            query.setParameter("serviceID", serviceID);
            query.setParameter("mechanicID", mechanicID);
            query.setMaxResults(1); // Chỉ lấy một kết quả duy nhất

            // Trả về kết quả duy nhất nếu có
            return query.uniqueResult();
        } finally {
            session.close();
        }
    }


}
