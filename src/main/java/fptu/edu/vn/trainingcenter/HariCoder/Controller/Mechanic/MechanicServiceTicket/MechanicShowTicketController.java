package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicServiceTicket;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicTicketSerivce;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicTicketServiceImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/mechanic/list/ticket"})
public class MechanicShowTicketController extends HttpServlet {

    private IMechanicTicketSerivce mechanicTicketService;

    public MechanicShowTicketController() {
        this.mechanicTicketService = new MechanicTicketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Fetch all service tickets
        List<ServiceMechanic> serviceMechanics = mechanicTicketService.getAllServiceTicketsForMechanicUpdate();

        // Set the result as a request attribute
        request.setAttribute("serviceMechanics", serviceMechanics);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/Haricoder/serviceticket/list-service-ticket.jsp").forward(request, response);
    }
}
