/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.DAO;

/**
 *
 * @author Admin
 */
import fptu.edu.vn.trainingcenter.Model.Service;
import java.util.List;

public interface IMechanicDAO {
    boolean createMechanicService(Service service);
    Service getServiceById(Long serviceID);
    boolean updateMechainicService(Service service);
    boolean deleteMechanicService(Long serviceID);
    List<Service> getAllActiveService();
    List<Service> getAllInactiveService();
    List<Service> getAllServices();
    List<Service> findServicesByName(String keyword);
    int getTotalMechanicServices();
}
