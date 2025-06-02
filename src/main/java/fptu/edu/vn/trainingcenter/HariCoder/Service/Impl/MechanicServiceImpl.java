/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.Service.Impl;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.IMechanicDAO;
import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.MechanicDAOImpl;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicService;
import fptu.edu.vn.trainingcenter.Model.Service;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MechanicServiceImpl implements IMechanicService {
    private IMechanicDAO mechanicDAO;

    public MechanicServiceImpl() {
        this.mechanicDAO = new MechanicDAOImpl();
    }

    @Override
    public boolean createMechanicService(Service service) {
        return mechanicDAO.createMechanicService(service);
    }

    @Override
    public Service getServiceById(Long serviceID) {
        return mechanicDAO.getServiceById(serviceID);
    }

    @Override
    public boolean updateMechanicService(Service service) {
        return mechanicDAO.updateMechainicService(service);
    }

    @Override
    public boolean deleteMechanicService(Long serviceID) {
        return mechanicDAO.deleteMechanicService(serviceID);
    }

    @Override
    public List<Service> getAllServices() {
        return mechanicDAO.getAllServices();
    }
    @Override
    public List<Service> findServicesByName(String keyword){
        return mechanicDAO.findServicesByName(keyword);
    }

    @Override
    public List<Service> getAllActiveService() {
        return mechanicDAO.getAllActiveService();
    }
    
    @Override
    public List<Service> getAllInactiveService() {
        return mechanicDAO.getAllInactiveService();
    }

    @Override
    public int getTotalMechanicServices() {
        return mechanicDAO.getTotalMechanicServices();
    }
}
