package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicServiceTicket;

import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicTicketApiServiceImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/mechanic/serviceticket/view")
public class MechanicViewTicketController extends HttpServlet {

    private MechanicTicketApiServiceImpl apiService;

    public MechanicViewTicketController() {
        this.apiService = new MechanicTicketApiServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập encoding cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String serviceTicketID = request.getParameter("serviceTicketID");
        String serviceID = request.getParameter("serviceID");
        String mechanicID = request.getParameter("mechanicID");

        if (serviceTicketID != null && serviceID != null && mechanicID != null) {
            ServiceMechanic serviceMechanic = apiService.getServiceTicket(serviceTicketID, serviceID, mechanicID);
            if (serviceMechanic != null) {
                request.setAttribute("serviceMechanic", serviceMechanic);
            } else {
                request.setAttribute("message", "Service Ticket không tồn tại.");
            }
        } else {
            request.setAttribute("message", "Thiếu tham số.");
        }
        request.getRequestDispatcher("/Haricoder/templates/mechanic/mechanicserviceticket/viewServiceTicket.jsp")
                .forward(request, response);
    }
}
