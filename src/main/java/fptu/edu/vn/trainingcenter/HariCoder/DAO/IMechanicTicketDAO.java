package fptu.edu.vn.trainingcenter.HariCoder.DAO;

import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import java.util.List;

public interface IMechanicTicketDAO {
    List<ServiceMechanic> getAllServiceTicketsForMechanicUpdate();
    boolean updateServiceTicket(ServiceMechanic serviceMechanic);
    ServiceMechanic getServiceTicketById(int serviceTicketID, int serviceID, Long mechanicID);

}
