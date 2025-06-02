/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.InvoiceDAO;
import fptu.edu.vn.trainingcenter.Model.Invoice;
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
public class InvoiceDAOImpl implements InvoiceDAO {

    @Override
    public List<Invoice> getAllInvoices(Long salesID) {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT sa.*, s.sales_name, c.cust_name, ca.model, ca.colour, ca.year "
                + "FROM SalesInvoice sa "
                + "JOIN SalesPerson s ON sa.salesID = s.salesID "
                + "JOIN Customer c ON sa.custID = c.custID "
                + "JOIN Cars ca ON ca.carID = sa.carID ";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Invoice invoice = new Invoice();
                invoice.setInvoiceId(rs.getInt("invoiceID"));
                invoice.setInvoiceDate(rs.getString("invoiceDate"));
                invoice.setSalesID(rs.getString("sales_name"));
                invoice.setCustID(rs.getString("cust_name"));
                invoice.setCarID(rs.getString("model") + " - " + rs.getString("colour") + " (" + rs.getString("year") + ")");
                invoice.setStatus(rs.getString("status"));

                invoices.add(invoice);
            }
            System.out.println("Query executed with salesID: " + salesID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoices;
    }

    @Override
    public List<Invoice> getInvoicesBySalesPerson(Long salesID) {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT sa.*, s.sales_name, c.cust_name, ca.model, ca.colour, ca.year "
                + "FROM SalesInvoice sa "
                + "JOIN SalesPerson s ON sa.salesID = s.salesID "
                + "JOIN Customer c ON sa.custID = c.custID "
                + "JOIN Cars ca ON ca.carID = sa.carID "
                + "WHERE s.salesID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setLong(1, salesID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Invoice invoice = new Invoice();
                invoice.setInvoiceId(rs.getInt("invoiceID"));
                invoice.setInvoiceDate(rs.getString("invoiceDate"));
                invoice.setSalesID(rs.getString("sales_name"));
                invoice.setCustID(rs.getString("cust_name"));
                invoice.setCarID(rs.getString("model") + " - " + rs.getString("colour") + " (" + rs.getString("year") + ")");
                invoice.setStatus(rs.getString("status"));

                invoices.add(invoice);
            }
            System.out.println("Query executed with salesID: " + salesID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoices;
    }

    @Override
    public List<Invoice> getInvoicesNotBySalesPerson(Long salesID) {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT sa.*, s.sales_name, c.cust_name, ca.model, ca.colour, ca.year "
                + "FROM SalesInvoice sa "
                + "JOIN SalesPerson s ON sa.salesID = s.salesID "
                + "JOIN Customer c ON sa.custID = c.custID "
                + "JOIN Cars ca ON ca.carID = sa.carID "
                + "WHERE s.salesID <> ?";  // Chỉ lấy hóa đơn của SalesPerson KHÁC

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, salesID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Invoice invoice = new Invoice();
                invoice.setInvoiceId(rs.getInt("invoiceID"));
                invoice.setInvoiceDate(rs.getString("invoiceDate"));
                invoice.setSalesID(rs.getString("sales_name"));
                invoice.setCustID(rs.getString("cust_name"));
                invoice.setCarID(rs.getString("model") + " - " + rs.getString("colour") + " (" + rs.getString("year") + ")");
                invoice.setStatus(rs.getString("status"));

                invoices.add(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return invoices;
    }

    @Override
    public void updateStatus(int invoiceID, String status) {
        String sql = "UPDATE SalesInvoice SET status = ? WHERE invoiceID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, invoiceID);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean insertInvoice(Invoice invoice) {
        String sql = "INSERT INTO SalesInvoice (invoiceID, invoiceDate, salesID, carID, custID, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, invoice.getInvoiceId());
            ps.setString(2, invoice.getInvoiceDate());
            ps.setString(3, invoice.getSalesID());
            ps.setString(4, invoice.getCarID());
            ps.setString(5, invoice.getCustID());
            ps.setString(6, invoice.getStatus());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int getMaxInvoiceID() {
        int maxID = 0;
        String sql = "SELECT MAX(invoiceID) FROM SalesInvoice";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                maxID = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maxID;
    }

}
