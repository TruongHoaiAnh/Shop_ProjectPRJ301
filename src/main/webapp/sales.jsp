<%-- 
    Document   : sales
    Created on : Nov 4, 2023, 12:01:39 AM
    Author     : PhucND-CE171160
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  long currentTimeMillis = System.currentTimeMillis();
    java.util.Date currentDate = new java.util.Date();
    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Component/boostrap.jsp" %>
        <link rel="website icon" href="/Component/logo/logo.jpg"/>
        <title>GOGI PUMJIL</title>

        <script src="/JS/validateForm.js"></script>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </head>
    <body>
        <%@include file="Component/header.jsp" %>
        <c:forEach items="${sessionScope.listSales}" var="o" >  
            <c:set var="sum" value="${sum + o.totalDishSum}" />
        </c:forEach>
        <c:set var="fromDate" value="${sessionScope.fromDate}" />
        <c:set var="toDate" value="${sessionScope.toDate}" />
        <section>
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <form action="/order" method="post" onsubmit="return validateForm()">
                        <h5>Doanh thu từ ngày <input type="Date" required="" name="fromDate" id="fromDate" value="${fromDate}" /> đến ngày <input type="date" required="" name="toDate" id="toDate" value="${toDate}"/>
                        </h5> 
                        <br>
                        <input type="submit" value="Enter" name="btnDate" />
                        <br>
                    </form>
                    <h2 style="font-size: 30px; font-weight: bold; margin: 10px 0;">Tổng doanh thu: ${sum}₫</h2>
                    <table id="example" class="table table-hover table-bordered" style="text-align: center" >
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Date</th>
                                <th scope="col">Dish Name</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Sum</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.listSales}" var="o" >  
                                <tr>
                                    <th scope="row">${o.orderDate}</th>
                                    <td scope="row">${o.dishName}</th>
                                    <td scope="row">${o.sumDishQuantity}</th>
                                    <td scope="row">${o.totalDishSum}₫</th> 
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
