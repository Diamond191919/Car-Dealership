package fptu.edu.vn.trainingcenter.HariCoder.Service;

import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

public interface IMechanicTicketApiService {
    ServiceMechanic getServiceTicket(String serviceTicketID, String serviceID, String mechanicID);
}
