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
        <!-- Content Header -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Danh Sách Phiếu Dịch Vụ</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">View All Service Tickets</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Danh Sách Phiếu Dịch Vụ</h3>
                            </div>
                            <div class="table-responsive">
                                <table id="serviceTicketsTable" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Service Ticket ID</th>
                                        <th>Service ID</th>
                                        <th>Mechanic ID</th>
                                        <th>Hours</th>
                                        <th>Comment</th>
                                        <th>Rate</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>ST001</td>
                                        <td>S001</td>
                                        <td>M001</td>
                                        <td>
                                            <span class="badge-hours-custom">2.5 hrs</span>
                                        </td>
                                        <td>Thay nhớt và lọc gió</td>
                                        <td>4.5</td>
                                        <td>
                                            <a href="/templates/saleperson/view-detail-service-ticket.html"
                                               class="btn btn-action-custom btn-view-custom">
                                                <i class="fas fa-eye"></i> View
                                            </a>
                                            <a href="/mechanic/serviceticket/edit?serviceTicketID=ST001&serviceID=S001&mechanicID=M001"
                                               class="btn btn-action-custom btn-update-custom">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ST002</td>
                                        <td>S002</td>
                                        <td>M002</td>
                                        <td>
                                            <span class="badge-hours-custom">1 hrs</span>
                                        </td>
                                        <td>Kiểm tra phanh</td>
                                        <td>4.0</td>
                                        <td>
                                            <a href="/mechanic/serviceticket/view?serviceTicketID=ST002&serviceID=S002&mechanicID=M002"
                                               class="btn btn-action-custom btn-view-custom">
                                                <i class="fas fa-eye"></i> View
                                            </a>
                                            <a href="/mechanic/serviceticket/edit?serviceTicketID=ST002&serviceID=S002&mechanicID=M002"
                                               class="btn btn-action-custom btn-update-custom">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Thêm các dòng khác nếu cần -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- End Content Wrapper -->
</div>
<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE & Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>
