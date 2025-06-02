package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller.Car;
import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.CarDAO;
import fptu.edu.vn.trainingcenter.Model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/view-detail-avaiable-car")
public class ViewDetailAvaiableCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang JSP

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        boolean isGet;
        //fake data
        String carID = "1122334456";
        //id tu FE cua hai
        //carID = request.getParameter("carID");
        long getcarID = Long.parseLong(carID);
        CarDAO cd = new CarDAO();
        Car car = null;
        car = cd.getCarByID(getcarID);

        try (PrintWriter out = response.getWriter()) {
            out.print("<h5>CarID: " + car.getCarID() + " </h5>");
            out.print("<h5>Car Name: " + car.getCar_name() + " </h5>");
            out.print("<h5>Car Decription: " + car.getDescription() + " </h5>");
            isGet = true;
            request.setAttribute("car", car);


        } catch (Exception e) {
            e.printStackTrace();
        }





        //request.getRequestDispatcher("/BaoPhaCode/templates/view-all-car").forward(request, response);
    }
}
