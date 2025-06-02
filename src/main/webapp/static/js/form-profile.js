$(document).ready(function () {
    // Submit form
    $('#profileForm').on('submit', function (e) {
        e.preventDefault();

        // Kiểm tra mật khẩu hiện tại (trong thực tế sẽ kiểm tra với server)
        if ($('#current-password').val() === '') {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Vui lòng nhập mật khẩu hiện tại để xác nhận thay đổi!'
            });
            return;
        }

        // Kiểm tra mật khẩu mới và xác nhận mật khẩu
        if ($('#new-password').val() !== '' && $('#new-password').val() !== $('#confirm-password').val()) {
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Mật khẩu mới và xác nhận mật khẩu không khớp!'
            });
            return;
        }

        // Giả lập gửi dữ liệu lên server
        Swal.fire({
            icon: 'success',
            title: 'Thành công',
            text: 'Thông tin cá nhân đã được cập nhật!',
            confirmButtonColor: '#FF7A00'
        }).then((result) => {
            if (result.isConfirmed) {
                // Có thể chuyển hướng về trang profile hoặc trang khác
                // window.location.href = '/profile';
            }
        });
    });

    // Nút Cancel
    $('.btn-cancel').on('click', function () {
        // Có thể quay lại trang trước hoặc tải lại form
        window.history.back();
    });
});