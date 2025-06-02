<%@ page import="fptu.edu.vn.trainingcenter.Model.Service" %>
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
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>
                            <i class="fas fa-edit mr-2"></i>Chỉnh Sửa Dịch Vụ
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <%
            // Lấy dịch vụ từ request attribute
            Service service = (Service) request.getAttribute("service");
        %>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-primary card-outline">
                            <form id="editServiceForm" action="/mechanic/update" method="post">
                                <input type="hidden" name="serviceID" value="<%= service.getServiceID() %>">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>Mã dịch vụ</label>
                                        <input type="text" class="form-control" name="serviceID" value="<%= service.getServiceID() %>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên Dịch Vụ</label>
                                        <input type="text" class="form-control" name="service_name" value="<%= service.getService_name() %>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá Theo Giờ</label>
                                        <input type="text" class="form-control" name="hourlyRate" value="<%= String.format("%,.0f VND", service.getHourlyRate()) %>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Trạng Thái</label>
                                        <select class="form-control" name="status" required>
                                            <option value="ACTIVE" <%= service.getStatus().equalsIgnoreCase("ACTIVE") ? "selected" : "" %>>Hoạt động</option>
                                            <option value="INACTIVE" <%= service.getStatus().equalsIgnoreCase("INACTIVE") ? "selected" : "" %>>Ngừng cung cấp</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save mr-2"></i>Cập Nhật
                                    </button>
                                    <a href="/mechanic/list" class="btn btn-secondary">
                                        <i class="fas fa-times mr-2"></i>Hủy
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- End Content Wrapper -->
</div>
<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE & Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<!-- Scripts -->
<script>
    $('#editServiceForm').validate({
        rules: {
            service_name: {
                required: true,
                minlength: 5
            },
            hourly_rate: {
                required: true,
                min: 0
            }
        },
        messages: {
            service_name: {
                required: "Vui lòng nhập tên dịch vụ",
                minlength: "Tên dịch vụ phải có ít nhất 5 ký tự"
            },
            hourly_rate: {
                required: "Vui lòng nhập giá theo giờ",
                min: "Giá không được nhỏ hơn 0"
            }
        }
    });
</script>
</body>
</html>
