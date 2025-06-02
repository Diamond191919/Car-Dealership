/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.DAO;

import fptu.edu.vn.trainingcenter.Model.Invoice;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public interface InvoiceDAO {

    List<Invoice> getAllInvoices(Long salesID);

    List<Invoice> getInvoicesBySalesPerson(Long salesID);

    List<Invoice> getInvoicesNotBySalesPerson(Long salesID);
    
    void updateStatus(int invoiceID, String status);
    
    boolean insertInvoice(Invoice invoice);

    int getMaxInvoiceID();

}
