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
        <<script src="/JS/validateForm.js"></script>
        <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="/bootstrap/font.css" />
        <link rel="stylesheet" href="/bootstrap/font2.css" />
        <link rel="stylesheet" href="/bootstrap/fontawesome.css" />
        <link rel="stylesheet" href="/bootstrap/bootstrap.min.css" />
        <link rel="stylesheet" href="/bootstrap/style.css" />

    </head>
    <body>
        <%@include file="Component/header.jsp" %>
        <section class="overflow-hidden">
            <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                        <h1 class="fw-bold"  style="color: hsl(218, 81%, 75%)">
                            GOGI PUMJIL
                            <br>
                            <span class="my-5 display-5 ls-tight" style="color: hsl(218, 81%, 95%); font-size: 28px; font-weight: bold"> Nơi những món ăn chuẩn vị quốc tế </span>
                        </h1>
                        <br />
                        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">

                            Tại GOGI PUMJIL, chúng tôi mang đến cho bạn một loạt các món ăn đa dạng và hấp dẫn. 
                            Thưởng thức những món thịt được chế biến tinh tế và đậm đà, như thịt bò, thịt lợn, thịt gà, và hải sản tươi ngon. 
                            Những món ăn tại đây được chế biến bởi đầu bếp có kinh nghiệm với các nguyên liệu tươi ngon và chất lượng cao, đảm bảo mang đến cho bạn những trải nghiệm ẩm thực không thể quên.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0 position-relative">

                        <div class="card bg-glass">
                            <div class="card-body p-4 p-md-5">
                                <form method="post" enctype="multipart/form-data" action="/product" id="productForm" onsubmit="return validateFormAdd()">
                                    <!-- Email input -->
                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example3">Name:</label>
                                        <input required type="text" name="productName"  class="form-control" />
                                    </div>

                                    <!-- Password input -->
                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example4">Type:</label>
                                        <input required type="text" name="productType" class="form-control" />
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example4">Price:</label>
                                        <input required type="number" name="productPrice" class="form-control" />
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label" for="form3Example4">Image:</label>
                                        <input required  type="file" name="productImg" id="fileInput" class="form-control" />
                                    </div>

                                    <!-- Submit button -->
                                    <div style="text-align: center">

                                        <input type="submit" class="btn btn-primary btn-block mb-4" name="btnAddnew" value="Add New">
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
