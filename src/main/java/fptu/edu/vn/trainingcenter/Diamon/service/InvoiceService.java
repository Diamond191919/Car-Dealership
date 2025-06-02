/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service;

import fptu.edu.vn.trainingcenter.Model.Invoice;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public interface InvoiceService {

    List<Invoice> getAllInvoices(Long salesID);

    List<Invoice> getInvoicesBySalesPerson(Long salesID);

    List<Invoice> getInvoicesNotBySalesPerson(Long salesID);

    void updateInvoiceStatus(int invoiceID, String status);

    boolean insertInvoice(Invoice invoice);

    int getMaxInvoiceID();

}
