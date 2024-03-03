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
        <section class="overflow-hidden">
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <table class="table table-hover table-bordered" style="text-align: center">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Dish Name</th>
                                <th scope="col">Dish Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Sum</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set value="${sessionScope.cart}" var="o" />
                            <c:set var="stt" value="0"/>
                            <c:forEach items="${o.items}" var="i">      
                                <c:set var="stt" value="${stt+1}"/>
                                <tr id="${i.product.id}">
                                    <th scope="row">${stt}</th>
                                    <td>${i.product.name}</td>
                                    <td><fmt:formatNumber pattern="##.##" value="${i.product.price}"/>₫</td>
                                    <td>
                                        <a href="/cart/down/${i.product.id}" class="btn btn-outline-primary">-</a>
                                        ${i.quantity}
                                        <a href="/cart/up/${i.product.id}" class="btn btn-outline-primary">+</a>
                                    </td>
                                    <td  align="right"><fmt:formatNumber pattern="##.##" value="${i.product.price*i.quantity}"/>₫</td>
                                    <td>
                                        <form action="/cart" method="post">
                                            <input type="hidden" name="id" value="${i.product.id}">
                                            <input type="submit" name="btnReturn" value="Gỡ" class="btn btn-outline-danger">
                                        </form>                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Sum</th>
                                    <c:choose>
                                        <c:when test="${o.getTotalMoney()!=null}">
                                        <td colspan="4" align="right"><fmt:formatNumber pattern="##.##" value="${o.getTotalMoney()}"/>₫</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td colspan="4" align="right"><fmt:formatNumber pattern="##.##" value="0"/>₫</td>
                                    </c:otherwise>
                                </c:choose>

                                <td>
                                    <a onclick="return confirm('Are you sure to check out?');" href="/order/checkout" class="btn btn-outline-success">
                                        Thanh Toán
                                    </a>                                    
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </section>
        <c:set var="add" value="${sessionScope.showEidtCart}" />
        <script>
            window.onload = function () {
// Lấy vị trí của div3
                var div3 = document.getElementById("${add}");
                var div3Position = div3.getBoundingClientRect();

// Cuộn trang đến vị trí của div3
                window.scrollTo({
                    top: div3Position.top - 80,
                    left: div3Position.left,
                    behavior: "smooth" // Sử dụng cuộn trơn tru
                });
            };
        </script>  
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
