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
    </head>
    <body>
        <%@include file="Component/header.jsp" %>
        <section class="overflow-hidden" style="height: 1000px">
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <table class="table table-hover table-bordered" style="text-align: center">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Dish Name</th>
                                <th scope="col">Dish Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Sum</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.listDetail}" var="o">                                
                                <tr>
                                    <th scope="row">${sessionScope.orderID}</th>
                                    
                                    <td>${o.product.name}</td>
                                    <td>${o.product.price}₫</td>
                                    <td>
                                        ${o.quantity}
                                    </td>
                                    <td><fmt:formatNumber pattern="##.##" value="${o.price}"/>₫</td>
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
