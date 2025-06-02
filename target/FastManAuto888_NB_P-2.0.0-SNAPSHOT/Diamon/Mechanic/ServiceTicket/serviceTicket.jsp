
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    .service-history-wrapper {
        padding: 20px;
    }
    .service-history-title {
        color: var(--color-accent);
        font-weight: bold;
    }
    .ticket-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .ticket-table th, .ticket-table td {
        border: 1px solid #dee2e6;
        padding: 10px;
        text-align: left;
    }
    .ticket-table th {
        background-color: #f8f9fa;
    }
    .btn-warning {
        background-color: #ffc107;
        border: none;
    }
    .btn-warning:hover {
        background-color: #e0a800;
    }
</style>
<style>
    .search-container {
        display: flex;
        gap: 6px;
        align-items: center;
    }

    .search-dropdown, .search-input, .btn-warning {
        padding: 6px 8px;
        font-size: 14px;
        height: 34px; /* Đồng bộ chiều cao */
        border-radius: 4px;
        border: 1px solid var(--color-accent);
        outline: none;
    }

    .search-dropdown {
        background-color: white;
        color: #333;
        width: 140px; /* Giảm chiều rộng */
    }

    .search-input {
        width: 200px; /* Giảm chiều rộng */
    }

    .btn-warning {
        background-color: #ffc107;
        color: black;
        font-weight: bold;
        border: none;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
        width: 120px; /* Giảm chiều rộng */
    }

    .btn-warning:hover {
        background-color: var(--color-accent);
    }

</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Sidebar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div class="content-wrapper service-history-wrapper">
        <section class="content-header service-history-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="service-history-title">
                            <i class="fas fa-history mr-2"></i>Danh sách phiếu dịch vụ
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content pb-0">
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-md-12">
                        <form action="MainServlet" method="get">
                            <input type="hidden" name="action" value="searchTicket">

                            <div class="row">
                                <!-- Mã KH -->
                                <div class="search-container">
                                    <select name="searchType" class="search-dropdown">
                                        <option value="custID">Customer ID</option>
                                        <option value="carID">Car ID</option>
                                        <option value="dateReceived">Date Received</option>
                                    </select>

                                    <input type="text" name="searchValue" class="search-input" placeholder="Enter search value...">

                                <!-- Nút Tìm Kiếm -->
                                    <div class="col-md-3 d-flex align-items-end">
                                        <button type="submit" class="btn btn-warning w-100">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <input type="hidden" name="searchValue" id="searchValue">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>



        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style=" border-top: var(--color-accent);">
                            <div class="card-body">
                                <table class="ticket-table">
                                    <tr>
                                        <th>ID</th>
                                        <th>ID Dịch vụ</th>
                                        <th>ID Khách hàng</th>
                                        <th>Tên Khách hàng</th>
                                        <th>ID xe</th>
                                        <th>Loại xe</th>
                                        <th>Ngày nhận</th>
                                        <th>Ngày trả</th>
                                        <th>Giờ</th>
                                        <th>Bình luận</th>
                                        <th>Rate</th>
                                    </tr>
                                    <c:forEach var="ticket" items="${ticketList}">
                                        <tr>
                                            <td>${ticket.serviceTicketID}</td>
                                            <td>${ticket.serviceID}</td>
                                            <td>${ticket.custID}</td>
                                            <td>${ticket.cust_name}</td>
                                            <td>${ticket.carID}</td>
                                            <td>${ticket.model}</td>
                                            <td>${ticket.dateRecived}</td>
                                            <td>${ticket.dateReturned}</td>
                                            <td>${ticket.hours}</td>
                                            <td>${ticket.comment}</td>
                                            <td><fmt:formatNumber value="${ticket.rate}" pattern="0.####" /></td>
                                        </tr>
                                    </c:forEach>
                                </table>
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
<!-- jQuery & Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("searchForm").addEventListener("submit", function(event) {
        let custID = document.getElementById("searchCustID").value.trim();
        let carID = document.getElementById("searchCarID").value.trim();
        let dateReceived = document.getElementById("searchDate").value.trim();

        if (custID !== "") {
            document.getElementById("searchType").value = "custID";
            document.getElementById("searchValue").value = custID;
        } else if (carID !== "") {
            document.getElementById("searchType").value = "carID";
            document.getElementById("searchValue").value = carID;
        } else if (dateReceived !== "") {
            document.getElementById("searchType").value = "dateReceived";
            document.getElementById("searchValue").value = dateReceived;
        } else {
            event.preventDefault(); // Ngăn gửi form nếu không nhập gì
            alert("Vui lòng nhập thông tin tìm kiếm!");
        }
    });
</script>
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
