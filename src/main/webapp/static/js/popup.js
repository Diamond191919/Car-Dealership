function showWIPAlert(event, pageName) {
    event.preventDefault(); // Ngăn chuyển trang
    Swal.fire({
        icon: 'info',
        title: 'Thông báo',
        text: `Ui da, trang "${pageName}" này em chưa kịp làm cô ơi!`,
        confirmButtonText: 'Đóng'
    });
}