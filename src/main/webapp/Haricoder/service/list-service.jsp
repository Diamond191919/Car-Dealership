<%@ page import="java.util.List" %>
<%@ page import="fptu.edu.vn.trainingcenter.Model.Service" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/common/main-head.jsp"/>
    <!-- Bạn có thể thêm CSS tùy chỉnh riêng cho modal nếu cần -->
    <style>
        /* CSS tùy chỉnh cho modal (nếu cần) */
        .modal-header {
            background-color: #dc3545;
            color: white;
        }
        .modal-title {
            font-weight: bold;
        }
    </style>
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
                        <h1><i class="fas fa-wrench mr-2"></i>Danh Sách Dịch Vụ</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Xem tất cả dịch vụ</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main Content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Card chứa form tìm kiếm & bảng danh sách -->
                <div class="card card-primary card-outline">
                    <!-- Header: Search form & Add New Service -->
                    <div class="card-header d-flex flex-column flex-md-row align-items-md-center justify-content-md-between">
                        <div>
                            <h3 class="card-title mb-2 mb-md-0">Tìm kiếm dịch vụ</h3>
                        </div>
                    </div>
                    <!-- Body: Search Form -->
                    <div class="card-body">
                        <form action="/mechanic/list" method="get" class="form-inline mb-3">
                            <input type="hidden" name="page" value="1">
                            <div class="form-group mr-2">
                                <label class="sr-only" for="keyword">Từ khóa</label>
                                <input type="text" name="keyword" id="keyword" class="form-control" placeholder="Search by name"
                                       value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
                            </div>
                            <div class="form-group mr-2">
                                <label class="sr-only" for="status">Trạng thái</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="">-- Select Status --</option>
                                    <%
                                        String status = request.getParameter("status");
                                        String[] statuses = {"Active", "Inactive"};
                                        for (String s : statuses) {
                                    %>
                                    <option value="<%= s %>" <%= (status != null && status.equals(s)) ? "selected" : "" %>>
                                        <%= s %>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Search</button>
                            <a href="/mechanic/list" class="btn btn-secondary">Reset</a>
                        </form>
                        <div class="row">
                            <div class="col-md-6">
                                <small class="text-muted">
                                    Found ${not empty totalItems ? totalItems : 0} service(s)
                                </small>
                            </div>
                        </div>
                    </div>
                    <!-- /Body -->

                    <div class="col-md-12 text-md-right mt-2 mt-md-0">
                        <a href="/mechanic/create" class="btn btn-success">
                            <i class="fas fa-plus mr-2"></i>Thêm Dịch Vụ Mới
                        </a>
                    </div>
                    <!-- Table List -->
                    <div class="card-body">
                        <table id="servicesTable" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th style="width: 4%;">ID</th>
                                <th style="width: 45%;">Service Name</th>
                                <th style="width: 20%">Hourly Rate</th>
                                <th style="width: 10%">Status</th>
                                <th style="width: 25%">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Service> services = (List<Service>) request.getSession().getAttribute("services");
                                if (services != null && !services.isEmpty()) {
                                    for (Service service : services) {
                            %>
                            <tr data-id="<%= service.getServiceID() %>">
                                <td><%= service.getServiceID() %></td>
                                <td><%= service.getService_name() %></td>
                                <td><%= String.format("%,.0f VND", service.getHourlyRate()) %></td>
                                <td>
                                    <button class="btn btn-sm confirm-button"
                                            data-status="<%= service.getStatus()%>"
                                            data-id="<%= service.getServiceID()%>">
                                        <%= service.getStatus()%>
                                    </button>
                                </td>
                                <td>
                                    <a href="/mechanic/edit?serviceID=<%= service.getServiceID() %>" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a class="btn btn-danger delete-button"
                                       data-name="<%= service.getService_name()%>"
                                       data-id="<%= service.getServiceID()%>"
                                       data-status="<%= service.getStatus()%>"
                                            <% if ("inactive".equals(service.getStatus())) { %> disabled <% } %>>
                                        Delete
                                    </a>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5" class="text-center">Không tìm thấy dịch vụ nào.</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <!-- /Table List -->

                    <%
                        int currentPage = request.getAttribute("currentPage") != null ? (Integer) request.getAttribute("currentPage") : 1;
                        int totalPages = request.getAttribute("totalPages") != null ? (Integer) request.getAttribute("totalPages") : 1;
                        String keywordParam = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
                        String statusParam = request.getParameter("status") != null ? request.getParameter("status") : "";
                    %>

                    <!-- Pagination -->
                    <div class="card-footer">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-end mb-0">
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="/mechanic/list?page=${currentPage - 1}&keyword=${keywordParam}&status=${statusParam}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${totalPages}" var="pageNum">
                                    <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                        <a class="page-link" href="/mechanic/list?page=${pageNum}&keyword=${keywordParam}&status=${statusParam}">
                                                ${pageNum}
                                        </a>
                                    </li>
                                </c:forEach>
                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="/mechanic/list?page=${currentPage + 1}&keyword=${keywordParam}&status=${statusParam}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <!-- /Pagination -->
                </div>
            </div>
        </section>
        <!-- /Main content -->
    </div>
    <!-- /Content Wrapper -->
</div>
<!-- ./wrapper -->


<!-- jQuery, Bootstrap 4, AdminLTE & SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const confirmButtons = document.querySelectorAll('.confirm-button');
        confirmButtons.forEach(button => {
            const status = button.getAttribute('data-status').toLowerCase();
            button.classList.add('btn-sm');
            if (status === 'active') {
                button.classList.add('btn-success');
            } else if (status === 'inactive') {
                button.classList.add('btn-danger');
            } else {
                button.classList.add('btn-light');
            }
        });
    });

    // Hàm xóa dịch vụ
    function customDeleteFunction(serviceId, serviceName) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'You want to delete the service "' + serviceName + '"?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'http://localhost:8899/api/services/delete/' + serviceId,
                    type: 'DELETE',
                    success: function (response) {
                        // Cập nhật trạng thái thành "Inactive"
                        $('tr[data-id="' + serviceId + '"] td:eq(3)').html(
                            '<button class="btn btn-sm btn-danger confirm-button" data-status="inactive" data-id="' + serviceId + '">Inactive</button>'
                        );

                        // Vô hiệu hóa nút "Delete"
                        $('a.delete-button[data-id="' + serviceId + '"]').prop('disabled', true);
                        $('a.delete-button[data-id="' + serviceId + '"]').addClass('disabled');

                        // Hiển thị thông báo thành công
                        Swal.fire({
                            title: 'Deleted!',
                            text: 'The service has been marked as inactive successfully.',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        });
                    },
                    error: function (xhr, status, error) {
                        // Hiển thị thông báo lỗi
                        Swal.fire({
                            title: 'Error!',
                            text: 'Failed to mark the service as inactive!',
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            }
        });
    }

    // Xử lý khi nhấn nút "Delete"
    $('.delete-button').on('click', function () {
        var serviceId = $(this).data('id');
        var serviceName = $(this).data('name');
        var serviceStatus = $(this).data('status');

        // Kiểm tra trạng thái trước khi xóa
        if (serviceStatus.toLowerCase() === 'inactive') {
            Swal.fire({
                title: 'Info',
                text: 'This service is already marked as inactive and cannot be deleted again.',
                icon: 'info',
                confirmButtonText: 'OK'
            });
        } else {
            // Gọi hàm xóa dịch vụ
            customDeleteFunction(serviceId, serviceName);
        }
    });
