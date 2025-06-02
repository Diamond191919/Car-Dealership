/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.ServiceCustomerDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.ServiceCustomerDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.ServiceCustomerService;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForCustomer;

import java.util.List;


/**
 *
 * @author Diamond1
 */
public class ServiceCustomerServiceImpl implements ServiceCustomerService {
    private ServiceCustomerDAO serviceCustomerDAO = new ServiceCustomerDAOImpl();

    @Override
    public List<ServiceTicketForCustomer> getCustomerTickets(String custID) {
        return serviceCustomerDAO.getServiceTicketsByCustomerID(custID);
    }
}