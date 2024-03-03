<%@page import="Models.Account"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.Dish"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.DishDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%  DishDAO dDAO = new DishDAO();
    List<String> listType = dDAO.listType();
    request.getSession().setAttribute("listType", listType); //hien ra cac loai san pham
    List<Dish> listCake = dDAO.listCake();
//    List<String> listDish = dDAO.getAllProduct();

    request.getSession().setAttribute("listCake", listCake); //combo o trang index
%>
<%
    Cookie[] cookies = request.getCookies();
    AccountDAO aDAO = new AccountDAO();
    if (cookies != null) {
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("customer")) {
                Account cus = aDAO.getCus(cooky.getValue());
                request.getSession().setAttribute("role", cus);
                break;
            }
        }
    }
%>
<style>
    li{
        margin: 10px;
    }
    .custom-toggler ,.navbar-toggler-icon {
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0,0,0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E") !important;
        a{
            text-decoration: none;
        }
    }
</style>
<c:set var="size" value="${sessionScope.size}"></c:set>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="position: fixed; top: 0; width:100%;  z-index: 100000; background-color: white;">
        <div class="container-fluid">
            <a class="text-body" href="/product/home">
                <img src="/Component/logo/logo.jpg" alt="" width="60" height="60">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <li class="nav-item dropdown">
                        <a class="text-body dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dish
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach items="${sessionScope.listType}" var="type">
                            <li><a class="dropdown-item" href="/product/type/${type}">${type}</a></li>
                            </c:forEach>
                        <!--<li><a class="dropdown-item" href="/cart/list">Cart</a></li>-->
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="text-body" href="/customer/list">Menu</a>
                </li>

                <c:if test="${sessionScope.role!=null}">
                    <li class="nav-item dropdown">
                        <a class="text-body dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Account
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <c:choose>
                                <c:when test="${sessionScope.role.isAdmin()}"> <!-- neu la admin thi duoc update tat ca khach hang -->
                                    <li><a class="dropdown-item" href="/customer/updateAccount">Update Customer</a></li>
                                    </c:when>
                                    <c:otherwise> <!-- khong phai admin chi duoc update thong tin ca nhan -->
                                    <li><a class="dropdown-item" href="/customer/update">Update</a></li>
                                    </c:otherwise>
                                </c:choose>


                            <li><a onclick="return confirm('This ${sessionScope.role.getName()}\'s account will be deleted forever. Are you sure?');" class="dropdown-item text-danger" href="/customer/delete">Remove/Delete</a></li>
                        </ul>
                    </li>
                </c:if>

                <c:if test="${sessionScope.role.isAdmin()}"> <!-- neu la admin thi duoc crud san pham -->
                    <li class="nav-item dropdown">
                        <a class="text-body dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Manage
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!--add new product button-->
                            <li><a class="dropdown-item" href="/product/addnew">Add New</a></li>
                        </ul>
                    </li>
                </c:if>

                <c:choose>
                    <c:when test="${sessionScope.role.isAdmin()}">
                        <li class="nav-item">
                            <a class="text-body" href="/order/allList">Order</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="/order/list" style="color: black; padding: 0">Order</a>
                        </li>
                    </c:otherwise>
                </c:choose>  
                <c:choose>
                    <c:when test="${sessionScope.role.isAdmin()}">


                        <li class="nav-item dropdown">
                            <a class="text-body dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Sales
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <li><a class="dropdown-item" href="/order/sales">Bảng</a></li>
                                <li><a class="dropdown-item" href="/order/sales/chart">Biểu đồ cột</a></li>
                                <li><a class="dropdown-item" href="/order/sales/pieChart">Biểu đồ tròn</a></li>

                            </ul>
                        </li>

                    </c:when>
                </c:choose>  

            </ul>
            <form style="border: solid black 1px; width: 150px; height: 40px" class="d-flex flex-grow-1 mt-1" action="/product" method="post">
                <!--input to search-->
                <input class="flex-grow-1 me-1 px-1" style="border:0px; background: var(--Secondary, #F5F5F5);
                       display: flex;
                       padding: 7px 12px 7px 20px;
                       flex-direction: column;
                       justify-content: center;
                       align-items: center;
                       gap: 10px;" name="txtSearch" class="form-control me-1" type="search" placeholder="Search" aria-label="Search" <c:if test="${oldSearch!=null}">value="${oldSearch}" </c:if>>


                       <!--search button-->
                       <!--<input name="btnSearch" class="btn btn-outline-success me-1" type="submit" value="Search">-->
                       <button style="border: 0px;" title="Search" type="submit" name="btnSearch" value="Search" class="btn btn-outline-success me-1 d-flex align-items-center justify-content-center">
                           <ion-icon name="search-outline"></ion-icon>
                       </button>
                </form>
                <!--cart-->
                <div class="d-flex mt-1">
                    <a href="/cart/list" class="px-1 d-flex align-items-center justify-content-center me-1">
                        <div class="d-flex align-items-center justify-content-center">
                            <ion-icon name="cart-outline"  ></ion-icon>
                        </div>
                        <div class="flex-grow-1">
                        <c:if test="${requestScope.size!= 0}">
                            ${size}
                        </c:if>

                    </div>      

                </a>
                <c:if test="${sessionScope.role!=null}">  <!-- neu dang nhap roi thi duoc log out va cac chuc nang khac -->


                    <!--cart button-->

                    <!--update profile button-->
                    <a href="/customer/update" class="btn btn-outline-info d-flex align-items-center justify-content-center me-1" style="width: 10rem;">
                        <div class="d-flex align-items-center justify-content-center">
                            <ion-icon name="person-circle-outline"></ion-icon>
                        </div>
                        <div class="flex-grow-1">${sessionScope.role.getName()}</div>                       
                    </a>
                    <!--log out button-->
                    <a href="/customer/logout" class="btn btn-outline-danger d-flex align-items-center justify-content-center" style="width: 10rem;">                        
                        <div class="d-flex align-items-center justify-content-center">
                            <ion-icon name="log-out-outline" ></ion-icon>
                        </div>
                        <div class="flex-grow-1">Log Out</div> 
                    </a>



                </c:if>
                <!--login-->
                <c:if test="${sessionScope.role==null}">
                    <a href="/customer/login" class="btn btn-outline-primary d-flex align-items-center justify-content-center" style="width: 10rem;">                   
                        <div class="d-flex align-items-center justify-content-center">
                            <ion-icon name="log-in-outline"></ion-icon>
                        </div>
                        <div class="flex-grow-1">Log In</div> 
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <hr>
</nav>
<!--Do cao cua menu-->
<div style="height: 86px"></div> 
