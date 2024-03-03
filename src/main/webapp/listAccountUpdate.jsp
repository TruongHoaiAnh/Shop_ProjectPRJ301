<%-- 
    Created on : Oct 02, 2023, 4:11:25 PM
    Author     : Group_02
--%>
<%@page import="Models.Account"%>
<%@page import="java.util.ArrayList"%>
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
        <%  aDAO = new AccountDAO();
            List<Account> listCus = new ArrayList<>();
            listCus = aDAO.getAllCustomer();
            request.getSession().setAttribute("listCus", listCus);
        %>
        <section class="background-radial-gradient overflow-hidden">
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <table class="table table-hover table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Name</th>
                                <th scope="col">User Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Email</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Address</th>
                                <th scope="col">Role</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="stt" value="0"/>
                            <c:forEach items="${sessionScope.listCus}" var="cus">                                
                                <c:if test="${cus.status>0}">
                                    <c:set var="stt" value="${stt+1}"/>
                                    <tr>
                                        <th scope="row">${stt}</th>
                                        <td>${cus.name}</td>
                                        <td>${cus.userName}</td>
                                        <td>${cus.phone}</td>
                                        <td>${cus.email}</td>
                                        <td>${cus.gender}</td>
                                        <td>${cus.address}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${cus.isAdmin()}">
                                                    Admin
                                                </c:when>
                                                <c:otherwise>
                                                    Customer
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center justify-content-center">
                                                <!--<a class="btn btn-outline-primary" href="/customer/update/${cus.userName}">Update</a>-->
                                                <c:if test="${!cus.isAdmin()}">
                                                    <a onclick="return confirm('The ${cus.name}\'s account will be an ADMIN. Are you sure?');" class="btn btn-outline-primary" href="/customer/admin/${cus.userName}">Be Admin</a>
                                                </c:if>

                                                <a onclick="return confirm('The ${cus.name}\'s account will be deleted forever. Are you sure?');" class="ms-1 btn btn-outline-danger" href="/customer/delete/${cus.id}">Delete</a>
                                            </div>

                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </section>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
