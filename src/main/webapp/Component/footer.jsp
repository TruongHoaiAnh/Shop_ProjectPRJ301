<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /*
  =========================================================================================
                                    Social Icons
  =========================================================================================
    */


    .round-btn {
        display: inline;
        height: 40px;
        width: 40px;
        background: #fff;
        border-radius: 50%;
        float: left;
        margin: 15px 8px;
        box-shadow: 2px 2px 5px 0px rgb(82, 0, 67);
        border: 1px solid;
        /*border: 1px solid #622657;*/
    }

    .round-btn a {
        display: block !important;
        padding: 7px 12px;
        font-size: 18px;
        border-radius: 50%;
    }

    .round-btn .icon {
        padding: 3px;
    }

    .round-btn .icon img {
        height: 24px;
        width: 32px;
        margin-top: 6px;
    }

    .btn-facebook a {
        color: #3b5998;
        padding: 8px 13px;
    }

    .btn-linkedin a {
        color: #007bb6;
    }

    .btn-twitter a {
        color: #1c9deb;
    }

    .btn-instagram a {
        color: #dd3f5c;
    }

    .btn-whatsapp a {
        color: #155E54;
    }

    .btn-envelop a {
        color: #D6403A;
        font-size: 15px;
        padding: 9px 12px;
    }

    .standard_header .standard_social_links {
        margin-left: 1rem;
    }

    /*
        =========================================================================================
                                          footer
        =========================================================================================
    */

    /* .footer-wrap {
        padding-top: 43px;
        background-size: cover;
    } */

    .footer-wrap {
        background: url('/images/gogi_footer.jpg') center center no-repeat;
        background-size: cover;
        position: relative;
        z-index: 1;
    }

    .footer-wrap::before {
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: rgba(0, 0, 0, 0.5); /* Màu đen với độ mờ 50% */
        z-index: -1;
    }

    .footer-wrap h3 {
        color: #fff;
        font-size: 17px;
        text-transform: uppercase;
        margin-bottom: 25px;
    }

    .footer-wrap p {
        font-size: 13px;
        line-height: 24px;
        color: #b3b3b3;
        margin-top: 15px;
    }

    .footer-wrap p a {
        color: #fff;
        text-decoration: underline;
        font-style: italic;
    }

    .footer-wrap p a:hover {
        text-decoration: none;
        color: #ff7800;
    }

    .footer-links li a {
        font-size: 13px;
        line-height: 30px;
        color: #ccc;
        text-decoration: none;
    }


    .footer-links li:before {
        padding-right: 10px;
        color: #ccc;
    }

    .footer-category li a {
        font-size: 13px;
        line-height: 30px;
        color: #ccc;
        text-decoration: none;
    }

    .footer-category li:before {
        padding-right: 10px;
        color: #b3b3b3;
    }

    .address {

        color: #b3b3b3;
        font-size: 14px;
        position: relative;
        padding-left: 30px;
        line-height: 30px;
    }

    .address:before {
        content: "\f277";
        position: absolute;
        top: 0;
        left: 0;
    }

    .info a {

        color: #b3b3b3;
        font-size: 14px;
        line-height: 30px;
        font-weight: normal;
    }

    .fa-phone:before {
        content: "\f095";
    }

    .info a {

        color: #b3b3b3;
        font-size: 14px;
        line-height: 30px;
        font-weight: normal;
    }

    .fa-fax:before {
        content: "\f1ac";
    }

    .copyright {
        border-top: 1px solid #111;
        font-size: 14px;
        color: #ccc;
        padding-top: 15px;
        text-align: center;
        padding-bottom: 15px;
        background: #222;
    }

    footer .second_class {
        border-bottom: 1px solid #444;
        padding-bottom: 25px;
    }

    footer .first_class {
        padding-bottom: 21px;
        border-bottom: 1px solid #444;
    }

    footer .first_class p,
    footer .first_class h3 {
        margin: 0 0;

    }

    footer {
        background: #333;
    }

    footer .newsletter input[type="text"] {
        width: 100%;
        background: #fff;
        color: #333;
        border: 1px solid #222;
        padding: 14px 20px;
        border-radius: 50px;
        margin-top: 12px;
    }

    .newsletter .newsletter_submit_btn {
        background: #fff;
        position: absolute;
        right: 30px;
        border: 0;
        top: 26px;
        font-size: 17px;
        color: #333;
    }


    footer .second_class_bdr {
        padding-top: 25px;
        border-top: 1px solid #222;
    }

    footer .btn-facebook a {
        padding: 6px 14px !important;
    }

    footer .btn-envelop a {
        color: #D6403A;
        font-size: 15px;
        padding: 12px 12px;
    }

    footer .round-btn a {
        padding: 6px 12px;
    }

    footer .round-btn {
        box-shadow: 2px 2px 5px 0px #222 !important;
    }

    footer .round-btn {
        margin: 15px 4px;
    }

    .footer-logo img{
        width: 100px;
    }

    footer dl,
    ol,
    ul {
        padding-left: 5px;
    }

    footer li {
        list-style: none;
    }

    @media(max-width:768px) {
        .footer-wrap h3 {
            margin-top: 27px;
        }

        footer .round-btn {
            margin: 15px 4px;
        }
    }

    @media(max-width:320px) {
        .copyright {
            font-size: 13px;
        }
    }
