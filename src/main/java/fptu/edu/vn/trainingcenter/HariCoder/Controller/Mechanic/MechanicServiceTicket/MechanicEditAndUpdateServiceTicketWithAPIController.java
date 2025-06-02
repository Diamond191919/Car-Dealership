package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicServiceTicket;

import com.fasterxml.jackson.databind.ObjectMapper;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicTicketSerivce;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicTicketServiceImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/api/mechanic/serviceticket/edit", "/api/mechanic/serviceticket/update"})
public class MechanicEditAndUpdateServiceTicketWithAPIController extends HttpServlet {

    private IMechanicTicketSerivce mechanicTicketService;

    public MechanicEditAndUpdateServiceTicketWithAPIController() {
        this.mechanicTicketService = new MechanicTicketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();

        String serviceTicketIDParam = request.getParameter("serviceTicketID");
        String serviceIDParam = request.getParameter("serviceID");
        String mechanicIDParam = request.getParameter("mechanicID");

        if (serviceTicketIDParam != null && !serviceTicketIDParam.isEmpty() &&
                serviceIDParam != null && !serviceIDParam.isEmpty() &&
                mechanicIDParam != null && !mechanicIDParam.isEmpty()) {
            try {
                int serviceTicketID = Integer.parseInt(serviceTicketIDParam);
                int serviceID = Integer.parseInt(serviceIDParam);
                Long mechanicID = Long.parseLong(mechanicIDParam);

                ServiceMechanic serviceMechanic = mechanicTicketService.getServiceTicketById(serviceTicketID, serviceID, mechanicID);

                if (serviceMechanic != null) {
                    //DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
                    DecimalFormat decimalFormat = new DecimalFormat("0.00");
                    String formattedRate = decimalFormat.format(serviceMechanic.getRate());
                    Map<String, Object> responseMap = new HashMap<>();
                    responseMap.put("serviceTicketID", serviceMechanic.getServiceTicketID());
                    responseMap.put("serviceID", serviceMechanic.getServiceID());
                    responseMap.put("mechanicID", serviceMechanic.getMechanicID());
                    responseMap.put("hours", serviceMechanic.getHours());
                    responseMap.put("comment", serviceMechanic.getComment());
                    responseMap.put("rate", formattedRate); // Sử dụng chuỗi định dạng

                    // Ghi dữ liệu JSON ra output
                    response.setStatus(HttpServletResponse.SC_OK);
                    objectMapper.writeValue(response.getOutputStream(), responseMap);
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    objectMapper.writeValue(response.getOutputStream(), "Service ticket not found.");
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                objectMapper.writeValue(response.getOutputStream(), "Invalid input.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            objectMapper.writeValue(response.getOutputStream(), "Missing parameters.");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            // Đọc dữ liệu JSON từ request body
            ServiceMechanic updatedServiceMechanic = objectMapper.readValue(request.getInputStream(), ServiceMechanic.class);

            // Kiểm tra xem đối tượng ServiceMechanic có hợp lệ không
            if (updatedServiceMechanic == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                objectMapper.writeValue(response.getOutputStream(), Map.of("message", "Missing parameters."));
                return;
            }

            // Lấy dữ liệu service ticket từ request body
            ServiceMechanic existingServiceMechanic = mechanicTicketService.getServiceTicketById(
                    updatedServiceMechanic.getServiceTicketID(),
                    updatedServiceMechanic.getServiceID(),
                    updatedServiceMechanic.getMechanicID()
            );

            // Kiểm tra nếu không tìm thấy đối tượng trong DB
            if (existingServiceMechanic == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                objectMapper.writeValue(response.getOutputStream(), Map.of("message", "Service ticket not found."));
                return;
            }

            // Khai báo biến để kiểm tra sự thay đổi
            boolean hasChange = false;

            // Lấy giá trị cũ và mới của hours, comment, rate để so sánh
            int oldHours = existingServiceMechanic.getHours();
            int newHours = updatedServiceMechanic.getHours();

            String oldComment = existingServiceMechanic.getComment();
            String newComment = updatedServiceMechanic.getComment();

            double oldRate = existingServiceMechanic.getRate();
            double newRate = updatedServiceMechanic.getRate();

            // Kiểm tra xem có sự thay đổi ở từng trường hay không
            if (newHours != oldHours) {
                existingServiceMechanic.setHours(newHours);
                hasChange = true;
            }
            if (!newComment.equals(oldComment)) {
                existingServiceMechanic.setComment(newComment);
                hasChange = true;
            }
            if (newRate != oldRate) {
                existingServiceMechanic.setRate(newRate);
                hasChange = true;
            }

            // Nếu có sự thay đổi, thực hiện cập nhật
            if (hasChange) {
                // Cập nhật vào cơ sở dữ liệu
                boolean updated = mechanicTicketService.updateServiceTicket(existingServiceMechanic);

                if (updated) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    objectMapper.writeValue(response.getOutputStream(), Map.of("SUCCESS", "Service ticket updated successfully."));
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    objectMapper.writeValue(response.getOutputStream(), Map.of("FAIL_UPDATE", "Failed to update service ticket."));
                }
            } else {
                response.setStatus(HttpServletResponse.SC_OK);
                objectMapper.writeValue(response.getOutputStream(), Map.of("NOTHING_CHANGE", "No change in service ticket."));
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            objectMapper.writeValue(response.getOutputStream(), Map.of("message", "Unexpected error: " + e.getMessage()));
        }
    }

}
