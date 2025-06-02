<%@ page import="fptu.edu.vn.trainingcenter.Model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-light-primary elevation-4">

    <!-- Brand Logo -->
    <a href="/home.jsp" class="brand-link logo">
        <span class="logo-mini" style="text-align: center;"><b style="color:#FF7A00;">FM</b>P8</span>
        <strong>
            <span style="color:#FF7A00;" class="logo-lg">FastMan</span><span style="color:#333;" class="logo-lg">Pro8</span>
        </strong>
    </a>

    <div class="sidebar">
        <c:set var="user" value="${sessionScope.USER}" />
        <c:set var="userName" value="${user != null ? user.name : 'Guest'}" />
        <c:set var="mechanicRoleID" value="${user != null ? user.roleID : '-1'}" />
        <c:set var="isOnline" value="${user != null}" />

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="user-panel user-panel-horizontal">
                <div class="pull-left image">
                    <img src="<c:url value='/static/img/hari_coder/nguyenHaiCoder.jpg'/>" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <strong>
                        <p class="custom-text-sidebar-header">${userName}</p>
                    </strong>
                    <c:choose>
                        <c:when test="${isOnline}">
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </c:when>
                        <c:otherwise>
                            <a href="#"><i class="fa fa-circle text-danger"></i> Offline</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Thanh tìm kiếm nhanh -->
        <div class="form-inline mt-2">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Tìm kiếm..."
                       aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Menu Dashboard -->
<%--                <li class="nav-item">--%>
<%--                    <a href="/mechanic/dashboard" class="nav-link active rounded bg-dark text-white">--%>
<%--                        <i class="nav-icon fas fa-tachometer-alt"></i>--%>
<%--                        <p>Dashboard</p>--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--                <!-- Nếu user có roleID bằng "3" (Mechanic), hiển thị menu dành riêng cho mechanic -->--%>
                <c:choose>
                    <c:when test="${mechanicRoleID == '3'}">
                        <li class="nav-item">
                            <a href="/mechanic/dashboard" class="nav-link active rounded bg-dark text-white">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <!-- Menu Dịch vụ -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-wrench"></i>
                                <p>
                                    Dịch vụ
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/mechanic/list/ticket"
                                       class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Phiếu dịch vụ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/mechanic/update/serviceticket"
                                       class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Cập nhật phiếu dịch vụ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/mechanic/list" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách dịch vụ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/MainServlet?action=mechanicTicket"
                                       class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Xem danh sách phiếu dịch vụ</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:when>

<%--                    Menu của saler--%>
                    <c:when test="${mechanicRoleID == '4'}">
                        <li class="nav-item">
                            <a href="/MainServlet?action=saler" class="nav-link active rounded bg-dark text-white">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <!-- Menu Khách hàng -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Khách hàng
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/saleperson/customer/crud-customer.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách khách hàng</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Xe -->
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="nav-icon fas fa-car"></i>
                                <p>
                                    Quản lý Xe
                                    <i class="fas fa-angle-left right"></i>
                                    <span class="badge badge-info right">4</span>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/saleperson/car/view-all-car.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Xem xe đang bán</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/saleperson/car/crud-car-by-saler.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Quản lí xe</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Dịch vụ -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-wrench"></i>
                                <p>
                                    Dịch vụ
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/mechanic/mechanicserviceticket/view-all-service-ticket.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Phiếu dịch vụ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/mechanic/mechanicserviceticket/update-service-mechanic.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Cập nhật phiếu dịch vụ</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/mechanic/crud-service/list-services.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách dịch vụ</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Phụ tùng -->
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="nav-icon fas fa-cogs"></i>
                                <p>
                                    Phụ tùng
                                    <i class="fas fa-angle-left right"></i>
                                    <span class="badge badge-danger right">New</span>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/MainServlet?action=listparts" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách phụ tùng</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Hóa đơn -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-file-invoice-dollar"></i>
                                <p>
                                    Hóa đơn
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/MainServlet?action=showAllInvoices" class="nav-link" target="_self">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách hóa đơn</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/MainServlet?action=addnewinvoice" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Tạo hóa đơn mới</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Báo cáo -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Báo cáo
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/report/sales" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Doanh số bán xe</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/revenue" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Doanh thu bán xe</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/popular-models" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Mẫu xe bán chạy</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/top-parts" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Phụ tùng phổ biến</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/top-mechanics" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thợ máy hàng đầu</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
<%--                    Menu của customer--%>
                    <c:when test="${mechanicRoleID == '2'}">
                        <li class="nav-item">
                            <a href="/mechanic/dashboard" class="nav-link active rounded bg-dark text-white">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <!-- Menu Dịch vụ -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-wrench"></i>
                                <p>
                                    Dịch vụ
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/MainServlet?action=customerticket" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Phiếu dịch vụ của tôi</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/mechanic/crud-service/list-services.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách dịch vụ</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Menu Hóa đơn -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-file-invoice-dollar"></i>
                                <p>
                                    Hóa đơn
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/customer/invoice/list-invoice-customer.html" class="nav-link" target="_blank">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách hóa đơn</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/customer/invoice/create-invoice-customer-ver01.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Tạo hóa đơn mới</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Cài đặt -->
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#settingsModal">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>Cài đặt</p>
                            </a>
                        </li>
                    </c:when>
<%--                    <!-- Nếu không phải 3 thằng trên, hiển thị menu đầy đủ -->--%>
<%--                    <!-- Nếu không phải mechanic, hiển thị menu đầy đủ -->--%>
                    <c:otherwise>
                        <!-- Menu Xe -->
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="nav-icon fas fa-car"></i>
                                <p>
                                    Quản lý Xe
                                    <i class="fas fa-angle-left right"></i>
                                    <span class="badge badge-info right">4</span>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/saleperson/car/view-all-car.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Xem xe đang bán</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/saleperson/car/crud-car-by-saler.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Quản lí xe</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- Menu Khách hàng -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-users"></i>
                                <p>
                                    Khách hàng
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/saleperson/customer/crud-customer.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách khách hàng</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- Menu Phụ tùng -->
                        <li class="nav-item">
                            <a href="" class="nav-link">
                                <i class="nav-icon fas fa-cogs"></i>
                                <p>
                                    Phụ tùng
                                    <i class="fas fa-angle-left right"></i>
                                    <span class="badge badge-danger right">New</span>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/saleperson/part/list-parts.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách phụ tùng</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- Menu Hóa đơn -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-file-invoice-dollar"></i>
                                <p>
                                    Hóa đơn
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/templates/customer/invoice/list-invoice-customer.html" class="nav-link" target="_blank">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Danh sách hóa đơn</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/templates/customer/invoice/create-invoice-customer-ver01.html" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Tạo hóa đơn mới</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- Menu Báo cáo -->
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-chart-bar"></i>
                                <p>
                                    Báo cáo
                                    <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="/report/sales" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Doanh số bán xe</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/revenue" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Doanh thu bán xe</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/popular-models" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Mẫu xe bán chạy</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/top-parts" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Phụ tùng phổ biến</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/report/top-mechanics" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Thợ máy hàng đầu</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <!-- Cài đặt -->
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#settingsModal">
                                <i class="nav-icon fas fa-cog"></i>
                                <p>Cài đặt</p>
                            </a>
                        </li>

                        <!-- Đăng xuất -->
                        <li class="nav-item">
                            <a href="/logout" class="nav-link text-danger">
                                <i class="nav-icon fas fa-sign-out-alt"></i>
                                <p>Đăng xuất</p>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>

</aside>