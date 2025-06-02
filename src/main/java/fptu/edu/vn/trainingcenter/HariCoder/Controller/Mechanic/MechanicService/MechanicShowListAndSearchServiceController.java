package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicService;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicService;
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

@WebServlet(urlPatterns = {"/mechanic/list"})
public class MechanicShowListAndSearchServiceController extends HttpServlet {
    private IMechanicService mechanicService;

    public MechanicShowListAndSearchServiceController() {
        this.mechanicService = new MechanicServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập
        if (!AccountSessionHelper.isLoggedIn(request, response)) {
            return;
        }

        // Lấy keyword, status, page
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");
        int page = 1;
        int pageSize = 10;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // Mặc định page = 1 nếu không parse được
        }

        // Lấy toàn bộ dịch vụ
        List<Service> allServices = mechanicService.getAllServices();

        // Lọc theo từ khóa (nếu có)
        if (keyword != null && !keyword.isEmpty()) {
            allServices = mechanicService.findServicesByName(keyword);
        }

        // Lọc theo status (nếu có)
        if (status != null && !status.isEmpty()) {
            if (status.equalsIgnoreCase("Active")) {
                allServices = mechanicService.getAllActiveService();
            } else if (status.equalsIgnoreCase("Inactive")) {
                allServices = mechanicService.getAllInactiveService();
            }
        }

        // Tính tổng item, tổng trang
        int totalItems = allServices.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        // Cắt danh sách dịch vụ cho trang hiện tại
        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<Service> services = allServices.subList(startIndex, endIndex);

        // Đặt attribute cho JSP
        request.getSession().setAttribute("services", services);
        // (Gợi ý: có thể dùng request.setAttribute("services", services) thay vì session,
        //  để tránh dữ liệu cũ lưu trong session.)

        request.setAttribute("keyword", keyword);
        request.setAttribute("status", status);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalItems", totalItems);

        // Lưu thêm tổng dịch vụ
        int totalMechanicServices = mechanicService.getTotalMechanicServices();
        request.getSession().setAttribute("totalMechanicServices", totalMechanicServices);

        // Forward sang JSP
        request.getRequestDispatcher("/Haricoder/service/list-service.jsp").forward(request, response);
    }
}
