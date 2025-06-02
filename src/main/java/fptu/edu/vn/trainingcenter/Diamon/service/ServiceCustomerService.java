/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service;

import fptu.edu.vn.trainingcenter.Model.ServiceTicketForCustomer;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public interface ServiceCustomerService {
    List<ServiceTicketForCustomer> getCustomerTickets(String custID);
}
