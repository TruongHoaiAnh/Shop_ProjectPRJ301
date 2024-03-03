<%-- 
    Document   : policy
    Created on : Nov 6, 2023, 12:34:55 PM
    Author     : MSI GF66
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            * {
                margin-top: 40px;
            }

            p,
            span,
            li {
                font-size: 22px;
                font-weight: 200;
            }

            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                color: #096743;
                font-weight: 300;
                font-family: 'Oswald', sans-serif;
                letter-spacing: 0.8px;
            }

            .heading-page h1 {
                font-size: 2.5rem;
                line-height: 1.2;
                font-weight: 600;
                margin-bottom: 30px;
                padding-left: 15px;
                vertical-align: baseline;
                color: #096743;

            }

            .content-gthieu {
                margin-top: -20px;
            }

            .content-page p {
                margin-bottom: 10px;
            }

            .typeList-style ul {
                list-style: initial;
                padding-left: 20px;
            }

            .typeList-style ul li {
                display: list-item;
                margin-bottom: 15px;
                padding-left: 10px;
            }

            .content-page {
                padding-left: 15px;
            }

            .group-sidebox {
                margin: 0 0 30px;
                position: relative;
                padding: 0 20px 15px 20px;
                border: 1px solid #dddddd;
            }

            .group-sidebox .sidebox-title h3 {
                font-size: 24px;
                font-weight: 400;
                text-transform: uppercase;
                margin-bottom: 10px;
                padding-bottom: 12px;
                border-bottom: 2px solid #323232;
                text-align: center;
                position: relative;
                cursor: pointer;
            }

            /* Thiết lập kiểu chữ và đường viền cho mục menu */
            .menuList-links li a {
                display: block;
                margin-left: -32px;
                padding: 10px 0;
                /* Khoảng cách giữa các mục menu */
                text-decoration: none;
                color: #333;
                /* Màu chữ */
                border-bottom: 1px solid #ccc;
                /* Đường viền dưới mỗi mục menu */
            }

            /* Khi di chuột vào mục menu, thay đổi màu chữ hoặc nền */
            .menuList-links li a:hover {
                color: #ff6600;
                /* Màu chữ khi di chuột vào */
                background-color: #f2f2f2;
                /* Màu nền khi di chuột vào */
            }

            /* Loại bỏ đường viền dưới của mục menu cuối cùng */
            .menuList-links li:last-child a {
                border-bottom: none;
            }

            .menuList-links {
                list-style: none;
            }

            .menuList-links li span {
                font-weight: 400;
            }

            .group-sidebox-banner {
                margin: -60px 0 30px;
            }

            .group-sidebox-banner .sidebox-banner {
                position: relative;
                overflow: hidden;
                margin: 0;
            }

            .groupbanner_image_block img {
                border: none;
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>

    <body>
        <!-- Menu sidebar  -->
        <div class="row container-fluid">
            <div class="col-xl-3 col-lg-4 col-12  sidebar">
                <div class="group-sidebox">
                    <div class="sidebox-title ">
                        <h3 class="htitle">
                            DANH MỤC TRANG<span class="fa fa-angle-down"></span>
                        </h3>
                    </div>
                    <div class="sidebox-content sidebox-content-togged">
                        <ul class="menuList-links">


                            <li class=""><a href="/product/home" title="Trang chủ"><span>Trang chủ</span></a></li>



                            <li class=""><a href="/customer/list" title="Sản phẩm"><span>Sản phẩm</span></a></li>

                            <li class=" active "><a href="/product/about" title="Giới thiệu"><span>Giới thiệu</span></a>
                            </li>



                            <li class=""><a href="/product/contact" title="Liên hệ"><span>Liên hệ</span></a></li>


                        </ul>
                    </div>
                </div>

                <!-- Banner sidebar  -->

                <div class="group-sidebox-banner">
                    <figure class="sidebox-banner">
                        <div class="groupbanner_image_block">
                            <img src="/images/gioithieu1.jpg" alt="alt">
                        </div>
                    </figure>
                </div>
            </div>

            <div class="col-xl-9 col-lg-8 col-12  content-gthieu">
                <!-- content gioithieu -->
                <div class="heading-page">
                    <h1>Điều khoản và dịch vụ</h1>
                </div>
                <div class="wrapbox-content-page">
                    <div class="content-page typeList-style ">
                        <p><span class="wysiwyg-font-size-medium"><strong>1. Giới thiệu</strong></span></p>
                        <p><span class="wysiwyg-font-size-medium">Chào mừng quý khách hàng đến với website chúng tôi.</span>
                        </p>
                        <p><span class="wysiwyg-font-size-medium">Khi quý khách hàng truy cập vào trang website của chúng
                                tôi có nghĩa là quý khách đồng ý với các điều khoản này. Trang web có quyền thay đổi, chỉnh
                                sửa, thêm hoặc lược bỏ bất kỳ phần nào trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc
                                nào. Các thay đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo
                                trước. Và khi quý khách tiếp tục sử dụng trang web, sau khi các thay đổi về Điều khoản này
                                được đăng tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.</span></p>
                        <p><span class="wysiwyg-font-size-medium">Quý khách hàng vui lòng kiểm tra thường xuyên để cập nhật
                                những thay đổi của chúng tôi.</span></p>
                        <p><span class="wysiwyg-font-size-medium"><strong>2. Hướng dẫn sử dụng website</strong></span></p>
                        <p><span class="wysiwyg-font-size-medium">Khi vào web của chúng tôi, khách hàng phải đảm bảo đủ 18
                                tuổi, hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp. Khách hàng đảm
                                bảo có đầy đủ hành vi dân sự để thực hiện các giao dịch mua bán hàng hóa theo quy định hiện
                                hành của pháp luật Việt Nam.</span></p>
                        <p><span class="wysiwyg-font-size-medium">Trong suốt quá trình đăng ký, quý khách đồng ý nhận email
                                quảng cáo từ website. Nếu không muốn tiếp tục nhận mail, quý khách có thể từ chối bằng cách
                                nhấp vào đường link ở dưới cùng trong mọi email quảng cáo.</span><span
                                class="wysiwyg-font-size-medium"><strong></strong></span><span
                                class="wysiwyg-font-size-medium"></span><span
                                class="wysiwyg-font-size-medium"><strong></strong></span><span
                                class="wysiwyg-font-size-medium"></span><span
                                class="wysiwyg-font-size-medium"><strong></strong></span><span
                                class="wysiwyg-font-size-medium"></span></p>
                        <p><span class="wysiwyg-font-size-medium"></span><span class="wysiwyg-font-size-medium"></span><br>
                        </p>
                        <p><span class="wysiwyg-font-size-medium"><strong>3. Thanh toán an toàn và tiện lợi</strong></span>
                        </p>
                        <p><span class="wysiwyg-font-size-medium">Người mua có thể tham khảo các phương thức thanh toán sau
                                đây và lựa chọn áp dụng phương thức phù hợp:</span></p>
                        <p><span class="wysiwyg-font-size-medium"><strong><u>Cách 1</u></strong>: Thanh toán trực tiếp
                                (người mua nhận hàng tại địa chỉ người bán)<br></span><span
                                class="wysiwyg-font-size-medium"><strong><u>Cách 2</u></strong><strong>:</strong>&nbsp;Thanh
                                toán sau (COD – giao hàng và thu tiền tận nơi)<br></span><span
                                class="wysiwyg-font-size-medium"><strong><u>Cách 3</u></strong><strong>:</strong>&nbsp;Thanh
                                toán online qua thẻ tín dụng, chuyển khoản</span></p>

                    </div>
                </div>
            </div>

        </div>


    </body>

</html>
