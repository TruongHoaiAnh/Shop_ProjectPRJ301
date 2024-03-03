<%-- 
    Document   : chart
    Created on : Nov 5, 2023, 1:40:15 PM
    Author     : PhucND-CE171160
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Component/boostrap.jsp" %>
        <link rel="website icon" href="/Component/logo/logo.jpg"/>
        <title>GOGI PUMJIL</title>
        <script src="/JS/chart.js"></script>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />
    </head>
    <body>
        <%@include file="Component/header.jsp" %>
        <c:set var="lc" value="${sessionScope.listChartDay}" />
        <c:set var="lm" value="${sessionScope.listChartMonth}" />
        <c:set var="ly" value="${sessionScope.listChartYear}" />
        <c:set var="year" value="${sessionScope.year}" />
        <c:set var="month" value="${sessionScope.month}" />
        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
            <div class="row gx-lg-5 align-items-center mb-5">
                <form action="/order" method="post">
                    <h1>Biểu đồ doanh thu theo
                        <select id="chartType" name="chartType" onchange="toggleInputs(this)" style="border: none;">
                            <option value="1" ${sessionScope.option eq '1' ? 'selected' : ''}>ngày</option>
                            <option value="2" ${sessionScope.option eq '2' ? 'selected' : ''}>tháng</option>
                            <option value="3" ${sessionScope.option eq '3' ? 'selected' : ''}>năm</option>
                        </select>
                        <input type="number" id="yearInput" required="" name="year" min="2000" max="2300" step="1" placeholder="Year" value="${year}">
                        <input type="number" id="monthInput" required="" name="month" min="1" max="12" step="1" placeholder="Month" value="${month}">
                    </h1>
                    <input type="submit" value="Enter" name="btnChart"/>
                </form>
                <div>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy phần tử select
                var chartTypeSelect = document.getElementById("chartType");
                var ctx = document.getElementById('revenueChart').getContext('2d');
                // Chuyển dữ liệu từ danh sách listChartDay thành mảng JavaScript
                var data = [];
                var total = [];
                var chartType = chartTypeSelect.value;
                if (chartType === '1') {
            <c:choose>
                <c:when test="${empty lc}">
                    alert('Dữ liệu không tồn tại');
                </c:when>
                <c:otherwise>
                    <c:forEach items="${lc}" var="chartDay">
                    data.push('${chartDay.day}');
                    total.push('${chartDay.total}');
                    </c:forEach>
                </c:otherwise>
            </c:choose>
                } else if (chartType === '2') {
            <c:choose>
                <c:when test="${empty lm}">
                    alert('Dữ liệu không tồn tại');
                </c:when>
                <c:otherwise>
                    <c:forEach items="${lm}" var="chartMonth">
                    data.push('${chartMonth.month}');
                    total.push('${chartMonth.total}');
                    </c:forEach>
                </c:otherwise>
            </c:choose>
                } else if (chartType === '3') {
            <c:choose>
                <c:when test="${empty ly}">
                    alert('Dữ liệu không tồn tại');
                </c:when>
                <c:otherwise>
                    <c:forEach items="${ly}" var="chartYear">
                    data.push('${chartYear.year}');
                    total.push('${chartYear.total}');
                    </c:forEach>
                </c:otherwise>
            </c:choose>
                }
                var chart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data, // Sử dụng mảng day
                        datasets: [{
                                label: 'Doanh thu',
                                data: total, // Sử dụng mảng total
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
                // Gọi hàm toggleInputs để xử lý trạng thái ban đầu
                toggleInputs(chartTypeSelect);

            });

            function toggleInputs(selectElement) {
                var chartType = selectElement.value;
                var yearInput = document.getElementById('yearInput');
                var monthInput = document.getElementById('monthInput');

                if (chartType === '1') {
                    yearInput.style.display = 'inline';
                    monthInput.style.display = 'inline';
                } else if (chartType === '2') {
                    yearInput.style.display = 'inline';
                    monthInput.style.display = 'none';
                } else if (chartType === '3') {
                    yearInput.style.display = 'none';
                    monthInput.style.display = 'none';
                }
            }
        </script>

        <%@include file="Component/footer.jsp" %>
    </body>
</html>
