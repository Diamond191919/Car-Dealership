
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service;

import fptu.edu.vn.trainingcenter.Model.ServiceTicketForMechanic;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public interface ServiceTicketForMechanicService {

    List<ServiceTicketForMechanic> getAllTickets(String mechanicID);

    List<ServiceTicketForMechanic> searchTickets(String mechanicID, String searchType, String searchValue);

}