</style>
<footer>
    <div class="footer-wrap">
        <div class="container first_class">
            <div class="row">
                <div class="col-md-2></div>
                     <div class="col-md-4">
                    <h3>BE THE FIRST TO KNOW</h3>
                    <p>Chào mừng bạn đến với Gogi Pumjil(고기품질)! Chúng tôi rất vui mừng khi bạn đã dành thời gian thăm quán. Hãy cảm nhận hương vị tuyệt vời và không gian thoải mái tại nhà hàng của chúng tôi. Chúng tôi mong rằng bạn sẽ có một trải nghiệm ẩm thực đáng nhớ. Đừng ngần ngại yêu cầu món ưa thích của bạn - đội ngũ nhân viên của chúng tôi luôn sẵn sàng phục vụ bạn tận tình nhất. Hãy đặt bàn ngay hôm nay để trải nghiệm hết sức tuyệt vời!</p>
                </div>
                <div class="col-md-2></div>
                     <div class="col-md-4">
                    <div class="col-md-12">
                        <div class="standard_social_links">
                            <div>
                                <li class="round-btn btn-facebook"><a href="#"><i class="fab fa-facebook-f"></i></a>

                                </li>
                                <li class="round-btn btn-twitter"><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>

                                </li>
                                <li class="round-btn btn-instagram"><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a>

                                </li>
                                <li class="round-btn btn-envelop"><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a>

                                </li>
                            </div>
                        </div>  
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="second_class">
            <div class="container second_class_bdr">
                <div class="row">
                    <div class="col-md-4 col-sm-6">

                        <div class="footer-logo"><a href="/product/home"><img src="/Component/logo/logo.jpg" alt="logo"></a>
                        </div>
                        <p>Bầu không khí bình dị trong khi thiết kế hiện đại và cao cấp góp phần mang đến trải nghiệm ăn uống thư giãn và thú vị.</p>
                        <!--          <p>Hotline: 1900.1234 - Di động: 0939.123.456</p>
                                  <p>Địa chỉ: 123 Trần Quang Diệu, phường An Cư, Quận Ninh Kiều, Thành phố Cần Thơ</p>-->
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <ul class="footer-links">
                            <li><h3>MENU</h3></li>
                            <li><a href="/product/home">Trang chủ</a>
                            </li>
                            <li><a href="/customer/list">Sản phẩm</a>
                            </li>
                            <li><a href="/product/about">Giới thiệu</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <ul class="footer-category">
                            <li><h3>CHÍNH SÁCH</h3></li>
                            <li><a href="/product/policy">Điều khoản dịch vụ</a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <!--                        <h3>LIÊN HỆ</h3>-->
                        <ul class="footer-links">
                            <li><h3>LIÊN HỆ</h3></li>
                            <li><a href="/product/contact">Hotline: 1900.1234</a>
                            </li>
                            <li><a href="/product/contact">Di động: 0123.456.789</a>
                            </li>
                            <li><a href="/product/contact">Địa chỉ: 123 Trần Quang Diệu, An Cư, Ninh Kiều - Cần Thơ</a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">

            <div class="container-fluid">
                <div class="copyright"> Copyright 2023 | All Rights Reserved by Gogi Pumjil. Ltd.</div>
            </div>

        </div>
    </div>
    <!--footer end-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!-- Font Awesome 5 links-->
</footer>

