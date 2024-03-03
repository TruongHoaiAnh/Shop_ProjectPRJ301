<%-- 
    Document   : pieChart
    Created on : Nov 5, 2023, 11:43:22 PM
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
        <c:set var="lc" value="${sessionScope.pListChartDay}" />
        <c:set var="lm" value="${sessionScope.pListChartMonth}" />
        <c:set var="ly" value="${sessionScope.pListChartYear}" />
        <c:set var="day" value="${sessionScope.nowDay}" />
        <c:set var="year" value="${sessionScope.pyear}" />
        <c:set var="month" value="${sessionScope.pmonth}" />
        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
            <div class="row gx-lg-5 align-items-center mb-5">
                <form action="/order" method="post">
                    <h1>Biểu đồ số lượng theo
                        <select id="chartType" name="chartType" onchange="toggleInputs(this)" style="border: none;">
                            <option value="1" ${sessionScope.poption eq '1' ? 'selected' : ''}>ngày</option>
                            <option value="2" ${sessionScope.poption eq '2' ? 'selected' : ''}>tháng</option>
                            <option value="3" ${sessionScope.poption eq '3' ? 'selected' : ''}>năm</option>
                        </select>
                        <input type="Date" required="" name="day" id="day" value="${day}" />
                        <input type="number" id="yearInput" required="" name="year" min="2000" max="2300" step="1" placeholder="Year" value="${year}">
                        <input type="number" id="monthInput" required="" name="month" min="1" max="12" step="1" placeholder="Month" value="${month}">
                    </h1>
                    <input type="submit" value="Enter" name="btnPieChart"/>
                </form>
                <div>
                    <canvas id="pieChart"></canvas>
                </div>
                <script>
                    function generateDynamicColors(numColors) {
                        var colors = [];
                        for (var i = 0; i < numColors; i++) {
                            // Generate a random color using RGB values
                            var color = 'rgb(' + Math.floor(Math.random() * 256) + ',' + Math.floor(Math.random() * 256) + ',' + Math.floor(Math.random() * 256) + ')';
                            colors.push(color);
                        }
                        return colors;
                    }
                    document.addEventListener("DOMContentLoaded", function () {
                        // Lấy phần tử select
                        var chartTypeSelect = document.getElementById("chartType");
                        var ctx = document.getElementById('pieChart').getContext('2d');
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
                            data.push('${chartDay.name}');
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
                            data.push('${chartMonth.name}');
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
                            data.push('${chartYear.name}');
                            total.push('${chartYear.total}');
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                        }
                        console.log("Data: ", data);
                        console.log("Total: ", total);
                        // Lấy tham số dữ liệu cho biểu đồ tròn
                        var pieData = {
                            labels: data,
                            datasets: [{
                                    data: total,
                                    backgroundColor: generateDynamicColors(data.length)
                                }]
                        };
                        var pieChart = new Chart(ctx, {
                            type: 'pie',
                            data: pieData,
                            options: {
                                responsive: true,
                                maintainAspectRatio: false
                            }
                        });
                        toggleInputs(chartTypeSelect);
                    });
                    function toggleInputs(selectElement) {
                        var chartType = selectElement.value;
                        var day = document.getElementById('day');
                        var yearInput = document.getElementById('yearInput');
                        var monthInput = document.getElementById('monthInput');

                        if (chartType === '1') {
                            day.style.display = 'inline';
                            yearInput.style.display = 'none';
                            monthInput.style.display = 'none';
                        } else if (chartType === '2') {
                            day.style.display = 'none';
                            yearInput.style.display = 'inline';
                            monthInput.style.display = 'inline';
                        } else if (chartType === '3') {
                            day.style.display = 'none';
                            yearInput.style.display = 'none';
                            monthInput.style.display = 'none';
                        }
                    }
                </script>
            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
