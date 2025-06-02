<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navbar (AdminLTE) -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Sidebar Toggle Button -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button">
                <i class="fas fa-bars"></i>
            </a>
        </li>
    </ul>

    <!-- User Account -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown user user-menu">
            <c:set var="user" value="${sessionScope.USER}" />
            <c:set var="userName" value="${user != null ? user.name : 'Guest'}" />
            <c:set var="customerRoleID" value="${user != null ? user.roleID : '-1'}" />
            <c:set var="mechanicRoleID" value="${user != null ? user.roleID : '-1'}" />
            <c:set var="salesPeronRoleID" value="${user != null ? user.roleID : '-1'}" />
            <c:set var="isOnline" value="${user != null}" />

            <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" data-toggle="dropdown">
                <!-- User Image -->
                <img src="<c:url value='/static/img/hari_coder/nguyenHaiCoder.jpg'/>" class="user-image mr-2" alt="User Image" />
                <!-- Username -->
                <span class="d-none d-sm-inline-block">Hello, ${userName}</span>
            </a>

            <ul class="dropdown-menu dropdown-menu-right custom-dropdown">
                <li class="user-header-custom">
                    <img src="<c:url value='/static/img/hari_coder/nguyenHaiCoder.jpg'/>" class="img-circle mr-3" alt="User Image">
                    <p class="mb-0">
                        ${userName}<br>
                        <small>
                            <c:choose>
                                <c:when test="${user != null}">
                                    <i class="fas fa-circle text-success"></i> Online
                                </c:when>
                                <c:when test="${user != null && user.roleID == '4'}">
                                    <i class="fas fa-circle text-success"></i> Online
                                </c:when>
                                <c:when test="${user != null && user.roleID == '2'}">
                                    <i class="fas fa-circle text-success"></i> Online
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-circle text-danger"></i> Offline
                                </c:otherwise>
                            </c:choose>
                        </small>
                    </p>
                </li>

                <c:choose>
<%--                    <!-- Nếu user có roleID bằng "3" (Mechanic) -->--%>
                    <c:when test="${mechanicRoleID == '3'}">
                        <li class="user-body">
                            <a href="/mechanic-service-tickets" class="dropdown-item">
                                <i class="fas fa-wrench"></i> Phiếu Dịch Vụ (Thợ sửa)
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/mechanic/update-ticket" class="dropdown-item">
                                <i class="fas fa-edit"></i> Cập nhật Phiếu Dịch Vụ
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/mechanic/services" class="dropdown-item">
                                <i class="fas fa-clipboard-list"></i> Quản Lý Dịch Vụ
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/MainServlet?action=mechanicTicket" class="dropdown-item">
                                <i class="fas fa-edit"></i> Xem danh sách phiếu dịch vụ
                            </a>
                        </li>
                    </c:when>


<%--                    Của saler--%>
                    <c:when test="${mechanicRoleID == '4'}">
                        <li class="user-body">
                            <a href="/cars" class="dropdown-item">
                                <i class="fas fa-car"></i> Quản lý Xe
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/service-tickets" class="dropdown-item">
                                <i class="fas fa-ticket-alt"></i> Phiếu Dịch Vụ
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/MainServlet?action=listparts" class="dropdown-item">
                                <i class="fas fa-tools"></i> Quản lý Phụ tùng
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/MainServlet?action=showAllInvoices" class="dropdown-item">
                                <i class="fas fa-file-invoice-dollar"></i> Quản lí hóa đơn
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/reports" class="dropdown-item">
                                <i class="fas fa-chart-line"></i> Báo cáo Thống Kê
                            </a>
                        </li>
                    </c:when>
<%--                    của customer--%>
                    <c:when test="${mechanicRoleID == '2'}">
                        <li class="user-body">
                            <a href="/MainServlet?action=customerticket" class="dropdown-item">
                                <i class="fas fa-ticket-alt"></i> Phiếu Dịch Vụ của tôi
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/customer-invoices" class="dropdown-item">
                                <i class="fas fa-file-invoice-dollar"></i> Hóa đơn của tôi
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/profile" class="dropdown-item">
                                <i class="fas fa-user-cog"></i> Hồ sơ cá nhân
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/settings" class="dropdown-item">
                                <i class="fas fa-cogs"></i> Cài đặt
                            </a>
                        </li>
                    </c:when>
<%--                    <!-- Nếu không phải 3 thằng trên, hiển thị menu đầy đủ -->--%>

<%--                    <!-- Nếu không phải mechanic, hiển thị menu đầy đủ -->--%>

                    <c:otherwise>
                        <li class="user-body">
                            <a href="/cars" class="dropdown-item">
                                <i class="fas fa-car"></i> Quản lý Xe
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/service-tickets" class="dropdown-item">
                                <i class="fas fa-ticket-alt"></i> Phiếu Dịch Vụ
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/parts" class="dropdown-item">
                                <i class="fas fa-tools"></i> Quản lý Phụ tùng
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/invoices" class="dropdown-item">
                                <i class="fas fa-file-invoice-dollar"></i> Hóa đơn
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/reports" class="dropdown-item">
                                <i class="fas fa-chart-line"></i> Báo cáo Thống Kê
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/customer-service-tickets" class="dropdown-item">
                                <i class="fas fa-ticket-alt"></i> Phiếu Dịch Vụ của tôi
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/customer-invoices" class="dropdown-item">
                                <i class="fas fa-file-invoice-dollar"></i> Hóa đơn của tôi
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/profile" class="dropdown-item">
                                <i class="fas fa-user-cog"></i> Hồ sơ cá nhân
                            </a>
                        </li>
                        <li class="user-body">
                            <a href="/settings" class="dropdown-item">
                                <i class="fas fa-cogs"></i> Cài đặt
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="user-footer">
                    <div class="float-left">
                        <a href="/GeneralRequest?action=viewProfile" class="btn btn-light">Hồ sơ của tôi</a>
                    </div>
                    <div class="float-right">
                        <a href="/logout" class="btn btn-danger">Đăng xuất</a>
                    </div>
                </li>
            </ul>
        </li>
    </ul>

    <c:if test="${empty sessionScope.USER}">
        <div class="d-flex align-items-center mt-3 mt-lg-0 auth-buttons login-register-buttons">
            <a href="#" class="btn-login" data-bs-toggle="modal" data-bs-target="#login-modal">Đăng nhập</a>
            <a href="#" class="btn-register" data-bs-toggle="modal" data-bs-target="#register-modal">Đăng ký</a>
        </div>
    </c:if>
</nav>
<!-- /.navbar -->