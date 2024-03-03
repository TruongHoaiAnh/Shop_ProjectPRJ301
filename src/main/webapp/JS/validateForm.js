/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validateForm() {
    var fromDateInput = document.getElementById('fromDate').value;
    var toDateInput = document.getElementById('toDate').value;

    var fromDate = new Date(fromDateInput);
    var toDate = new Date(toDateInput);

    if (fromDate > toDate) {
        alert('Ngày bắt đầu phải nhỏ hơn ngày kết thúc.');
        return false; // Ngăn biểu mẫu gửi đi nếu điều kiện không được thỏa mãn
    }

    return true; // Cho phép biểu mẫu gửi đi nếu điều kiện được thỏa mãn
}
function validateFormAdd() {
    var upFile = document.getElementById("fileInput").value;
    var fileExtension = upFile.split('.').pop().toLowerCase();
    if (fileExtension !== "png" && fileExtension !== "jpg" && fileExtension !== "jpeg" && upFile !== "") {
        alert("Please select a PNG, JPG or JPEG file.");
        return false;
    }
    return true;
}
