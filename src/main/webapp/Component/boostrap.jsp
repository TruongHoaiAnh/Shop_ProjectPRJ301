<%-- 
    Document   : NotLoginHeader
    Created on : Jul 4, 2023, 12:34:33 PM
    Author     : MY LAPTOP
--%>
<!--bootstrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" href="/images/logo4Shop.jpg" type="image/jpeg">

<!-- S? d?ng jQuery ??y ?? -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>   
    <link rel="stylesheet" href="<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--for icon-->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!-- design background -->
<style>
    .bg-glass {
        background-color: hsla(0, 0%, 100%, 0.9) !important;
        backdrop-filter: saturate(200%) blur(25px);
    }
    ion-icon{
        font-size: 2rem;
    }
</style>

<script src=
        "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<script src=
        "https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js">
</script>
<script src=
        "https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js">
</script>

<script>
    $().ready(function () {

        $('#loginForm').validate({
            rules: {
                username: {
                    required: true,
                    maxlength: 50
                },
                password: {
                    required: true,
                    maxlength: 32
                }
            },
            messages: {
                username: {
                    required: "Please enter your username.",
                    maxlength: "Username should be maximum 50 characters."
                },
                password: {
                    required: "Please enter your password.",
                    maxlength: "Password should be maximum 32 characters."
                }
            },
            submitHandler: function (form) {
                // Form submission logic
                form.submit();
            }
        });
        $('#signupForm').validate({
            rules: {
                fullname: 'required',
                username: 'required',
                password: 'required',
                phone: {
                    required: true,
                    pattern: '[0-9]{10}'
                },
                email: {
                    required: true,
                    email: true
                },
                address: 'required'
            },
            messages: {
                fullname: 'Please enter your full name.',
                username: 'Please enter your username.',
                password: 'Please enter your password.',
                phone: {
                    required: 'Please enter your phone number.',
                    pattern: 'Please enter a valid phone number (10 digits).'
                },
                email: {
                    required: 'Please enter your email address.',
                    email: 'Please enter a valid email address.'
                },
                address: 'Please enter your address.'
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
        
        $('#updateForm').validate({
            rules: {
                fullname: 'required',
                username: 'required',
                oldPassword: 'required',
                phone: {
                    required: true,
                    pattern: '[0-9]{10}'
                },
                email: {
                    required: true,
                    email: true
                },
                address: 'required'
            },
            messages: {
                fullname: 'Please enter your full name.',
                username: 'Please enter your username.',
                oldPassword: 'Please enter your old password.',
                phone: {
                    required: 'Please enter your phone number.',
                    pattern: 'Please enter a valid phone number (10 digits).'
                },
                email: {
                    required: 'Please enter your email address.',
                    email: 'Please enter a valid email address.'
                },
                address: 'Please enter your address.'
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
        $('#productForm').validate({
            rules: {
                productName: 'required',
                productType: 'required',
                productPrice: {
                    required: true
//                    ,pattern: '^(0|[1-9]\d{0,2})(\.\d{2})?$'
                }
//                ,productImg: 'required'
            },
            messages: {
                productName: '*Please enter product name.',
                productType: '*Please enter product type.',
                productPrice: {
                    required: '*Please enter product price.'
//                    ,pattern: '*Please enter a valid product price.'
                }
//                ,productImg: '*Please enter product image.'
            },
            submitHandler: function (form) {
                form.submit();
            }
        });

    });
</script>