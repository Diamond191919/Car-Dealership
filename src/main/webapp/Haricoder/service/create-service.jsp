<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1><i class="fas fa-plus-circle mr-2"></i>Thêm Dịch Vụ Mới</h1>
                    </div>
                </div>
            </div>
        </section>

        <!-- Hiển thị thông báo thành công/thất bại -->
        <section class="content">
            <div class="container-fluid">
                <!-- Alert CREATE_SUCCESS -->
                <c:if test="${not empty requestScope.CREATE_SUCCESS}">
                    <div class="alert alert-success">
                            ${requestScope.CREATE_SUCCESS}
                    </div>
                </c:if>
                <!-- Alert CREATE_ERROR -->
                <c:if test="${not empty requestScope.CREATE_ERROR}">
                    <div class="alert alert-danger">
                            ${requestScope.CREATE_ERROR}
                    </div>
                </c:if>

                <!-- Card chứa form -->
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Nhập thông tin dịch vụ</h3>
                    </div>
                    <div class="card-body">
                        <form id="createServiceForm" action="/mechanic/create" method="post">
                            <!-- form-row 1 -->
                            <div class="form-row">
                                <!-- Tên dịch vụ -->
                                <div class="form-group col-md-6">
                                    <label for="service_name">Service Name <i class="fa fa-wrench"></i></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fa fa-wrench"></i>
                                            </span>
                                        </div>
                                        <input type="text"
                                               class="form-control"
                                               id="service_name"
                                               name="service_name"
                                               placeholder="Enter service name"
                                               required>
                                    </div>
                                </div>
                                <!-- Giá theo giờ -->
                                <div class="form-group col-md-6">
                                    <label for="hourlyRate">Hourly Rate (VND) <i class="fa fa-money"></i></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fa fa-money"></i>
                                            </span>
                                        </div>
                                        <input type="number"
                                               class="form-control"
                                               id="hourlyRate"
                                               name="hourlyRate"
                                               placeholder="Enter hourly rate"
                                               min="0"
                                               required>
                                    </div>
                                </div>
                            </div>
                            <!-- /form-row 1 -->

                            <!-- form-row 2 -->
                            <div class="form-row">
                                <!-- Trạng thái -->
                                <div class="form-group col-md-6">
                                    <label for="status">Status <i class="fa fa-info-circle"></i></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fa fa-info-circle"></i>
                                            </span>
                                        </div>
                                        <select class="form-control" id="status" name="status" required>
                                            <option value="ACTIVE">Active</option>
                                            <option value="INACTIVE">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Có thể thêm cột trống hoặc trường khác ở đây -->
                                <div class="form-group col-md-6">
                                    <!-- Trống để căn layout, hoặc thêm trường khác -->
                                </div>
                            </div>
                            <!-- /form-row 2 -->

                            <!-- Footer nút -->
                            <div class="card-footer text-right">
                                <a href="/mechanic/list" class="btn btn-secondary mr-2">Cancel</a>
                                <button type="submit" class="btn btn-primary">Create Service</button>
                            </div>
                            <!-- /Footer nút -->
                        </form>
                    </div>
                </div>
                <!-- /card -->
            </div>
        </section>
        <!-- /section content -->
    </div>
    <!-- /content-wrapper -->
</div>
<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE, v.v. -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<!-- Scripts -->
<script>
    // Demo validate, thay thế name="hourlyRate" thay vì "hourly_rate"
    $('#createServiceForm').validate({
        rules: {
            service_name: {
                required: true,
                minlength: 5
            },
            hourlyRate: {
                required: true,
                min: 0
            }
        },
        messages: {
            service_name: {
                required: "Vui lòng nhập tên dịch vụ",
                minlength: "Tên dịch vụ phải có ít nhất 5 ký tự"
            },
            hourlyRate: {
                required: "Vui lòng nhập giá theo giờ",
                min: "Giá không được nhỏ hơn 0"
            }
        }
    });
</script>
</body>
</html>
