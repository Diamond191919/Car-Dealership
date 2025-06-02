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
import java.util.ArrayList;

@WebServlet("/view-all-avaiable-car")
public class ViewAllAvaiableCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        CarDAO cd = new CarDAO();
        ArrayList<Car> ListCar = cd.getAllAvailableCar();

        try (PrintWriter out = response.getWriter()) {

            //test
            out.print("<!DOCTYPE html>");
            out.print("<html lang='vi'>");
            out.print("<head>");
            out.print("<meta charset='UTF-8'>");
            out.print("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.print("<title>Danh sách xe có sẵn</title>");
            out.print("<style>");
            out.print("body { font-family: Arial, sans-serif; margin: 20px; }");
            out.print("h2 { text-align: center; }");
            out.print("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
            out.print("th, td { border: 1px solid black; padding: 8px; text-align: center; }");
            out.print("th { background-color: #4CAF50; color: white; }");
            out.print("tr:nth-child(even) { background-color: #f2f2f2; }");
            out.print("</style>");
            out.print("</head>");
            out.print("<body>");

            out.print("<h2>Danh sách xe có sẵn VIEW AVAILABLE CAR</h2>");
            out.print("<table>");
            out.print("<tr><th>ID</th><th>Tên xe</th><th>Giá</th><th>Model</th><th>Năm</th><th>Màu sắc</th><th>Trạng thái</th></tr>");

            for (Car car : ListCar) {
                out.print("<tr>");
                out.print("<td>" + car.getCarID() + "</td>");
                out.print("<td>" + car.getCar_name() + "</td>");
                out.print("<td>" + String.format("%,.0f", car.getPrice()) + " VND</td>");
                out.print("<td>" + car.getModel() + "</td>");
                out.print("<td>" + car.getYear() + "</td>");
                out.print("<td>" + car.getColour() + "</td>");
                out.print("<td>" + car.getStatus() + "</td>");
                out.print("</tr>");
            }

            out.print("</table>");
            out.print("</body>");
            out.print("</html>");

        } catch (Exception e) {
            e.printStackTrace();
        }


        //phia duoi la respone của servet nay
        // trong do ListCar la danh sach tra ve tat ca cac xe co status = Available
        request.setAttribute("ListCar", ListCar);
        //viec cua Hai la getRequestDispatcher toi file Hai can

        //request.getRequestDispatcher("/BaoPhaCode/templates/view-all-car").forward(request, response);
    }
}