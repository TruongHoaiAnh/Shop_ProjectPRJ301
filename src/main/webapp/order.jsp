<%-- 
    Created on : Oct 02, 2023, 4:11:25 PM
    Author     : Group_02
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="website icon" href="/Component/logo/logo.jpg"/>
        <title>GOGI PUMJIL</title>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />
        <%@include file="Component/boostrap.jsp" %>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </head>
    <body>
        <nav>
            <%@include file="Component/header.jsp" %>
        </nav>
        <main>
            <section>
                <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                    <div class="row gx-lg-5 align-items-center mb-5">
                        <table id="example" class="table table-hover table-bordered" style="text-align: center">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.listOrd}" var="o">                                
                                    <tr>
                                        <th scope="row">${o.orderID}</th>
                                        <td scope="row">${o.getCustomerName()}</th>
                                        <td  align="right"><fmt:formatNumber pattern="##.##" value="${o.total}"/>₫</td>
                                        <td>${o.date}</td>
                                        <td>
                                            <a href="/order/detail/${o.orderID}" class="btn btn-outline-info">More</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>

        <%@include file="Component/footer.jsp" %>
    </body>
</html>
