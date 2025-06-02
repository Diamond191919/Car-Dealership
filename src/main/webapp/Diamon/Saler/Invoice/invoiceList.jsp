
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/common/main-head.jsp"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css">
    <!-- FontAwesome (cho icon) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

</head>
<style>
    .btn {
        padding: 10px 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        text-align: center;
        border-color: white;
    }

    .btn btn-primary {
        background-color: var(--color-accent) !important;
        color: white !important;
        border: none;
    }

    .btn:hover {
        opacity: 0.8;
    }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Sidebar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div class="content-wrapper invoice-list-content">
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card border-0 shadow-none" >
                            <div class="card-header d-flex align-items-center">
                            <h1 class="invoice-list-title m-0">Danh Sách Hóa Đơn</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty sessionScope.successMessage}">
                    <div id="success-alert" class="alert alert-success" style="position: fixed; top: 60px; right: 10px; z-index: 1000;">
                            ${sessionScope.successMessage}
                    </div>

                    <%-- Xóa thông báo sau khi hiển thị --%>
                    <c:remove var="successMessage" scope="session"/>

                    <script>
                        setTimeout(function() {
                            var alertBox = document.getElementById("success-alert");
                            if (alertBox) {
                                alertBox.style.opacity = "0";
                                setTimeout(() => alertBox.style.display = "none", 500); // Hiệu ứng mờ dần rồi ẩn
                            }
                        }, 5000);
                    </script>
                </c:if>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="card" style="border-top: 3px solid var(--color-accent);">
                            <div class="card-header d-flex justify-content-start">
                                <form action="MainServlet" method="POST">
                                    <input type="hidden" name="action" value="showAssignedInvoices">
                                    <button type="submit" class="btn mr-2" style="background: var(--color-accent); color: white;">Khách hàng phụ trách</button>
                                </form>
                                <form action="MainServlet" method="POST">
                                    <input type="hidden" name="action" value="showUnassignedInvoices">
                                    <button type="submit" class="btn" style="background: var(--color-accent); color: white;">Khách hàng không phụ trách</button>
                                </form>
                                <a href="/MainServlet?action=addnewinvoice" class="btn btn-primary ms-auto"
                                   style="background-color: var(--color-accent); border: none; margin-left: 10px">
                                    <i class="fas fa-plus"></i> Tạo hóa đơn mới
                                </a>
                            </div>
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead style="background: var(--color-grey-light);">
                                    <tr>
                                        <th>Mã Hóa Đơn</th>
                                        <th>Ngày Tạo</th>
                                        <th>Người Bán</th>
                                        <th>Khách Hàng</th>
                                        <th>Mẫu Xe</th>
                                        <th>Trạng Thái</th>
                                        <th>Tạo</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="invoice" items="${invoiceList}">
                                        <tr>
                                            <td>${invoice.invoiceId}</td>
                                            <td>${invoice.invoiceDate}</td>
                                            <td>${invoice.salesID}</td>
                                            <td>${invoice.custID}</td>
                                            <td>${invoice.carID}</td>
                                            <td>${invoice.status}</td>
                                            <td>
                                                <a href="/MainServlet?action=activateInvoice&invoiceID=${invoice.invoiceId}"
                                                   class="btn btn-create" title="Kích hoạt hóa đơn bảng phụ trách"
                                                   style="background: var(--color-accent); color: white;">
                                                    <i class="fas fa-plus-circle"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- /content -->
    </div>
    <!-- /.content-wrapper -->
</div>

<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE & Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- jQuery & Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
