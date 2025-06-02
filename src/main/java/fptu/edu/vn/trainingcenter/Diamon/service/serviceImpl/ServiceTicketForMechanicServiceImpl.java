/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.ServiceTicketForMechanicDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.ServiceTicketForMechanicDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.ServiceTicketForMechanicService;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForMechanic;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public class ServiceTicketForMechanicServiceImpl implements ServiceTicketForMechanicService {

    private ServiceTicketForMechanicDAO ticketDAO = new ServiceTicketForMechanicDAOImpl();

    @Override
    public List<ServiceTicketForMechanic> getAllTickets(String mechanicID){
        return ticketDAO.getAllTickets(mechanicID);
    }

    @Override
    public List<ServiceTicketForMechanic> searchTickets(String mechanicID, String searchType, String searchValue) {
        return ticketDAO.searchTickets(mechanicID, searchType, searchValue);
    }

}