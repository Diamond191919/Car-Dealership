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
                    <div class="col-sm-8">
                        <h1><i class="fas fa-wrench"></i> Cập Nhật Phiếu Dịch Vụ Cho Kỹ Thuật Viên
                            <span class="badge-custom badge">Cập nhật</span>
                        </h1>
                    </div>
                    <div class="col-sm-4 text-right">
                        <!-- Breadcrumb tùy chọn -->
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Dịch vụ</a></li>
                            <li class="breadcrumb-item active">Cập Nhật Phiếu Dịch Vụ</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Row chính chia 2 cột: trái form, phải optional -->
                <div class="row">
                    <!-- Cột trái: Form tạo phiếu dịch vụ -->
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">
                                    <i class="fas fa-info-circle"></i> Thông Tin Phiếu Dịch Vụ #10111231
                                </h3>
                            </div>
                            <form id="createServiceTicketForm">
                                <div class="card-body">
                                    <div class="row">
                                        <!-- Thông tin chung -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ticketID">Mã Phiếu Dịch Vụ</label>
                                                <select class="form-control" id="ticketID">
                                                    <!-- Option mô tả, không cho chọn -->
                                                    <option value="" disabled selected hidden>-- Chọn phiếu --
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="serviceID">Mã Dịch Vụ</label>
                                                <select class="form-control" id="serviceID">
                                                    <!-- Option mô tả, không cho chọn -->
                                                    <option value="" disabled selected hidden>-- Chọn dịch vụ --
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="mechanicID">Mã Kỹ Thuật Viên</label>
                                                <select class="form-control" id="mechanicID">
                                                    <option value="" disabled selected hidden>-- Chọn kỹ thuật viên
                                                        --</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Thông tin giờ làm và giá tiền -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="hours">Số Giờ Làm Việc</label>
                                                <input type="number" class="form-control" id="hours" step="0.5"
                                                       min="0" placeholder="Ví dụ: 2.5">
                                            </div>
                                            <div class="form-group">
                                                <label for="rate">Giá Tiền</label>
                                                <input type="number" class="form-control" id="rate"
                                                       placeholder="Nhập số tiền (VND)">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Ghi chú -->
                                    <div class="form-group">
                                        <label for="comment">Ghi Chú</label>
                                        <textarea class="form-control" id="comment" rows="3"
                                                  placeholder="Nhập ghi chú..."></textarea>
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <button type="button" class="btn btn-custom-cancel mr-2"
                                            onclick="window.history.back()">Hủy</button>
                                    <button type="submit" class="btn btn-custom-submit">
                                        <i class="fas fa-save"></i> Cập nhật
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Cột phải: có thể dành cho Hướng dẫn / Ghi chú / Thông tin khác -->
                    <div class="col-md-4">
                        <!-- Card Hướng dẫn hoặc Gợi ý -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"><i class="fas fa-lightbulb"></i> Hướng Dẫn</h3>
                            </div>
                            <div class="card-body">
                                <p>- Điền đầy đủ thông tin dịch vụ và kỹ thuật viên.</p>
                                <p>- Giờ làm việc (Hours) có thể nhập số thập phân (ví dụ 2.5).</p>
                                <p>- Nhập Giá Tiền tương ứng cho công việc.</p>
                                <p>- Nhấn “Tạo Phiếu” để hoàn thành.</p>
                            </div>
                        </div>

                        <!-- Card Thông tin bổ sung, ví dụ: Biểu phí, Liên hệ,... -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"><i class="fas fa-info-circle"></i> Thông Tin Bổ Sung</h3>
                            </div>
                            <div class="card-body">
                                <ul>
                                    <li>Biểu phí dịch vụ có thể thay đổi.</li>
                                    <li>Liên hệ hotline: 1900-xxxx để biết thêm chi tiết.</li>
                                    <li>Hoặc truy cập website chính thức của chúng tôi.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.row -->
            </div> <!-- /.container-fluid -->
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
<!-- Xử lý form tạo phiếu dịch vụ -->
<!-- Select2 JS -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#createServiceTicketForm').on('submit', function (e) {
            e.preventDefault();

            // Lấy dữ liệu
            const ticketID = $('#ticketID').val();
            const serviceID = $('#serviceID').val();
            const mechanicID = $('#mechanicID').val();
            const hours = $('#hours').val();
            const rate = $('#rate').val();
            const comment = $('#comment').val();

            // Giả lập gửi dữ liệu lên server (hoặc gọi AJAX)
            console.log("Tạo phiếu dịch vụ:", {
                ticketID,
                serviceID,
                mechanicID,
                hours,
                rate,
                comment
            });

            // Thông báo thành công
            alert('Phiếu dịch vụ ' + ticketID + ' đã được tạo thành công!');
            // Hoặc dùng Swal.fire(...)
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('#ticketID').select2({
            theme: 'bootstrap4',
            placeholder: 'Chọn hoặc tìm ticketID...',
            ajax: {
                url: '/api/mechanics',
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return { search: params.term };
                },
                processResults: function (data) {
                    // data dạng [{ mechanicID: 'M001', mechanicName: 'Nguyễn Văn A' }, ...]
                    return {
                        results: data.map(item => {
                            return {
                                id: item.mechanicID,
                                text: item.mechanicID + ' - ' + item.mechanicName
                            };
                        })
                    };
                }
            }
        });

        // Khởi tạo Select2 cho Service ID
        $('#serviceID').select2({
            theme: 'bootstrap4',       // Chọn theme bootstrap4 nếu đã import
            placeholder: 'Chọn hoặc tìm Service ID...',
            ajax: {
                url: '/api/services',    // Đường dẫn API trả về danh sách service
                dataType: 'json',
                delay: 250,              // Trì hoãn 250ms sau khi gõ
                data: function (params) {
                    // params.term là giá trị chuỗi tìm kiếm
                    return {
                        search: params.term  // gửi lên server
                    };
                },
                processResults: function (data) {
                    // data là mảng JSON trả về từ server, ví dụ:
                    // [{ serviceID: 'S001', serviceName: 'Thay nhớt' }, ...]
                    return {
                        results: data.map(item => {
                            return {
                                id: item.serviceID,
                                text: item.serviceID + ' - ' + item.serviceName
                            };
                        })
                    };
                }
            }
        });

        // Khởi tạo Select2 cho Mechanic ID
        $('#mechanicID').select2({
            theme: 'bootstrap4',
            placeholder: 'Chọn hoặc tìm Mechanic ID...',
            ajax: {
                url: '/api/mechanics',   // Đường dẫn API trả về danh sách mechanics
                dataType: 'json',
                delay: 250,
                data: function (params) {
                    return { search: params.term };
                },
                processResults: function (data) {
                    // data dạng [{ mechanicID: 'M001', mechanicName: 'Nguyễn Văn A' }, ...]
                    return {
                        results: data.map(item => {
                            return {
                                id: item.mechanicID,
                                text: item.mechanicID + ' - ' + item.mechanicName
                            };
                        })
                    };
                }
            }
        });
    });
</script>
</body>
</html>
