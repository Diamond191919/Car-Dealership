package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicService;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IAccountService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicService;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.AccountServiceImpl;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Service;
import fptu.edu.vn.trainingcenter.Utils.AccountSessionHelper;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // Import HttpSession

@WebServlet(urlPatterns = {"/mechanic/create"})
public class MechanicCreateServiceController extends HttpServlet {

    private IMechanicService mechanicService;
    private IAccountService accountService;

    public MechanicCreateServiceController() {
        this.mechanicService = new MechanicServiceImpl();
        this.accountService = new AccountServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

          if (!AccountSessionHelper.isLoggedIn(request, response)) {
              return;
          }

        request.getRequestDispatcher("/Haricoder/service/create-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(); // Lấy session

        try {
            // Lấy thông tin từ form
            String serviceName = request.getParameter("service_name");
            String hourlyRateStr = request.getParameter("hourlyRate");
            String status = request.getParameter("status");

            // Xử lý chuỗi hourlyRate
            if (hourlyRateStr != null && hourlyRateStr.endsWith("VND")) {
                hourlyRateStr = hourlyRateStr.substring(0, hourlyRateStr.length() - 3).trim();
                hourlyRateStr = hourlyRateStr.replace(",", "");
            }

            Double hourlyRate = Double.valueOf(hourlyRateStr);

            // Tạo đối tượng Service mới
            Service newService = new Service();
            newService.setService_name(serviceName);
            newService.setHourlyRate(hourlyRate);
            newService.setStatus(status);

            // Gọi hàm createMechanicService
            boolean created = mechanicService.createMechanicService(newService);

            if (created) {
                // Cập nhật lại danh sách services trong session
                List<Service> updatedServices = mechanicService.getAllServices();
                session.setAttribute("services", updatedServices);
                session.setAttribute("CREATE_SERVICE_SUCCESS", true);
            } else {
                session.setAttribute("CREATE_SERVICE_ERROR", true);
            }

            response.sendRedirect("/mechanic/list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("CREATE_ERROR", "An error occurred while creating the service.");
            response.sendRedirect("/mechanic/list");
        }
    }
}