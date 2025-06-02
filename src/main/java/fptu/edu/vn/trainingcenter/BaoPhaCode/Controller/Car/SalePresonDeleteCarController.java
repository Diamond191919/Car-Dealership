

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

@WebServlet(urlPatterns = {"/sale/delete-car"})
public class SalePresonDeleteCarController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        // lay ra carID muon delete
        //String carID = request.getParameter("carID");
        Long deleteCarID;// = Long.parseLong(carID);
        CarDAO cd = new CarDAO();
        boolean isDeleted;


        //test
        Long fakeID = 1122334484L;
        deleteCarID = fakeID;



        try (PrintWriter out = response.getWriter()) {

          if(cd.deleteCar(deleteCarID)){  //cd.deleteCar khi co carID se set car do status thanh UnAvailable
              isDeleted = true;
              //test
              out.println("<h5>Xoa thanh cong</h5>");
          }else {
              isDeleted = false;
              //test
              out.println("<h5>Xoa that bai</h5>");
          }

        } catch (Exception e) {
            e.printStackTrace();
            isDeleted = false;
        }


        //phia duoi la respone của servet nay

        // trong do isDeleted thi true la xoa thanh cong (UnAvailble) nguoc lai false xoa that bai
        request.setAttribute("isDeleted", isDeleted);
        //viec cua Hai la getRequestDispatcher toi file Hai can





        request.getRequestDispatcher("/BaoPhaCode/templates/view-all-car").forward(request, response);
    }
}



