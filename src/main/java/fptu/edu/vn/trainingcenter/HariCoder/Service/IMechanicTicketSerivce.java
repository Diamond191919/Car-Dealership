package fptu.edu.vn.trainingcenter.HariCoder.Service;

import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import java.util.List;

public interface IMechanicTicketSerivce {
    List<ServiceMechanic> getAllServiceTicketsForMechanicUpdate();
    boolean updateServiceTicket(ServiceMechanic serviceMechanic);
    ServiceMechanic getServiceTicketById(int serviceTicketID, int serviceID, Long mechanicID);
}
