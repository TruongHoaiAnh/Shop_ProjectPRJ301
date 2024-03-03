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
        <section class="overflow-hidden">
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                        <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">
                            The best offer <br />
                            <span style="color: hsl(218, 81%, 75%)">for your style</span>
                        </h1>
                        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">

                            4Shop is a clothing store that provides a wide range of trendy and fashionable apparel. 
                            With our diverse selection of clothes, you can express your unique style and stay ahead of the fashion curve. 
                            We strive to offer high-quality garments that combine comfort, style, and affordability. 
                            Whether you're looking for casual wear, formal attire, or accessories to complete your look, 4Shop has got you covered. 
                            Experience the joy of shopping for the latest fashion trends at 4Shop and elevate your wardrobe to new heights.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                        <div class="card bg-glass">
                            <div class="card-body p-4 p-md-5">
                                <form action="/customer" method="post" id="updateForm">
                                    <!-- Email input -->
                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example3">Full Name</label>
                                        <input readonly="" required name="fullname" type="text"  class="form-control" value="${sessionScope.roleToUpdate.getName()}"/>
                                    </div>

                                    <!-- Password input -->
                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example4">User Name</label>
                                        <input readonly="" required name="username" type="text" class="form-control" value="${sessionScope.roleToUpdate.getUserName()}" />
                                        <span style="color: red">${requestScope.usernameErr}</span>
                                    </div>                                  

                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example4">Phone</label>
                                        <input readonly="" required name="phone" type="tel" pattern="[0-9]{10}" class="form-control" value="${sessionScope.roleToUpdate.getPhone()}" />
                                        <span style="color: red">${requestScope.phoneErr}</span>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example3">Email</label>
                                        <input readonly="" required name="email" type="email" class="form-control" value="${sessionScope.roleToUpdate.getEmail()}" />
                                        <span style="color: red">${requestScope.emailErr}</span>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example3">Gender</label>
                                        <div style="display: flex; justify-content: space-evenly">
                                            <div>
                                                Male <input readonly="" checked="true" name="gender" type="radio" value="Male" <c:if test="${sessionScope.roleToUpdate.getGender()=='Male'}">checked</c:if>/>
                                                </div>
                                                <div>
                                                    Female <input readonly="" name="gender" type="radio" value="Female" <c:if test="${sessionScope.roleToUpdate.getGender()=='Female'}">checked</c:if>/>
                                                </div> 
                                            </div>
                                        </div>


                                        <div class="mb-4">
                                            <label class="form-label" for="form3Example3">Address</label>
                                            <input required name="address" type="text" class="form-control" value="${sessionScope.roleToUpdate.getAddress()}"/>
                                    </div>
                                    <c:if test="${sessionScope.role.isAdmin()}">
                                        <div class="mb-4">
                                            <label class="form-label" for="form3Example3">Role</label>
                                            <div style="display: flex; justify-content: space-evenly">

                                                <div>
                                                    Customer <input  checked="true" name="role" type="radio" value="False" <c:if test="${!sessionScope.roleToUpdate.isAdmin()}">checked</c:if>/>
                                                    </div> 
                                                    <div>
                                                        Admin <input name="role" type="radio" value="True"  <c:if test="${sessionScope.roleToUpdate.isAdmin()}">checked</c:if>/>
                                                    </div>
                                                </div>
                                            </div>
                                    </c:if>
                                    <!-- Submit button -->
                                    <div style="text-align: center">

                                        <input type="submit" class="btn btn-primary btn-block mb-4" name="btnUpdateAdmin" value="Update">
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>

