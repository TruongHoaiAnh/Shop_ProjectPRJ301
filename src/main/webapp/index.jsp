<%-- 
    Created on : Oct 02, 2023, 4:11:25 PM
    Author     : Group_02
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Component/boostrap.jsp" %>
        <link rel="website icon" href="/Component/logo/logo.jpg"/>
        <title>GOGI PUMJIL</title>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />
    </head>
    <body>        
        <%@include file="Component/header.jsp" %>

        <div class="container-fluid px-0">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a  href="/product/list">
                            <img src="/images/background1.jpg" class="d-block w-100 h-50" alt="..." style="object-fit: contain">
                        </a>
                    </div>
                    <div   class="carousel-item">
                        <a href="/cart/add/26">
                            <img src="/images/background2.jpg" class="d-block w-100 h-50" alt="...">
                        </a>

                    </div>
                    <div  class="carousel-item">
                        <a href="/cart/add/28">
                            <img src="/images/background3.jpg" class="d-block w-100 h-50" alt="...">
                        </a>

                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start">
                <div class="row align-items-center">
                    <div class="position-relative"  style=" width: 100%;">

                        <div class="card bg-glass mb-6">
                            <div class="card-header">
                                <h1 class="mb-1" style="font-size: 50px;">Bánh ngọt hương vị khó quên</h1>
                            </div>
                            <div class="card-body px-4 py-5 px-md-5">
                                <div class="row">

                                    <c:forEach items="${listCake}" var="listCake">
                                        <c:if test="${listCake.status>0}">
                                            <div class="col-6 col-md-6 col-lg-3 col-product-5" style=" width: 1000px;">
                                                <div class="product-loop">
                                                    <div class="product-img">
                                                        <img alt=" GIO HEO " sizes="235px" src="${listCake.imgURL}"  style="width: 260px; height: 183px;">
                                                    </div>
                                                    <div class="product-detail">
                                                        <h3 class="proloop-name">${listCake.name}</h3>
                                                        <div class="proloop-price ">
                                                            <span><p><del style="color: red">${listCake.price+5000}₫</del><br><strong>${listCake.price}₫ </strong></p></span>
                                                        </div>
                                                        <div class="proloop-action" style="display: flex">
                                                            <a href="/cart/add/${listCake.id}">
                                                                <button type="submit" class="btn-addcart">
                                                                    <span class="ico-shopping"><i
                                                                            class="far fa-shopping-basket"></i></span>
                                                                    Thêm
                                                                </button>
                                                            </a>
                                                            <c:if test="${sessionScope.role.isAdmin()}">
                                                                <a onclick="return confirm('The ${listCake.name} will be deleted forever. Are you sure?');" href="/product/delete/${listCake.id}">
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
                                        </c:if>
                                    </c:forEach>




                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <%@include file="Component/footer.jsp" %>
    </body>
</html>
