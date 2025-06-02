<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/common/main-head.jsp"/>

</head>
<style>
    /* Grid layout để lấp đầy khoảng trống */
    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        padding: 20px;
    }

    /* Button lớn hơn, full width */
    .dashboard-card {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        background: #FFF;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s, box-shadow 0.3s;
        color: white;
        font-weight: bold;
        font-size: 18px;
        text-align: center;
    }

    /* Hiệu ứng hover */
    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    /* Icon to hơn và có màu sắc riêng */
    .dashboard-card i {
        font-size: 48px;
        margin-bottom: 15px;
    }

    /* Màu sắc riêng cho từng button */
    .customers { background: #FF5733; } /* Đỏ cam */
    .cars { background: #3498db; }      /* Xanh dương */
    .services { background: #2ecc71; }  /* Xanh lá */
    .parts { background: #f39c12; }     /* Cam */
    .invoices { background: #9b59b6; }  /* Tím */
    .reports { background: #e74c3c; }   /* Đỏ */

    /* Màu icon cho từng loại */
    .customers i { color: #FFDAB9; }
    .cars i { color: #D6EAF8; }
    .services i { color: #ABEBC6; }
    .parts i { color: #FDEBD0; }
    .invoices i { color: #E8DAEF; }
    .reports i { color: #F5B7B1; }

    /* Responsive cho mobile */
    @media (max-width: 768px) {
        .dashboard-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Sidebar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">
                <div class="dashboard-grid">
                    <!-- Khách Hàng -->
                    <a href="#" class="dashboard-card customers">
                        <i class="fas fa-users"></i>
                        <h5>Khách Hàng</h5>
                    </a>

                    <!-- Quản lý Xe -->
                    <a href="#" class="dashboard-card cars">
                        <i class="fas fa-car"></i>
                        <h5>Quản Lý Xe</h5>
                    </a>

                    <!-- Dịch Vụ -->
                    <a href="#" class="dashboard-card services">
                        <i class="fas fa-tools"></i>
                        <h5>Dịch Vụ</h5>
                    </a>

                    <!-- Phụ Tùng -->
                    <a href="/MainServlet?action=listparts" class="dashboard-card parts">
                        <i class="fas fa-cogs"></i>
                        <h5>Phụ Tùng</h5>
                    </a>

                    <!-- Hóa Đơn -->
                    <a href="/MainServlet?action=showAllInvoices" class="dashboard-card invoices">
                        <i class="fas fa-file-invoice-dollar"></i>
                        <h5>Hóa Đơn</h5>
                    </a>

                    <!-- Báo Cáo -->
                    <a href="#" class="dashboard-card reports">
                        <i class="fas fa-chart-line"></i>
                        <h5>Báo Cáo</h5>
                    </a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</body>
</html>