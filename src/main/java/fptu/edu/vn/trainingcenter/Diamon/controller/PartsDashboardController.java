/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.controller;

import fptu.edu.vn.trainingcenter.Diamon.service.PartsService;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.PartsServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Parts;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Diamond1
 */
@WebServlet("/parts/dashboard")
public class PartsDashboardController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PartsService partsService;

    @Override
    public void init() {
        partsService = new PartsServiceImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị của action từ request (có thể là "showall" hoặc "search")
        String action = request.getParameter("action");

        // Sử dụng switch-case để phân biệt các hành động
        switch (action) {
            case "listparts":
                showAllParts(request, response);  // Hiển thị tất cả các phần
                break;

            default:
                // Nếu không có action hoặc action không hợp lệ, mặc định sẽ hiển thị tất cả các phần
                showAllParts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "search":
                showSearchResults(request, response);  // Hiển thị các phần đã tìm kiếm
                break;
            case "savecreate":
                addNewPart(request, response);
                break;
            case "savepart":
                updatePart(request, response);
                break;
            case "deletepart":
                deletePart(request, response);
                break;

            default:
                processRequest(request, response);
                break;
        }
    }

    //add
    private void addNewPart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String partName = request.getParameter("partName").trim();
        double purchasePrice = Double.parseDouble(request.getParameter("purchasePrice"));
        double retailPrice = Double.parseDouble(request.getParameter("retailPrice"));

        Parts newPart = new Parts(0, partName, purchasePrice, retailPrice); // ID tự động
        boolean isAdded = partsService.addPart(newPart);

        if (isAdded) {
            request.getSession().setAttribute("addmessage", "Thêm phụ tùng thành công!");
        } else {
            request.getSession().setAttribute("adderror", "Thêm phụ tùng thất bại!.");
        }
        response.sendRedirect("/MainServlet?action=listparts");
    }

    //Show toàn bộ parts
    private void showAllParts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Parts> partsList = partsService.getAllParts();
        request.setAttribute("partsList", partsList);
        request.getRequestDispatcher("/Diamon/Saler/Parts/partList.jsp").forward(request, response);
    }

    //Show search
    private void showSearchResults(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String partName = request.getParameter("query");

        // Kiểm tra nếu từ khóa tìm kiếm không rỗng
        if (partName != null && !partName.trim().isEmpty()) {
            List<Parts> partsList = partsService.getByPartsName(partName); // Gọi phương thức tìm theo tên
            request.setAttribute("partsList", partsList); // Đặt kết quả vào request
        } else {
            showAllParts(request, response); // Nếu không có từ khóa, hiển thị tất cả
            return; // Tránh thực hiện tiếp mã không cần thiết
        }

        // Chuyển về trang danh sách gốc (không chuyển trang mới)
        request.getRequestDispatcher("/Diamon/Saler/Parts/partList.jsp").forward(request, response);
    }


    //update
    private void updatePart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int partID = Integer.parseInt(request.getParameter("partID"));

        // Kiểm tra nếu người dùng không nhập, gán giá trị mặc định
        String partName = request.getParameter("partName").trim();
        double purchasePrice = request.getParameter("purchasePrice").isEmpty() ? -1 : Double.parseDouble(request.getParameter("purchasePrice"));
        double retailPrice = request.getParameter("retailPrice").isEmpty() ? -1 : Double.parseDouble(request.getParameter("retailPrice"));
        Parts updatedPart = new Parts(partID, partName, purchasePrice, retailPrice);
        boolean isUpdated = partsService.updatePart(updatedPart);

        if (isUpdated) {
            request.getSession().setAttribute("editmessage", "Cập nhật thành công! " + partID);
        } else {
            request.getSession().setAttribute("editerror", "Cập nhật thất bại! " + partID);
        }
        //request.getRequestDispatcher("parts/partsList.jsp").forward(request, response);
        response.sendRedirect("/MainServlet?action=listparts");
    }

    // Xóa một Part
    private void deletePart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String partIdParam = request.getParameter("partID");

        if (partIdParam == null || partIdParam.isEmpty()) {
            request.getSession().setAttribute("error", "Không tìm thấy ID phụ tùng!");
            response.sendRedirect("MainServlet?action=listparts");
            return;
        }

        int partID = Integer.parseInt(partIdParam);
        boolean isDeleted = partsService.deletePart(partID);

        if (isDeleted) {
            request.getSession().setAttribute("deletemessage", "Đã xóa thành công!");
        } else {
            request.getSession().setAttribute("deleteerror", "Xóa thất bại!");
        }
        response.sendRedirect("MainServlet?action=listparts");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
