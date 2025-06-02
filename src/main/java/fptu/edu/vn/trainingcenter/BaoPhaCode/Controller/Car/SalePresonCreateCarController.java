

package fptu.edu.vn.trainingcenter.BaoPhaCode.Controller.Car;

import fptu.edu.vn.trainingcenter.BaoPhaCode.DAO.CarDAO;
import fptu.edu.vn.trainingcenter.Model.Car;
import fptu.edu.vn.trainingcenter.Utils.AccountSessionHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/sale/create-car"})
public class SalePresonCreateCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang JSP

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");


        Long carID = 0L;
        String car_name ="Toyota Camry";
        double price = 700000000;
        String serialNumber = "ABC123456";
        String model = "Camry";
        String colour = "Black";
        int year = 2022;
        String img = "https://via.placeholder.com/400x200?text=Volkswagen+Golf";
        String status = "Available";
        String description = "Xe nhập khẩu Nhật Bản";
        boolean isCreate;
        //phan du lieu tu FE ma hai bo vao
        Car car = new Car(carID, car_name,price,serialNumber,model,colour,year,img,status,description);

            CarDAO cd = new CarDAO();

        try (PrintWriter out = response.getWriter()) {

            if(cd.CreateCar(car)){
                isCreate = true;
                //test
                out.print("<h5>Create thanh cong</h5>");
            }else {
                isCreate = false;
                //test
                out.print("<h5>Create that bai</h5>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            isCreate = false;

        }


        //phia duoi la respone của servet nay

        // trong do isCreate = true la create thanh cong (UnAvailble) nguoc lai false create that bai
        request.getSession().setAttribute("isCreate", isCreate);
        //viec cua Hai la getRequestDispatcher toi file Hai can





        //request.getRequestDispatcher("/BaoPhaCode/templates/search-avaiable-car").forward(request, response);
    }
}







