package fptu.edu.vn.trainingcenter.TestConnection;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.MechanicTicketDAOImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

public class TestGetServiceTicketById {
    public static void main(String[] args) {
        // Khởi tạo đối tượng DAO
        MechanicTicketDAOImpl dao = new MechanicTicketDAOImpl();

        // Thử nghiệm với các giá trị serviceTicketID, serviceID, mechanicID
        int serviceTicketID = 10111231;
        int serviceID = 1;
        Long mechanicID = 41051230025L;

        // Gọi phương thức getServiceTicketById() để lấy bản ghi ServiceMechanic
        ServiceMechanic serviceMechanic = dao.getServiceTicketById(serviceTicketID, serviceID, mechanicID);

        // Kiểm tra và in kết quả ra console
        if (serviceMechanic != null) {
            System.out.println("ServiceTicketID: " + serviceMechanic.getServiceTicketID());
            System.out.println("ServiceID: " + serviceMechanic.getServiceID());
            System.out.println("MechanicID: " + serviceMechanic.getMechanicID());
            System.out.println("Hours: " + serviceMechanic.getHours());
            System.out.println("Comment: " + serviceMechanic.getComment());
            System.out.println("Rate: " + serviceMechanic.getRate());
            System.out.println("-------------------------");
        } else {
            System.out.println("No service ticket found with the given parameters.");
        }
    }
}
