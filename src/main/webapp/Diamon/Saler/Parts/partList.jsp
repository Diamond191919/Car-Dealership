
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="/common/main-head.jsp"/>
</head>
<style>
    .custom-alert {
        max-width: 500px;
        margin: 10px auto; /* Căn giữa */
        font-size: 14px;
        padding: 10px 15px;
        border-radius: 5px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }

    .custom-alert .close {
        padding: 5px 10px;
        font-size: 16px;
    }

    .btn-outline-secondary {
        background-color: white !important;
        color: #ff6600 !important;
    }
</style>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Main Sidebar -->
    <jsp:include page="/common/navbar.jsp"/>

    <!-- Main Sidebar -->
    <jsp:include page="/common/sidebar.jsp"/>

    <!-- Content Wrapper -->

    <%-- Hiển thị thông báo từ session --%>
    <%
        String[] sessionKeys = {"addmessage", "adderror", "editmessage", "editerror", "deletemessage", "deleteerror"};
        String[] alertClasses = {"alert-success", "alert-danger", "alert-success", "alert-danger", "alert-success", "alert-danger"};

        for (int i = 0; i < sessionKeys.length; i++) {
            String msg = (String) session.getAttribute(sessionKeys[i]);
            if (msg != null) {
    %>
    <%-- /.Hiển thị thông báo từ session --%>

    <div class="alert custom-alert <%= alertClasses[i] %> alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
    </div>
    <%
                session.removeAttribute(sessionKeys[i]); // Xóa sau khi hiển thị
            }
        }
    %>


    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 style="color: var(--color-accent);">
                            <i class="fas fa-cogs mr-2"></i>Danh Sách Phụ Tùng
                        </h1>
                    </div>
                    <div class="col-sm-6 text-right">
                        <button class="btn btn-flat" data-toggle="modal" data-target="#createPartModal"
                                style="background: var(--color-accent); color: white;">
                            <i class="fas fa-plus mr-2"></i>Thêm Phụ Tùng
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="border-top: 3px solid var(--color-accent);">
                            <div class="card-header">
                                <div class="card-header">
                                    <form action="/MainServlet?action=search" method="POST" class="input-group" style="max-width: 300px;">
                                        <input type="text" class="form-control" placeholder="Tìm kiếm theo tên..." id="searchInput" name="query">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-outline-secondary" style="border-color: var(--color-accent); color: white;">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead style="background: var(--color-grey-light);">
                                    <tr>
                                        <th>Mã PT</th>
                                        <th>Tên Phụ Tùng</th>
                                        <th>Giá Nhập</th>
                                        <th>Giá Bán</th>
                                        <th>Hành Động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="part" items="${partsList}">
                                        <tr>
                                            <td>${part.partID}</td>
                                            <td>${part.partName}</td>
                                            <td>${part.purchasePrice}đ</td>
                                            <td>${part.retailPrice}đ</td>
                                            <td>
                                                <button class="btn btn-sm mr-1 edit-btn"
                                                        data-part-id="${part.partID}"
                                                        data-toggle="modal"
                                                        data-target="#editPartModal"
                                                        style="background: var(--color-accent-light);">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger delete-btn"
                                                        data-part-id="${part.partID}"
                                                        data-part-name="${part.partName}"
                                                        data-purchase-price="${part.purchasePrice}"
                                                        data-retail-price="${part.retailPrice}"
                                                        data-toggle="modal"
                                                        data-target="#deletePartModal">
                                                        <i class="fas fa-trash"></i>
                                                </button>

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
    </div>

    <!-- Modals add-->
    <div class="modal fade" id="createPartModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background: var(--color-accent); color: white;">
                    <h5 class="modal-title"><i class="fas fa-plus-circle"></i> Thêm Phụ Tùng Mới</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span style="color: white;">&times;</span>
                    </button>
                </div>

                <!-- Sửa lại form: Đưa action và method vào đây -->
                <form id="createPartForm" action="/MainServlet?action=savecreate" method="POST">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Tên Phụ Tùng</label>
                            <input type="text" class="form-control" name="partName" placeholder="Nhập tên phụ tùng" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá Nhập</label>
                                    <input type="number" class="form-control" name="purchasePrice" placeholder="Nhập giá nhập" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá Bán</label>
                                    <input type="number" class="form-control" name="retailPrice" placeholder="Nhập giá bán" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary" style="background: var(--color-accent);">
                            Lưu
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modals edit-->
    <div class="modal fade" id="editPartModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background: var(--color-accent); color: white;">
                    <h5 class="modal-title"><i class="fas fa-edit"></i> Chỉnh Sửa Phụ Tùng</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span style="color: white;">&times;</span>
                    </button>
                </div>
                <form id="editPartForm" action="/MainServlet?action=savepart" method="POST">
                    <div class="modal-body">
                        <input type="hidden" id="editPartId" name="partID"> <!-- Cần có name -->
                        <div class="form-group">
                            <label>Tên Phụ Tùng</label>
                            <input type="text" class="form-control" id="editPartName" name="partName">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá Nhập</label>
                                    <input type="number" class="form-control" id="editPurchasePrice" name="purchasePrice">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Giá Bán</label>
                                    <input type="number" class="form-control" id="editRetailPrice" name="retailPrice">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary" style="background: var(--color-accent);">
                            Cập nhật
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="modal fade" id="deletePartModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title"><i class="fas fa-trash"></i> Xóa Phụ Tùng</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span class="text-white">&times;</span>
                    </button>
                </div>
                <form id="deletePartForm" action="/MainServlet?action=deletepart" method="POST">
                    <div class="modal-body">
                        <input type="hidden" name="partID" id="deletePartInput">
                        <p>Bạn có chắc chắn muốn xóa phụ tùng này?</p>
                        <dl class="row">
                            <dt class="col-sm-4">Mã PT:</dt>
                            <dd class="col-sm-8" id="deletePartId"></dd>
                            <dt class="col-sm-4">Tên phụ tùng:</dt>
                            <dd class="col-sm-8" id="deletePartName"></dd>
                            <dt class="col-sm-4">Giá Nhập:</dt>
                            <dd class="col-sm-8" id="deletePurchasePrice"></dd>
                            <dt class="col-sm-4">Giá Bán:</dt>
                            <dd class="col-sm-8" id="deleteRetailPrice"></dd>
                        </dl>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-danger">Xác nhận Xóa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- /.content-wrapper -->
</div>

<!-- ./wrapper -->

<!-- jQuery, Bootstrap 4, AdminLTE & Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    $(document).ready(function () {
    // Khi modal hiển thị
    $('#editPartModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Lấy nút được bấm
            var partID = button.data('part-id'); // Lấy giá trị partID từ data-attribute

            var modal = $(this);
            modal.find('#editPartId').val(partID); // Gán giá trị vào input partID
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#deletePartModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var partID = button.data('part-id');
            var partName = button.data('part-name');
            var purchasePrice = button.data('purchase-price');
            var retailPrice = button.data('retail-price');

            var modal = $(this);
            modal.find('#deletePartId').text(partID);
            modal.find('#deletePartName').text(partName);
            modal.find('#deletePurchasePrice').text(purchasePrice + ' VNĐ');
            modal.find('#deleteRetailPrice').text(retailPrice + ' VNĐ');
            modal.find('#deletePartInput').val(partID);
        });
    });
</script>
</body>
</html>
