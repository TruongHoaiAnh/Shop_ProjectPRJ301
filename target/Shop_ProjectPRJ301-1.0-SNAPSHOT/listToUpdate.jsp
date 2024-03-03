<%-- 
    Created on : Oct 02, 2023, 4:11:25 PM
    Author     : Group_02
--%>
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
        <div class="layoutPage-collection" id="template-collection" <c:if test="${sessionScope.listP.isEmpty()}">style="height: 100vh"</c:if>>
                <div class="heading-page text-center">
                    <h1 id="title">Tất cả sản phẩm</h1>
                </div>

                <div class="wrapper-collection-content">
                    <div class="collection-content-listprod">

                        <div class="container-fluid">
                            <div class="section-content-list">
                                <div class="row listProduct-row">
                                <c:forEach items="${sessionScope.listP}" var="product">
                                    <div class="col-6 col-md-6 col-lg-3 col-product-5">
                                        <div class="product-loop" style="height: 360px;">
                                            <div class="product-img">
                                                <img alt=" GIO HEO " sizes="235px" src="${product.imgURL}" style="width: 275px;height: 183px;">
                                            </div>
                                            <div class="product-detail">
                                                <h3 class="proloop-name">${product.name}</h3>
                                                <div class="proloop-price">
                                                    <span>${product.price} VND</span>
                                                </div>
                                                <div class="proloop-action">
                                                    <a href="/cart/add/${product.id}">
                                                        <button type="submit" class="btn-addcart">
                                                            <span class="ico-shopping"><i
                                                                    class="far fa-shopping-basket"></i></span>
                                                            Thêm
                                                        </button>
                                                    </a>
                                                    <c:if test="${sessionScope.role.isAdmin()}">
                                                        <a onclick="return confirm('The ${product.name} will be deleted forever. Are you sure?');" href="/product/delete/${product.id}">
                                                            <button class="btn-addcart">
                                                                <span class="ico-shopping bg-danger"><i
                                                                        class="far fa-trash-alt" ></i></span>
                                                                Xóa
                                                            </button> 
                                                        </a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
