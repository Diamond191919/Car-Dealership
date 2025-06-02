
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
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h1 style="color: white;" class="invoice-list-title m-0">Khách Hàng Mới</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="card" style="border-top: 3px solid var(--color-accent);">
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead style="background: var(--color-grey-light);">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên Khách Hàng</th>
                                        <th>Số Điện Thoại</th>
                                        <th>Giới Tính</th>
                                        <th>Địa Chỉ</th>
                                        <th>Xe Sở Hữu</th>
                                        <th>Tạo Mới</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="customer" items="${availableCustomers}">
                                        <tr>
                                            <td>${customer.custID}</td>
                                            <td>${customer.custName}</td>
                                            <td>${customer.phone}</td>
                                            <td>${customer.sex}</td>
                                            <td>${customer.cusAddress}</td>
                                            <form action="MainServlet?action=addnew" method="POST">
                                            <td>
                                                    <select name="carID" class="form-control" required>
                                                        <option value="">
                                                        <c:forEach var="car" items="${availableCars}">
                                                            <option value="${car.carID}">
                                                                    ${car.carID} - ${car.model} - ${car.colour} - ${car.year}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                            </td>
                                            <td>
                                                <input type="hidden" name="custID" value="${customer.custID}">
                                                <button type="submit" class="btn btn-create" title="Create Invoice" style="background-color: var(--color-accent); color: white;">
                                                    <i class="fas fa-plus-circle"></i>
                                                </button>
                                            </td>
                                            </form>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const selects = document.querySelectorAll(".car-select");

        selects.forEach(select => {
            select.addEventListener("change", function () {
                const selectedValues = new Set();

                // Lưu tất cả giá trị được chọn trong các dropdown khác (trừ blank)
                selects.forEach(s => {
                    if (s.value) selectedValues.add(s.value);
                });

                // Cập nhật lại danh sách các lựa chọn cho tất cả dropdown
                selects.forEach(s => {
                    const options = s.querySelectorAll("option");
                    options.forEach(option => {
                        if (option.value && selectedValues.has(option.value) && option.value !== s.value) {
                            option.style.display = "none"; // Ẩn lựa chọn đã chọn
                        } else {
                            option.style.display = ""; // Hiển thị lại nếu chưa bị chọn
                        }
                    });
                });
            });
        });
    });
</script>
</body>
</html>
