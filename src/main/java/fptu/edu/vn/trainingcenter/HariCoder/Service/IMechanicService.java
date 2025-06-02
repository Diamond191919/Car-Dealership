/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fptu.edu.vn.trainingcenter.HariCoder.Service;

import fptu.edu.vn.trainingcenter.Model.Service;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface IMechanicService {
    boolean createMechanicService(Service service);
    Service getServiceById(Long serviceID);
    boolean updateMechanicService(Service service);
    boolean deleteMechanicService(Long serviceID);
    List<Service> getAllServices();
    List<Service> getAllActiveService();
    List<Service> getAllInactiveService();
    List<Service> findServicesByName(String keyword);
    int getTotalMechanicServices();
}
