<%@ page import="fptu.edu.vn.trainingcenter.Model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>GarageName - Edit Profile</title>
    <jsp:include page="common/main-head.jsp"/>
    <link rel="stylesheet" href="/static/css/hari_custom/profile_custom.css" />
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Sidebar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Chỉnh Sửa Thông Tin Cá Nhân</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Edit Profile</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <%
            Account account = (Account) session.getAttribute("USER");
        %>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-header">
                            <div class="row align-items-center">
                                <div class="col-md-1">
                                    <img src="/static/img/hari_coder/nguyenHaiCoder.jpg"
                                         class="img-circle elevation-2" alt="User Image"
                                         style="width: 60px; height: 60px;">
                                </div>
                                <div class="col-md-11">
                                    <h3>Thông Tin Tài Khoản</h3>
                                    <p>Cập nhật thông tin cá nhân của bạn</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" id="profile-edit-container">
                    <!-- Thông tin cơ bản -->
                    <div class="col-md-4" id="profile-image">
                        <div class="card profile-card">
                            <div class="card-header">
                                <h3 class="card-title">Ảnh Hồ Sơ</h3>
                            </div>
                            <div class="card-body">
                                <div class="profile-image-container d-flex flex-column align-items-center">
                                    <img src="/static/img/hari_coder/nguyenHaiCoder.jpg" class="profile-image"
                                         alt="User Image">
                                    <div class="mt-3">
                                        <label class="custom-file-upload">
                                            <input type="file" style="display: none;">
                                            <i class="fas fa-upload"></i> Tải ảnh lên
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <label>Your ID</label>
                                    <input type="text" class="form-control input-readonly" id="id" name="custId" value="<%= account.getId()%>" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <input type="text" class="form-control input-readonly" id="role" name="role" value="<%= account.getRoleID()%>" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Thông tin chi tiết -->
                    <div class="col-md-8" id="personal-info">
                        <div class="card profile-card">
                            <div class="card-header">
                                <h3 class="card-title">Thông Tin Cá Nhân</h3>
                            </div>
                            <div class="card-body">
                                <form id="profileForm" action="GeneralRequest" method="POST">
                                    <!-- Các trường thông tin cá nhân -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">Họ và Tên</label>
                                                <input type="text" class="form-control" id="name" name="name"
                                                       value="<%= account.getName()%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control readonly-input" id="email" name="email"
                                                       value="<%= account.getEmail()%>" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="phone">Số Điện Thoại</label>
                                                <input type="text" class="form-control" id="phone" name="phone"
                                                       value="<%= account.getPhone()%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="sex">Giới Tính</label>
                                                <select class="form-control" id="sex" name="sex" required>
                                                    <option value="">Please select...</option>
                                                    <option value="Nam" <%= account.getSex() != null && account.getSex().equalsIgnoreCase("Nam") ? "selected" : ""%>>Nam</option>
                                                    <option value="Nữ" <%= account.getSex() != null && account.getSex().equalsIgnoreCase("Nữ") ? "selected" : ""%>>Nữ</option>
                                                    <option value="Khác" <%= account.getSex() != null && account.getSex().equalsIgnoreCase("Khác") ? "selected" : ""%>>Khác</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="address">Địa Chỉ</label>
                                        <textarea class="form-control" id="address" name="address" rows="3" required><%= account.getAddress()%></textarea>
                                    </div>

                                    <div class="form-group row mt-4">
                                        <div class="col-md-12 text-right">
                                            <button type="button" class="btn btn-cancel mr-2" onclick="window.location.href='/mechanic/dashboard'">Hủy Bỏ</button>
                                            <button type="submit" name="action" value="editProfileCustomer" class="btn btn-save">Lưu Thay Đổi</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Thay đổi mật khẩu -->
                    <div class="col-md-12">
                        <div class="card profile-card">
                            <div class="card-header">
                                <h3 class="card-title">Thay Đổi Mật Khẩu</h3>
                            </div>
                            <div class="card-body">
                                <form id="changePasswordForm">
                                    <!-- Mật khẩu hiện tại -->
                                    <div class="form-group">
                                        <label for="current-password">Mật Khẩu Hiện Tại</label>
                                        <input type="password" class="form-control" id="current-password"
                                               name="current-password"
                                               placeholder="Nhập mật khẩu hiện tại để xác nhận thay đổi">
                                    </div>

                                    <!-- Mật khẩu mới -->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="new-password">Mật Khẩu Mới</label>
                                                <input type="password" class="form-control" id="new-password"
                                                       name="new-password" placeholder="Nhập mật khẩu mới">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="confirm-password">Xác Nhận Mật Khẩu Mới</label>
                                                <input type="password" class="form-control" id="confirm-password"
                                                       name="confirm-password" placeholder="Xác nhận mật khẩu mới">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Nút submit -->
                                    <div class="form-group row mt-4">
                                        <div class="col-md-12 text-right">
                                            <button type="button" class="btn btn-cancel mr-2" onclick="window.location.href='/mechanic/dashboard'">Hủy Bỏ</button>
                                            <button type="submit" class="btn btn-save">Lưu Thay Đổi</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE & Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/static/js/back-to-top.js"></script>
<script>
    <!-- Script hiển thị pop-up khi DATABASE_UPDATE_SUCCESS (ver 0.0.2)-->
    <%
        // Lấy flag hiển thị thông báo cập nhật thành công từ session
        Boolean showUpdateSuccessMessage = (Boolean) session.getAttribute("DATABASE_UPDATE_SUCCESS");
        String updateSuccessMessage = "";
        // Nếu flag tồn tại và đúng, gán thông báo và xóa flag khỏi session
        if (showUpdateSuccessMessage != null && showUpdateSuccessMessage.booleanValue()) {
            updateSuccessMessage = "Quá trình cập nhật đã thành công. Dữ liệu của bạn đã được cập nhật";
            session.removeAttribute("DATABASE_UPDATE_SUCCESS");
        }
    %>
    var message = '<%= updateSuccessMessage%>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Tuyệt vời',
            text: message,
            icon: 'success',
            confirmButtonText: 'OK'
        });
    }
</script>
<script>
    <!-- Script hiển thị role name-->
    const roleID = <%= account.getRoleID()%>;
    const roleNames = {
        1: "Admin",
        2: "Customer",
        3: "Mechanic",
        4: "Sale"
    };

    document.getElementById('role').value = roleNames[roleID] || "Unknown";
</script>
</body>
</html>
