package fptu.edu.vn.trainingcenter.HariCoder.Service.Impl;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.IMechanicTicketDAO;
import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.MechanicTicketDAOImpl;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicTicketSerivce;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;
import java.util.List;

public class MechanicTicketServiceImpl implements IMechanicTicketSerivce {

    private IMechanicTicketDAO mechanicTicketDAO;

    public MechanicTicketServiceImpl() {
        this.mechanicTicketDAO = new MechanicTicketDAOImpl();
    }

    @Override
    public List<ServiceMechanic> getAllServiceTicketsForMechanicUpdate() {
        return mechanicTicketDAO.getAllServiceTicketsForMechanicUpdate();
    }

    @Override
    public boolean updateServiceTicket(ServiceMechanic serviceMechanic) {
        return mechanicTicketDAO.updateServiceTicket(serviceMechanic);
    }

    @Override
    public ServiceMechanic getServiceTicketById(int serviceTicketID, int serviceID, Long mechanicID) {
        return mechanicTicketDAO.getServiceTicketById(serviceTicketID, serviceID, mechanicID);
    }
}