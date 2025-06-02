/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fptu.edu.vn.trainingcenter.Diamon.controller;

import fptu.edu.vn.trainingcenter.Diamon.service.ServiceCustomerService;
import fptu.edu.vn.trainingcenter.Diamon.service.ServiceTicketForMechanicService;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.ServiceCustomerServiceImpl;
import fptu.edu.vn.trainingcenter.Diamon.service.serviceImpl.ServiceTicketForMechanicServiceImpl;
import fptu.edu.vn.trainingcenter.Model.Account;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForCustomer;
import fptu.edu.vn.trainingcenter.Model.ServiceTicketForMechanic;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Diamond1
 */
@WebServlet("/servicetick/dashboard")
public class ServiceTicketController extends HttpServlet {

    private ServiceTicketForMechanicService mechanicTicket = new ServiceTicketForMechanicServiceImpl();
    private ServiceCustomerService customerService = new ServiceCustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Received action: " + action);
        switch (action) {
            case "mechanicTicket":
                showMechanicTickets(request, response);
                break;

            case "searchTicket":
                searchServiceTicket(request, response);
                break;

            case "customerticket":
                showCustomerTickets(request, response);
                break;

            default:
                response.sendRedirect("error.jsp"); // Hướng đến trang báo lỗi nếu action không hợp lệ
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showMechanicTickets(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account user = (Account) request.getSession().getAttribute("USER");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String mechanicID = String.valueOf(user.getId());

        List<ServiceTicketForMechanic> tickets = mechanicTicket.getAllTickets(mechanicID);

        request.setAttribute("ticketList", tickets);
        request.getRequestDispatcher("/Diamon/Mechanic/ServiceTicket/serviceTicket.jsp").forward(request, response);
    }


    private void searchServiceTicket(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");
        System.out.println("Debug - searchServiceTicket:");
        System.out.println("searchType: " + searchType);
        System.out.println("searchValue: " + searchValue);
        Account user = (Account) request.getSession().getAttribute("USER");
        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String mechanicID = String.valueOf(user.getId());

        System.out.println("mechanicID: " + mechanicID);
        List<ServiceTicketForMechanic> filteredTickets = mechanicTicket.searchTickets(mechanicID, searchType, searchValue);

        request.setAttribute("ticketList", filteredTickets);
        request.getRequestDispatcher("/Diamon/Mechanic/ServiceTicket/serviceTicket.jsp").forward(request, response);
    }


    private void showCustomerTickets(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("USER");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        List<ServiceTicketForCustomer> ticketList = customerService.getCustomerTickets(String.valueOf(user.getId()));

        System.out.println("Ticket List Size: " + ticketList.size());
        for (ServiceTicketForCustomer ticket : ticketList) {
            System.out.println(ticket.getCust_name() + " - " + ticket.getPart_name());
        }
        request.setAttribute("ticketList", ticketList);
        request.getRequestDispatcher("/Diamon/Customer/ServiceTicket/viewServiceTicket.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}