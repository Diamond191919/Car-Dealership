<%@ page import="fptu.edu.vn.trainingcenter.Model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/common/main-head.jsp"/>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Navbar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Content Header (Breadcrumb) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Dashboard Thợ Sửa</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Thẻ thống kê -->
                <div class="row">
                    <!-- Tổng phiếu dịch vụ -->
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>125</h3>
                                <p>Tổng Phiếu Dịch Vụ</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-ticket-alt"></i>
                            </div>
                            <a href="mechanic/service-tickets" class="small-box-footer">
                                Xem chi tiết <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!-- Phiếu hoàn thành -->
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>80</h3>
                                <p>Phiếu Hoàn Thành</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <a href="mechanic/service-tickets?status=completed" class="small-box-footer">
                                Xem chi tiết <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!-- Phiếu chờ xử lý -->
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>30</h3>
                                <p>Phiếu Chờ Xử Lý</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-hourglass-half"></i>
                            </div>
                            <a href="mechanic/service-tickets?status=pending" class="small-box-footer">
                                Xem chi tiết <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!-- Đánh giá trung bình -->
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>4.5</h3>
                                <p>Đánh Giá Trung Bình</p>
                            </div>
                            <div class="icon">
                                <i class="fas fa-star"></i>
                            </div>
                            <a href="mechanic/ratings" class="small-box-footer">
                                Xem đánh giá <i class="fas fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- End Thẻ thống kê -->

                <!-- Biểu đồ thống kê -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card card-outline chart-card">
                            <div class="card-header">
                                <h3 class="card-title">Biểu đồ Phiếu Dịch Vụ</h3>
                            </div>
                            <div class="card-body">
                                <canvas id="ticketsChart" style="height:250px"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card card-outline chart-card">
                            <div class="card-header">
                                <h3 class="card-title">Biểu đồ Đánh Giá</h3>
                            </div>
                            <div class="card-body">
                                <canvas id="ratingChart" style="height:250px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Biểu đồ -->

                <!-- Bảng phiếu dịch vụ gần đây -->
                <div class="row">
                    <div class="col-12">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Phiếu Dịch Vụ Gần Đây</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>Ticket ID</th>
                                        <th>Customer ID</th>
                                        <th>Car ID</th>
                                        <th>Date Received</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Dữ liệu mẫu, thay thế bằng dữ liệu động -->
                                    <tr>
                                        <td>ST123</td>
                                        <td>CUST045</td>
                                        <td>CAR007</td>
                                        <td>2025-03-14</td>
                                        <td><span class="badge badge-success">Completed</span></td>
                                    </tr>
                                    <tr>
                                        <td>ST124</td>
                                        <td>CUST012</td>
                                        <td>CAR003</td>
                                        <td>2025-03-13</td>
                                        <td><span class="badge badge-warning">Pending</span></td>
                                    </tr>
                                    <tr>
                                        <td>ST125</td>
                                        <td>CUST078</td>
                                        <td>CAR010</td>
                                        <td>2025-03-12</td>
                                        <td><span class="badge badge-info">In Progress</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer clearfix">
                                <a href="mechanic/service-tickets"
                                   class="btn btn-sm btn-secondary float-right custom-btn">
                                    Xem tất cả
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End bảng phiếu dịch vụ -->
            </div>
        </section>
        <!-- End Main content -->
    </div>
    <!-- End Content Wrapper -->
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
    <!-- Script hiển thị pop-up khi login thành công -->
    <%
        // Lấy đối tượng người dùng từ session
        Account userAccount = (Account) session.getAttribute("USER");
        // Lấy flag hiển thị thông báo đăng nhập từ session
        Boolean showLoginMessage = (Boolean) session.getAttribute("SHOW_LOGIN_MESSAGE");
        String loginMessage = "";
        // Nếu flag tồn tại và đúng, gán thông báo và xóa flag khỏi session
        if (showLoginMessage != null && showLoginMessage.booleanValue()) {
            loginMessage = "Đăng nhập thành công! Rất vui được gặp lại bạn, " + userAccount.getName();
            session.removeAttribute("SHOW_LOGIN_MESSAGE");
        }
    %>
    var message = '<%= loginMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Thành công',
            text: message,
            icon: 'success',
            confirmButtonText: 'OK'
        });
    }
    <!-- Script hiển thị pop-up khi NOTHINGCHANGE -->
    <%
        // Lấy flag hiển thị thông báo đăng nhập từ session
        Boolean showNothingChangeMessage = (Boolean) session.getAttribute("SHOW_NOTHINGCHANGE_MESSAGE");
        String NothingChangeMessage = "";
        // Nếu flag tồn tại và đúng, gán thông báo và xóa flag khỏi session
        if (showNothingChangeMessage != null && showNothingChangeMessage.booleanValue()) {
            NothingChangeMessage = "Không có thay đổi nào!";
            session.removeAttribute("SHOW_NOTHINGCHANGE_MESSAGE");
        }
    %>
    var message = '<%= NothingChangeMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Thông tin',
            text: message,
            icon: 'info',
            confirmButtonText: 'OK'
        });
    }
</script>
<script>
    // Biểu đồ Phiếu Dịch Vụ
    var ctx = document.getElementById('ticketsChart').getContext('2d');
    var ticketsChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Completed', 'Pending', 'In Progress'],
            datasets: [{
                data: [80, 30, 15],
                backgroundColor: ['#28a745', '#ffc107', '#17a2b8']
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });

    // Biểu đồ Đánh Giá
    var ctx2 = document.getElementById('ratingChart').getContext('2d');
    var ratingChart = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['1★', '2★', '3★', '4★', '5★'],
            datasets: [{
                label: 'Số lượt đánh giá',
                data: [2, 5, 10, 20, 30],
                backgroundColor: '#FF7A00'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        stepSize: 5
                    }
                }]
            }
        }
    });
</script>
</body>
</html>
