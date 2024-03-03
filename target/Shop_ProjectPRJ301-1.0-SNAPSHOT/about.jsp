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
                <h1>GIỚI THIỆU</h1>
                <p class="text">
                    Với không gian trang nhã và ấm cúng, nhà hàng GOGI PUMJIL mang đến một trải nghiệm ẩm thực tuyệt vời cho khách hàng.
                    <br>

                    Đội ngũ nhân viên thân thiện và chuyên nghiệp của nhà hàng GOGI PUMJIL luôn sẵn sàng phục vụ khách hàng với sự tận tâm và thân thiện. Không gian sang trọng và dịch vụ chuyên nghiệp tại GOGI PUMJIL sẽ mang đến cho bạn một trải nghiệm ẩm thực không thể quên.
                    <br>
                    Với những đặc trưng độc đáo và chất lượng xuất sắc của món ăn, nhà hàng GOGI PUMJIL là một điểm đến lý tưởng cho những ai yêu thích ẩm thực và mong muốn có một bữa ăn độc đáo và tuyệt vời.
                </p>
            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>

</html>
