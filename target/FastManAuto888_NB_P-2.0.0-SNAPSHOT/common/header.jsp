<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="navbar navbar-light bg-light navbar-expand-lg fixed-top">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
                <!-- "Garage" màu cam (#FF7A00), "Pro" màu #333 -->
                <strong><span style="color:#FF7A00;">FastMan</span><span style="color:#333;">Pro8</span></strong>
            </a>
            <!-- Nút hamburger, kích hoạt offcanvas -->
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar" aria-label="Toggle navigation" aria-expanded="false">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Offcanvas trượt từ bên phải (end) -->
            <div class="offcanvas offcanvas-end text-bg-light" tabindex="-1" id="offcanvasNavbar"
                 aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>

                <div class="offcanvas-body">
                    <!-- Menu -->
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 custom-menu-header">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#hero">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#about">Giới thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#service">Dịch vụ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#car">Xem xe</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#reviews">Đánh giá</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Liên hệ</a>
                        </li>
                        <%-- Drop menu --%>
                        <c:set var="user" value="${sessionScope.USER}" />
                        <c:if test="${not empty user}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <span class="ms-2">Tài khoản</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                    <li class="dropdown-item user-info">
                                        <span class="ms-2">Customer: Nguyễn Văn Linh</span>
                                    </li>
                                    <li><a class="dropdown-item" href="/profile"><i class="fas fa-user me-2"></i>Thông tin cá nhân</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#bookings"><i class="fas fa-calendar-check me-2"></i>Đơn đặt xe</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#history"><i class="fas fa-history me-2"></i>Lịch sử thuê xe</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#settings"><i class="fas fa-cog me-2"></i>Cài đặt</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#logout"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:if>
                    </ul>

                    <div class="d-flex align-items-center mt-3 mt-lg-0 auth-buttons">
                        <a href="#" class="btn-login" data-bs-toggle="modal" data-bs-target="#login-modal">Đăng nhập</a>
                        <a href="#" class="btn-register" data-bs-toggle="modal" data-bs-target="#register-modal">Đăng ký</a>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>