

package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/sale/edit-car"})
public class SalePresonEditCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang JSP



        request.getRequestDispatcher("/BaoPhaCode/templates/search-avaiable-car").forward(request, response);
    }
}




