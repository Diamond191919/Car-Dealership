/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.InvoiceDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.InvoiceDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.InvoiceService;
import fptu.edu.vn.trainingcenter.Model.Invoice;
import fptu.edu.vn.trainingcenter.Utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.List;

/**
 *
 * @author Diamond1
 */
public class InvoiceServiceImpl implements InvoiceService {
    private InvoiceDAO invoiceDAO = new InvoiceDAOImpl();

    @Override
    public List<Invoice> getAllInvoices(Long salesID) {
        return invoiceDAO.getAllInvoices(Long.valueOf(salesID));
    }

    @Override
    public List<Invoice> getInvoicesBySalesPerson(Long salesID) {
        return invoiceDAO.getInvoicesBySalesPerson(salesID);
    }

    public List<Invoice> getInvoicesNotBySalesPerson(Long salesID) {
        return invoiceDAO.getInvoicesNotBySalesPerson(salesID);
    }

    @Override
    public void updateInvoiceStatus(int invoiceID, String status) {
        invoiceDAO.updateStatus(invoiceID, status);
    }

    @Override
    public int getMaxInvoiceID() {
        return invoiceDAO.getMaxInvoiceID();
    }

    @Override
    public boolean insertInvoice(Invoice invoice) {
        return invoiceDAO.insertInvoice(invoice);
    }

}
