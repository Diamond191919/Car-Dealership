package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicService;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.AccountServiceImpl;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Service;
import fptu.edu.vn.trainingcenter.Utils.AccountSessionHelper;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/mechanic/edit", "/mechanic/update"})
public class MechanicEditAndUpdateServiceController extends HttpServlet {

    private IMechanicService mechanicService;
    private IAccountService accountService;

    public MechanicEditAndUpdateServiceController() {
        this.mechanicService = new MechanicServiceImpl();
        this.accountService = new AccountServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        if (!AccountSessionHelper.isLoggedIn(request, response)) {
            return;
        }
        // Get serviceID parameter
        String serviceID = request.getParameter("serviceID");
        // Handle edit service request
        if (serviceID != null && !serviceID.isEmpty()) {
            try {
                Service service = mechanicService.getServiceById(Long.parseLong(serviceID));
                if (service != null) {
                    request.setAttribute("service", service);
                    request.getRequestDispatcher("/Haricoder/service/edit-service.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("ERROR", "An error occurred while updating the service.");
                request.getRequestDispatcher("/mechanic/list").forward(request, response);
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // Xử lý cập nhật service
        try {
            String serviceId = request.getParameter("serviceID");
            Service serviceFromDB = mechanicService.getServiceById(Long.parseLong(serviceId));
            String newName = request.getParameter("service_name");
            //xử lí chuỗi hourlyRate
            String hourlyRate = request.getParameter("hourlyRate");
            if (hourlyRate != null && !hourlyRate.trim().isEmpty()) {
                hourlyRate = hourlyRate.replaceAll("[^\\d.]", "");
            }
            Double newRate = Double.valueOf(hourlyRate);
            String newStatus = request.getParameter("status").toLowerCase();

            boolean hasChanges = !serviceFromDB.getService_name().equals(newName)
                    || !Double.valueOf(serviceFromDB.getHourlyRate()).equals(newRate)
                    || !serviceFromDB.getStatus().equals(newStatus.toLowerCase());

            if (hasChanges) {
                serviceFromDB.setService_name(newName);
                serviceFromDB.setHourlyRate(newRate);
                serviceFromDB.setStatus(newStatus);
                boolean updated = mechanicService.updateMechanicService(serviceFromDB);
                if (updated) {
                    // Cập nhật lại danh sách services trong session
                    List<Service> updatedServices = mechanicService.getAllServices();
                    session.setAttribute("services", updatedServices);
                    session.setAttribute("DATABASE_UPDATE_SERVICE_SUCCESS", true);
                } else {
                    session.setAttribute("DATABASE_UPDATE_SERVICE_ERROR", true);
                }
            } else {
                session.setAttribute("SHOW_NOTHINGCHANGE_SERVICE_MESSAGE", true);
            }
            response.sendRedirect("/mechanic/list");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "An error occurred while updating the service.");
            response.sendRedirect("/mechanic/list");
        }
    }
}

