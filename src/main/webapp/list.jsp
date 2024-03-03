<%-- 
    Created on : Oct 02, 2023, 4:11:25 PM
    Author     : Group_02
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <%@include file="Component/boostrap.jsp" %>
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />
        <link rel="website icon" href="/Component/logo/logo.jpg"/>
        <title>GOGI PUMJIL</title>
    </head>
    <body>

        <%@include file="Component/header.jsp" %>
        <div class="layoutPage-collection" id="template-collection" <c:if test="${sessionScope.listP.isEmpty()}">style="height: 100vh"</c:if>>
                <div class="heading-page text-center">
                    <strong><h1 id="title" style="font-size: 50px">MENU</h1></strong>
                </div>

                <div class="wrapper-collection-content">
                    <div class="collection-content-listprod">

                        <div class="container-fluid">
                            <div class="section-content-list">
                                <div class="row listProduct-row">
                                <c:forEach items="${sessionScope.listP}" var="product">
                                    <c:if test="${product.status>0}"> 
                                        <div class="col-6 col-md-6 col-lg-3 col-product-5">
                                            <div class="product-loop" style="height: 400px;" id="${product.id}">
                                                <div class="product-img">
                                                    <img alt=" GIO HEO " sizes="235px" src="${product.imgURL}" style="width: 275px;height: 183px;">
                                                </div>
                                                <div class="product-detail">
                                                    <h3 class="proloop-name">${product.name}</h3>
                                                    <div class="proloop-price">
                                                        <span>${product.price}₫</span>
                                                    </div>
                                                    <div class="proloop-action"  style="display: flex; flex-direction: column;">
                                                        <a href="/cart/add/${product.id}" style=" padding-bottom: 10px">
                                                            <button type="submit" class="btn-addcart">
                                                                <span class="ico-shopping"><i
                                                                        class="far fa-shopping-basket"></i></span>
                                                                Thêm
                                                            </button>
                                                        </a>
                                                        <c:if test="${sessionScope.role.isAdmin()}">
                                                            <a onclick="return confirm('The ${product.name} will be deleted forever. Are you sure?');" href="/product/delete/${product.id}" style=" padding-bottom: 10px">
                                                                <button class="btn-addcart">
                                                                    <span class="ico-shopping bg-danger"><i
                                                                            class="far fa-trash-alt" ></i></span>
                                                                    Xóa
                                                                </button> 
                                                            </a>

                                                            <a href="/product/updatePage/${product.id}">
                                                                <button class="btn-addcart">
                                                                    <span class="ico-shopping bg-danger"><i
                                                                            class="far fa-edit" ></i></span>
                                                                    Chỉnh sửa
                                                                </button> 
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <c:set var="add" value="${sessionScope.showAdd}" />
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
