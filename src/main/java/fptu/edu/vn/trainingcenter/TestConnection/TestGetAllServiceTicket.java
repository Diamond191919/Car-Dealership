package fptu.edu.vn.trainingcenter.TestConnection;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.MechanicTicketDAOImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import java.util.List;

public class TestGetAllServiceTicket {
    public static void main(String[] args) {
        MechanicTicketDAOImpl dao = new MechanicTicketDAOImpl();

        // Gọi phương thức getAllServiceTickets() để lấy danh sách ServiceMechanic
        List<ServiceMechanic> serviceMechanics = dao.getAllServiceTicketsForMechanicUpdate();

        // In kết quả ra console
        if (serviceMechanics != null) {
            for (ServiceMechanic sm : serviceMechanics) {
                System.out.println("ServiceTicketID: " + sm.getServiceTicketID());
                System.out.println("ServiceID: " + sm.getServiceID());
                System.out.println("MechanicID: " + sm.getMechanicID());
                System.out.println("Hours: " + sm.getHours());
                System.out.println("Comment: " + sm.getComment());
                System.out.println("Rate: " + sm.getRate());
                System.out.println("-------------------------");
            }
        } else {
            System.out.println("No service tickets found.");
        }
    }
}
