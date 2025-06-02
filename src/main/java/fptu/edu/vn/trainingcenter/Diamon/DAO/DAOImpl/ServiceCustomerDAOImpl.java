/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.ServiceCustomerDAO;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForCustomer;
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
public class ServiceCustomerDAOImpl implements ServiceCustomerDAO {

    @Override
    public List<ServiceTicketForCustomer> getServiceTicketsByCustomerID(String custID) {
        List<ServiceTicketForCustomer> ticketList = new ArrayList<>();
        System.out.println("id" + custID);
        String sql = "SELECT s.serviceTicketID, s.dateReceived, s.dateReturned, c.cust_name, " +
                "ca.model, ca.colour, ca.carID, ca.year, sv.service_name, pa.part_name, p.numberUsed, p.price " +
                "FROM ServiceTicket s " +
                "JOIN ServiceMechanic sm on s.serviceTicketID = sm.serviceTicketID " +
                "JOIN Service sv on sv.serviceID = sm.serviceID " +
                "JOIN PartsUsed p ON s.serviceTicketID = p.serviceTicketID " +
                "JOIN Parts pa ON p.partID = pa.partID " +
                "JOIN Customer c ON c.custID = s.custID " +
                "JOIN Cars ca ON ca.carID = s.carID " +
                "WHERE c.custID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, custID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ServiceTicketForCustomer ticket = new ServiceTicketForCustomer();
                ticket.setServiceTicketID(rs.getString("serviceTicketID"));
                ticket.setDateRecived(rs.getString("dateReceived"));
                ticket.setDateReturned(rs.getString("dateReturned"));
                ticket.setCust_name(rs.getString("cust_name"));
                ticket.setModel(rs.getString("model"));
                ticket.setColour(rs.getString("colour"));
                ticket.setCarID(rs.getString("carID"));
                ticket.setYear(rs.getString("service_name"));
                ticket.setPart_name(rs.getString("part_name"));
                ticket.setNumberUsed(rs.getInt("numberUsed"));
                ticket.setPrice(rs.getDouble("price"));

                ticketList.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ticketList;
    }
}