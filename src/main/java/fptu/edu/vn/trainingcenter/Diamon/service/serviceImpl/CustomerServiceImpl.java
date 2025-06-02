/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl;


import fptu.edu.vn.trainingcenter.Diamon.DAO.CustomerDAO;
import fptu.edu.vn.trainingcenter.Diamon.DAO.DAOImpl.CustomerDAOImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.CustomerService;
import fptu.edu.vn.trainingcenter.Model.Customer;

import java.util.List;



public class CustomerServiceImpl implements CustomerService {
    private CustomerDAO customerDAO = new CustomerDAOImpl();

    @Override
    public List<Customer> getCustomersNotInSalesInvoice() {
        return customerDAO.getCustomersNotInSalesInvoice();
    }
}
