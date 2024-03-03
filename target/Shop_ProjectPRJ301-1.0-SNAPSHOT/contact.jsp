<%-- 
    Document   : about
    Created on : Nov 5, 2023, 9:03:13 PM
    Author     : Lenovo
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
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{
                min-height: 100vh;
                /*                display: flex;*/
                align-items: center;
                justify-content: center;
                background-color: #f1f1f1;
            }

            .about-section{
                background: url(/images/gogi_footer.jpg) no-repeat left;
                background-size: 55%;
                background-color: #fdfdfd;
                overflow: hidden;
                padding: 100px 0;
            }

            .inner-container{
                width: 55%;
                float: right;
                background-color: #fdfdfd;
                padding: 150px;
            }

            .inner-container h1{
                margin-bottom: 30px;
                font-size: 30px;
                font-weight: 900;
            }

            .text{
                font-size: 13px;
                color: #545454;
                line-height: 30px;
                text-align: justify;
                margin-bottom: 40px;
            }
            
            span{
                font-weight: bold;
            }

            @media screen and (max-width:1200px) {
                .inner-container{
                    padding: 80px;
                }
            }
            @media screen and (max-width:1000px) {
                .about-section{
                    background-size: 100%;
                    padding: 100px 40px;
                }

                .inner-container{
                    width: 100%;
                }
            }

            @media screen and (max-width:600px) {
                .about-section{
                    padding: 100px 40px;
                }

                .inner-container{
                    padding: 60px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="Component/header.jsp" %>
        <div class="about-section">
            <div class="inner-container">
                <h1>LIÊN HỆ</h1>
                <p class="text">
                    Trang Liên Hệ

                    Hãy liên hệ với chúng tôi để được tư vấn và hỗ trợ. Dưới đây là thông tin liên hệ của chúng tôi:
                    <br>
                    <span>Hotline: 1900.1234</span>
                    <br>
                    <span>Điện thoại di động: 0123.456.789</span>
                    <br>
                    <span>Địa chỉ: 123 Trần Quang Diệu, An Cư, Ninh Kiều - Cần Thơ</span>
                    <br>
                    Hãy đến và trải nghiệm không gian ấm cúng và hương vị tuyệt vời của nhà hàng chúng tôi.

                    Hãy để chúng tôi mang đến cho bạn một trải nghiệm ẩm thực tuyệt vời và dịch vụ chuyên nghiệp. Liên hệ với chúng tôi ngay hôm nay để biết thêm thông tin chi tiết và đặt chỗ. Chúng tôi rất mong chờ được đón tiếp bạn tại nhà hàng của chúng tôi.
                    <br>
                    Xin cảm ơn và rất mong sớm được gặp bạn!
                </p>
            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>

</html>
