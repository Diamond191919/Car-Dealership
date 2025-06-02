package fptu.edu.vn.trainingcenter.TestConnection;

import fptu.edu.vn.trainingcenter.HariCoder.DAO.Impl.MechanicTicketDAOImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

public class TestUpdateServiceTicket {
    public static void main(String[] args) {
        // Khởi tạo đối tượng DAO
        MechanicTicketDAOImpl dao = new MechanicTicketDAOImpl();

        // Tạo đối tượng ServiceMechanic với thông tin cần cập nhật
        ServiceMechanic serviceMechanic = new ServiceMechanic();
        serviceMechanic.setServiceTicketID(10111231);
        serviceMechanic.setServiceID(2);
        serviceMechanic.setMechanicID(41051230025L);
        serviceMechanic.setHours(10);  // Giả sử cập nhật hours thành 5
        serviceMechanic.setComment("Test Update by jdbc"); // Giả sử cập nhật comment
        serviceMechanic.setRate(25300.00); // Giả sử cập nhật rate

        // Gọi phương thức updateServiceTicket() để cập nhật bản ghi
        boolean isUpdated = dao.updateServiceTicket(serviceMechanic);

        // Kiểm tra và in kết quả ra console
        if (isUpdated) {
            System.out.println("Service ticket updated successfully.");

            // Lấy lại bản ghi sau khi cập nhật để kiểm tra
            ServiceMechanic updatedServiceMechanic = dao.getServiceTicketById(10111231, 2, 41051230025L);
            if (updatedServiceMechanic != null) {
                System.out.println("Updated ServiceTicketID: " + updatedServiceMechanic.getServiceTicketID());
                System.out.println("Updated ServiceID: " + updatedServiceMechanic.getServiceID());
                System.out.println("Updated MechanicID: " + updatedServiceMechanic.getMechanicID());
                System.out.println("Updated Hours: " + updatedServiceMechanic.getHours());
                System.out.println("Updated Comment: " + updatedServiceMechanic.getComment());
                System.out.println("Updated Rate: " + updatedServiceMechanic.getRate());
                System.out.println("-------------------------");
            }

        } else {
            System.out.println("Failed to update service ticket.");
        }
    }
}