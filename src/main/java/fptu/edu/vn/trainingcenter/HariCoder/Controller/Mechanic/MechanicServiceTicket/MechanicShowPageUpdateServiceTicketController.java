package fptu.edu.vn.trainingcenter.HariCoder.Controller.Mechanic.MechanicServiceTicket;

import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicTicketSerivce;
import fptu.edu.vn.trainingcenter.HariCoder.Service.Impl.MechanicTicketServiceImpl;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;
import fptu.edu.vn.trainingcenter.Utils.AccountSessionHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/mechanic/update/serviceticket"})
public class MechanicShowPageUpdateServiceTicketController extends HttpServlet {

    private IMechanicTicketSerivce mechanicTicketService;

    public MechanicShowPageUpdateServiceTicketController() {
        this.mechanicTicketService = new MechanicTicketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (!AccountSessionHelper.isLoggedIn(request, response)) {
            return;
        }
        // Forward the request to the JSP page
        request.getRequestDispatcher("/Haricoder/serviceticket/update-service-mechanic.jsp").forward(request, response);
    }
}