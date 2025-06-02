/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.controller;

import fptu.edu.vn.trainingcenter.Diamon.service.CarService;
import fptu.edu.vn.trainingcenter.Diamon.service.CustomerService;
import fptu.edu.vn.trainingcenter.Diamon.service.InvoiceService;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.CarServiceImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.CustomerServiceImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.InvoiceServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Account;
import fptu.edu.vn.trainingcenter.Model.Car;
import fptu.edu.vn.trainingcenter.Model.Customer;
import fptu.edu.vn.trainingcenter.Model.Invoice;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Diamond1
 */
@WebServlet("/invoice/dashboard")
public class InvoiceController extends HttpServlet {

    private InvoiceService invoiceService = new InvoiceServiceImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("USER");
        if (account == null) {
            response.sendRedirect("/MainServlet?action=login");
            return;
        }

        String action = request.getParameter("action");

        switch (action) {
            case "showAllInvoices":
                Long salesID = account.getId();
                System.out.println(salesID);
                List<Invoice> invoiceList = invoiceService.getAllInvoices(salesID);
                request.setAttribute("invoiceList", invoiceList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Diamon/Saler/Invoice/invoiceList.jsp");
                dispatcher.forward(request, response);
                break;

            case "activateInvoice":
                int invoiceID = Integer.parseInt(request.getParameter("invoiceID"));
                invoiceService.updateInvoiceStatus(invoiceID, "active");
                request.getSession().setAttribute("successMessage", "Hóa đơn đã được kích hoạt!");
                response.sendRedirect("/MainServlet?action=showAllInvoices");
                break;


            case "addnewinvoice": // Case mới
                CustomerService customerService = new CustomerServiceImpl();
                CarService carService = new CarServiceImpl();

                List<Customer> availableCustomers = customerService.getCustomersNotInSalesInvoice();
                List<Car> availableCars = carService.getAvailableCars();

                request.setAttribute("availableCustomers", availableCustomers);
                request.setAttribute("availableCars", availableCars);

                RequestDispatcher addInvoiceDispatcher = request.getRequestDispatcher("/Diamon/Saler/Invoice/addNewInvoice.jsp");
                addInvoiceDispatcher.forward(request, response);
                break;

            default:
                response.sendRedirect("/MainServlet?action=login");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("USER");
        if (account == null) {
            response.sendRedirect("/MainServlet?action=login");
            return;
        }
        String action = request.getParameter("action");

        switch (action) {
            case "showAllInvoices":
                Long allSalesID = account.getId();
                List<Invoice> allInvoiceList = invoiceService.getAllInvoices(allSalesID);
                request.setAttribute("invoiceList", allInvoiceList);
                request.getRequestDispatcher("/Diamon/Saler/Invoice/invoiceList.jsp").forward(request, response);
                break;

            case "showAssignedInvoices":
                Long salesID = account.getId();
                List<Invoice> invoiceList = invoiceService.getInvoicesBySalesPerson(salesID);
                request.setAttribute("invoiceList", invoiceList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Diamon/Saler/Invoice/invoiceList.jsp");
                dispatcher.forward(request, response);
                break;

            case "showUnassignedInvoices":
                Long currentSalesID = account.getId();
                List<Invoice> unassignedInvoices = invoiceService.getInvoicesNotBySalesPerson(currentSalesID);
                request.setAttribute("invoiceList", unassignedInvoices);
                RequestDispatcher unassignedDispatcher = request.getRequestDispatcher("/Diamon/Saler/Invoice/invoiceList.jsp");
                unassignedDispatcher.forward(request, response);
                break;

            case "addnew":
                createInvoice(request, response);
                break;
                
                
            default:
                response.sendRedirect("auth/error.jsp");
                break;
        }
    }

    private void createInvoice(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String custID = request.getParameter("custID");
        String carID = request.getParameter("carID");
        String salesID = String.valueOf(((Account) request.getSession().getAttribute("USER")).getId());

        // Lấy invoiceID lớn nhất rồi +1
        int newInvoiceID = invoiceService.getMaxInvoiceID() + 1;

        // Lấy ngày hiện tại
        LocalDate today = LocalDate.now();

        // Tạo Invoice mới
        Invoice newInvoice = new Invoice(newInvoiceID, today.toString(), salesID, carID, custID, "active");

        // Ghi vào database
        boolean isInserted = invoiceService.insertInvoice(newInvoice);

        if (isInserted) {
            String successMessage = "Hóa đơn đã tạo thành công!";
            request.getSession().setAttribute("successMessage", successMessage);
            response.sendRedirect("/MainServlet?action=showAllInvoices");
        } else {
            request.setAttribute("errorMessage", "Tạo hóa đơn thất bại!");
            request.getRequestDispatcher("/Diamon/saler/invoice/AddNewInvoice.jsp").forward(request, response);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
