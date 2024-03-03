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
        <%@include file="Component/boostrap.jsp" %>
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <style type="text/css">
            body {
                padding-top: 90px;
            }
            .panel-login {
                border-color: #ccc;
                -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
                -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
                box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            }
            .panel-login>.panel-heading {
                color: #00415d;
                background-color: #fff;
                border-color: #fff;
                text-align:center;
            }
            .panel-login>.panel-heading a{
                text-decoration: none;
                color: #666;
                font-weight: bold;
                font-size: 15px;
                -webkit-transition: all 0.1s linear;
                -moz-transition: all 0.1s linear;
                transition: all 0.1s linear;
            }
            .panel-login>.panel-heading a.active{
                color: #029f5b;
                font-size: 18px;
            }
            .panel-login>.panel-heading hr{
                margin-top: 10px;
                margin-bottom: 0px;
                clear: both;
                border: 0;
                height: 1px;
                background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
                background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            }
            .panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
                height: 45px;
                border: 1px solid #ddd;
                font-size: 16px;
                -webkit-transition: all 0.1s linear;
                -moz-transition: all 0.1s linear;
                transition: all 0.1s linear;
            }
            .panel-login input:hover,
            .panel-login input:focus {
                outline:none;
                -webkit-box-shadow: none;
                -moz-box-shadow: none;
                box-shadow: none;
                border-color: #ccc;
            }
            .btn-login {
                background-color: #59B2E0;
                outline: none;
                color: #fff;
                font-size: 14px;
                height: auto;
                font-weight: normal;
                padding: 14px 0;
                text-transform: uppercase;
                border-color: #59B2E6;
            }
            .btn-login:hover,
            .btn-login:focus {
                color: #fff;
                background-color: #53A3CD;
                border-color: #53A3CD;
            }
            .forgot-password {
                text-decoration: underline;
                color: #888;
            }
            .forgot-password:hover,
            .forgot-password:focus {
                text-decoration: underline;
                color: #666;
            }

            .btn-register {
                background-color: #1CB94E;
                outline: none;
                color: #fff;
                font-size: 14px;
                height: auto;
                font-weight: normal;
                padding: 14px 0;
                text-transform: uppercase;
                border-color: #1CB94A;
            }
            .btn-register:hover,
            .btn-register:focus {
                color: #fff;
                background-color: #1CA347;
                border-color: #1CA347;
            }

            /*show pass*/
            .field-icon {
                float: right;
                margin-left: -25px;
                margin-top: -25px;
                position: relative;
                z-index: 2;
            }
            
            .toggle-password{
                margin-right: 8px;
                }


        </style>
    </head>
    <body>
        <div class="container">

            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active" id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body"> 
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="/customer" method="post" role="form" style="display: block;">
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${loginErr}</span>
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${signupErr}</span>
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: #1CB94A">${signupSuccess}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password" >
                                            <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember" value="me">
                                            <label for="remember"> Remember Me</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">

                                                    <input type="submit" name="btnLogin" id="btnLogin" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                                <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                                <!-- Simple Pricing Tables -->
                                                <ins class="adsbygoogle"
                                                     style="display:block"
                                                     data-ad-client="ca-pub-9155049400353686"
                                                     data-ad-slot="6591520258"
                                                     data-ad-format="auto"
                                                     data-full-width-responsive="true"></ins>
                                                <script>
                                                    (adsbygoogle = window.adsbygoogle || []).push({});
                                                </script>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    <form id="register-form" action="/customer" method="post" role="form" style="display: none;">
                                        <div class="form-group">
                                            <input type="text" name="fullname" id="fullname" tabindex="1" class="form-control" placeholder="Fullname" value="" required="">
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${usernameErr}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" required="">
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${passErrExit}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password-signup" tabindex="2" class="form-control" placeholder="Password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                            <span toggle="#password-signup" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${passErrRepeat}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                            <span toggle="#confirm-password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${emailErr}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="" required="">
                                        </div>
                                        <div class="mb-4 d-flex justify-content-center">
                                            <span style="color: red">${phoneErr}</span>
                                        </div>
                                        <div class="form-group">
                                            <input type="tel" pattern="[0-9]{10}" name="phone" id="phone" tabindex="1" class="form-control" placeholder="Phone Number" value="" required="">
                                        </div>
                                        <div class="form-group">
                                            <div>
                                                <label>Gender</label>
                                                <br/>
                                                <label for="gender">Male</label>
                                                <input checked="true" name="gender" id="gender" type="radio" value="Male" />
                                                <label>Female</label>
                                                <input name="gender" id="gender" type="radio" value="Female" />
                                            </div> 
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="address" id="address" tabindex="1" class="form-control" placeholder="Address" value="" required="">
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="btnSignup" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {

                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });

            //show pass

            $(".toggle-password").click(function () {

                $(this).toggleClass("fa-eye fa-eye-slash");
                var input = $($(this).attr("toggle"));
                if (input.attr("type") == "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });

        </script>
    </body>
</html>
