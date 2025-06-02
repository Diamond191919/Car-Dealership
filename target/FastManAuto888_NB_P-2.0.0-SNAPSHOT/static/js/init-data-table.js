$(document).ready(function () {
    $('#serviceTicketsTable').DataTable({
        paging: false,
        lengthChange: false,
        searching: false,
        ordering: true,
        info: true,
        autoWidth: false,
        responsive: true
    });
});