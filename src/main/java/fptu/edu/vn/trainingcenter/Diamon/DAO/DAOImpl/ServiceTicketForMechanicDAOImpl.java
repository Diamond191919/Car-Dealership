/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.ServiceTicketForMechanicDAO;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForMechanic;
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
public class ServiceTicketForMechanicDAOImpl implements ServiceTicketForMechanicDAO {

    @Override
    public List<ServiceTicketForMechanic> getAllTickets(String mechanicID) {
        List<ServiceTicketForMechanic> tickets = new ArrayList<>();
        String sql = "SELECT s.serviceTicketID, se.serviceID, m.mechanic_name, s.dateReceived, s.dateReturned, "
                + "c.custID, c.cust_name, ca.carID, ca.model, se.hours, se.comment, se.rate "
                + "FROM ServiceTicket s "
                + "JOIN Customer c ON c.custID = s.custID "
                + "JOIN Cars ca ON ca.carID = s.carID "
                + "JOIN ServiceMechanic se ON se.serviceTicketID = s.serviceTicketID "
                + "JOIN Mechanic m ON m.mechanicID = se.mechanicID ";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ServiceTicketForMechanic ticket = new ServiceTicketForMechanic();
                ticket.setServiceTicketID(rs.getString("serviceTicketID"));
                ticket.setServiceID(rs.getString("serviceID"));
                ticket.setMechanicID(rs.getString("mechanic_name"));
                ticket.setDateRecived(rs.getString("dateReceived"));
                ticket.setDateReturned(rs.getString("dateReturned"));
                ticket.setCustID(rs.getString("custID"));
                ticket.setCust_name(rs.getString("cust_name"));
                ticket.setCarID(rs.getString("carID"));
                ticket.setModel(rs.getString("model"));
                ticket.setHours(rs.getInt("hours"));
                ticket.setComment(rs.getString("comment"));
                ticket.setRate(rs.getDouble("rate"));

                tickets.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }

    @Override
    public List<ServiceTicketForMechanic> searchTickets(String mechanicID, String searchType, String searchValue) {
        List<ServiceTicketForMechanic> ticketList = new ArrayList<>();
        String sql = "SELECT s.serviceTicketID, se.serviceID, m.mechanic_name, s.dateReceived, s.dateReturned, "
                + "c.custID, c.cust_name, ca.carID, ca.model, se.hours, se.comment, se.rate "
                + "FROM ServiceTicket s "
                + "JOIN Customer c ON c.custID = s.custID "
                + "JOIN Cars ca ON ca.carID = s.carID "
                + "JOIN ServiceMechanic se ON se.serviceTicketID = s.serviceTicketID "
                + "JOIN Mechanic m ON m.mechanicID = se.mechanicID "
                + "WHERE ";

        if ("custID".equals(searchType)) {
            sql += " c.custID LIKE ?";
        } else if ("carID".equals(searchType)) {
            sql += " ca.carID LIKE ?";
        } else if ("dateReceived".equals(searchType)) {
            sql += " s.dateReceived LIKE ?";
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + searchValue + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ServiceTicketForMechanic ticket = new ServiceTicketForMechanic();
                ticket.setServiceTicketID(rs.getString("serviceTicketID"));
                ticket.setServiceID(rs.getString("serviceID"));
                ticket.setMechanicID(rs.getString("mechanic_name"));
                ticket.setDateRecived(rs.getString("dateReceived"));
                ticket.setDateReturned(rs.getString("dateReturned"));
                ticket.setCustID(rs.getString("custID"));
                ticket.setCust_name(rs.getString("cust_name"));
                ticket.setCarID(rs.getString("carID"));
                ticket.setModel(rs.getString("model"));
                ticket.setHours(rs.getInt("hours"));
                ticket.setComment(rs.getString("comment"));
                ticket.setRate(rs.getDouble("rate"));

                ticketList.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ticketList;
    }


}