</script>
<script>
    //<!-- Script hiển thị pop-up khi UPDATE service thành công -->
    <%
        Boolean showUpdateSuccessMessage = (Boolean) session.getAttribute("DATABASE_UPDATE_SERVICE_SUCCESS");
        String updateMessage = "";
        if (showUpdateSuccessMessage != null && showUpdateSuccessMessage.booleanValue()) {
            updateMessage = "Your service update successfully.";
            session.removeAttribute("DATABASE_UPDATE_SERVICE_SUCCESS");
        }
    %>
    var message = '<%= updateMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Success',
            text: message,
            icon: 'success',
            confirmButtonText: 'OK'
        });
    }

    <!-- Script hiển thị pop-up khi UPDATE service thất bại -->
    <%
        Boolean showUpdateFailMessage = (Boolean) session.getAttribute("DATABASE_UPDATE_SERVICE_ERROR");
        String failUpdateMessage = "";
        if (showUpdateFailMessage != null && showUpdateFailMessage.booleanValue()) {
            failUpdateMessage = "Service update failed!";
            session.removeAttribute("DATABASE_UPDATE_SERVICE_ERROR");
        }
    %>
    var message = '<%= failUpdateMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Error',
            text: message,
            icon: 'error',
            confirmButtonText: 'OK'
        });
    }

    <!-- Script hiển thị pop-up khi NOTHINGCHANGE -->
    <%
        // Lấy flag hiển thị thông báo đăng nhập từ session
        Boolean showNothingChangeMessage = (Boolean) session.getAttribute("SHOW_NOTHINGCHANGE_SERVICE_MESSAGE");
        String NothingChangeMessage = "";
        // Nếu flag tồn tại và đúng, gán thông báo và xóa flag khỏi session
        if (showNothingChangeMessage != null && showNothingChangeMessage.booleanValue()) {
            NothingChangeMessage = "No changes detected!";
            session.removeAttribute("SHOW_NOTHINGCHANGE_SERVICE_MESSAGE");
        }
    %>
    var message = '<%= NothingChangeMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Success',
            text: message,
            icon: 'info',
            confirmButtonText: 'OK'
        });
    }

    <!-- Script hiển thị pop-up khi create service thành công -->
    <%
        Boolean showCreateSuccessMessage = (Boolean) session.getAttribute("CREATE_SERVICE_SUCCESS");
        String createMessage = "";
        if (showCreateSuccessMessage != null && showCreateSuccessMessage.booleanValue()) {
            createMessage = "New service added successfully.";
            session.removeAttribute("CREATE_SERVICE_SUCCESS");
        }
    %>
    var message = '<%= createMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Success',
            text: message,
            icon: 'success',
            confirmButtonText: 'OK'
        });
    }

    <!-- Script hiển thị pop-up khi create service thất bại -->
    <%
        Boolean showCreateFailMessage = (Boolean) session.getAttribute("CREATE_SERVICE_ERROR");
        String failMessage = "";
        if (showCreateFailMessage != null && showCreateFailMessage.booleanValue()) {
            failMessage = "New service added successfully.";
            session.removeAttribute("CREATE_SERVICE_ERROR");
        }
    %>
    var message = '<%= failMessage %>';
    if (message && message.trim() !== "") {
        Swal.fire({
            title: 'Error',
            text: message,
            icon: 'error',
            confirmButtonText: 'OK'
        });
    }
</script>
</body>
</html>
