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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>GOGI PUMJIL</title>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />
        <%@include file="Component/boostrap.jsp" %>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css"
              rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            body {
                background-color: #dee9ff;
            }

            .registration-form {
                padding: 50px 0;
            }

            .registration-form form {
                background-color: #fff;
                max-width: 600px;
                margin: auto;
                padding: 50px 70px;
                border-top-left-radius: 30px;
                border-top-right-radius: 30px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            }

            .registration-form .form-icon {
                text-align: center;
                background-color: #5891ff;
                border-radius: 50%;
                font-size: 40px;
                color: white;
                width: 100px;
                height: 100px;
                margin: auto;
                margin-bottom: 50px;
                line-height: 100px;
            }

            .registration-form .item {
                border-radius: 20px;
                margin-bottom: 25px;
                padding: 10px 20px;
            }

            .registration-form .create-account {
                border-radius: 30px;
                padding: 10px 20px;
                font-size: 18px;
                font-weight: bold;
                background-color: #5791ff;
                border: none;
                color: white;
                margin-top: 20px;
            }

            .registration-form .social-media {
                max-width: 600px;
                background-color: #fff;
                margin: auto;
                padding: 35px 0;
                text-align: center;
                border-bottom-left-radius: 30px;
                border-bottom-right-radius: 30px;
                color: #9fadca;
                border-top: 1px solid #dee9ff;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            }

            .registration-form .social-icons {
                margin-top: 30px;
                margin-bottom: 16px;
            }

            .registration-form .social-icons a {
                font-size: 23px;
                margin: 0 3px;
                color: #5691ff;
                border: 1px solid;
                border-radius: 50%;
                width: 45px;
                display: inline-block;
                height: 45px;
                text-align: center;
                background-color: #fff;
                line-height: 45px;
            }

            .registration-form .social-icons a:hover {
                text-decoration: none;
                opacity: 0.6;
            }

            @media (max-width: 576px) {
                .registration-form form {
                    padding: 50px 20px;
                }

                .registration-form .form-icon {
                    width: 70px;
                    height: 70px;
                    font-size: 30px;
                    line-height: 70px;
                }
            }
        </style>
        
    </head>

    <body>
        <%@include file="Component/header.jsp" %>

        <div class="registration-form">
            <form action="/customer" method="post">
                <div class="form-icon">
                    <span><i class="icon icon-user"></i></span>
                </div>
                <div class="form-group">
                    <label for="fullname">Fullname: </label>
                    <input required="" name="fullname" type="text" class="form-control item" id="fullname" placeholder="Fullname" value="${sessionScope.roleToUpdate.getName()}"> 
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <span style="color: red">${requestScope.usernameErr}</span>
                    <input required="" name="username" type="text" class="form-control item" id="username" placeholder="Username" value="${sessionScope.roleToUpdate.getUserName()}">
                </div>
                <div class="form-group">
                    <label >Phone Number:</label>
                    <span style="color: red">${requestScope.phoneErr}</span>
                    <input required="" name="phone" type="tel" pattern="[0-9]{10}" class="form-control item"  placeholder="Phone Number" value="${sessionScope.roleToUpdate.getPhone()}">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <span style="color: red">${requestScope.emailErr}</span>
                    <input required="" name="email" type="email" class="form-control item" id="email" placeholder="Email" value="${sessionScope.roleToUpdate.getEmail()}">

                </div>

                <div class="form-group">
                    <label class="form-label" for="form3Example3">Gender</label>
                    <div style="display: flex; justify-content: space-evenly">
                        <div>
                            <label style="cursor: pointer;" for="male">Male</label>
                            <input id="male" checked="true" name="gender" type="radio" value="Male" <c:if test="${sessionScope.roleToUpdate.getGender()=='Male'}">checked</c:if>/>
                            </div>

                            <div>
                                <label style="cursor: pointer;" for="female">Female</label>
                                <input id="female" name="gender" type="radio" value="Female" <c:if test="${sessionScope.roleToUpdate.getGender()=='Female'}">checked</c:if>/>
                            </div> 
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input required="" name="address" type="text" class="form-control item" id="text" placeholder="Address" value="${sessionScope.roleToUpdate.getAddress()}">
                </div>

                <c:if test="${sessionScope.role.isAdmin()}">
                    <div class="mb-4">
                        <label class="form-label" for="form3Example3">Role</label>
                        <div style="display: flex; justify-content: space-evenly">

                            <div>
                                <label style="cursor: pointer;" for="customer">Customer</label>
                                <input id="customer"  checked="true" name="role" type="radio" value="False" <c:if test="${!sessionScope.roleToUpdate.isAdmin()}">checked</c:if>/>
                                </div> 
                                <div>
                                    <label style="cursor: pointer;" for="admin">Admin</label>
                                    <input id="admin" name="role" type="radio" value="True"  <c:if test="${sessionScope.roleToUpdate.isAdmin()}">checked</c:if>/>
                                </div> 
                            </div>
                        </div>
                </c:if>

                <div class="form-group">
                    <label for="old_password">Old Password:</label>
                    <span style="color: red">${requestScope.passwordErr}</span>
                    <input required="" name="oldPassword" type="password" class="form-control item" id="old_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                </div>
                <div class="form-group">
                    <label for="new_password">New Password:</label>
                    <span style="color: red">${requestScope.passErrExit}</span>
                    <input name="new_password" type="password" class="form-control item" id="new_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                </div>
                <div class="form-group">
                    <label for="comfirm_password">Confirm Password:</label>
                    <span style="color: red">${requestScope.passErrRepeat}</span>
                    <input name="comfirm_password" type="password" class="form-control item" id="comfirm_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-block create-account" name="btnUpdate" value="Update">
                </div>
            </form>
            <div class="social-media">
                <!-- <h5>Sign up with social media</h5>
                <div class="social-icons">
                    <a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
                    <a href="#"><i class="icon-social-google" title="Google"></i></a>
                    <a href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
                </div> -->
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#birth-date').mask('00/00/0000');
                $('#phone-number').mask('0000-0000');
            })
        </script>
    </body>

</html>


<%@include file="Component/footer.jsp" %>
</body>
</html>

