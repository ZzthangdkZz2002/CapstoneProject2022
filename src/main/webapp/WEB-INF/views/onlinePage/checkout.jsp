<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Checkout</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/checkout.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>

</head>
<body class="bg-light">
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Giỏ hàng của bạn</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3 cart-shop">
                <!-- LIST CART IN HERE -->



            </ul>
            <li class="list-group-item d-flex justify-content-between">
                <span>Total (VND)</span>
                <strong class="total-money">0</strong>
            </li>

        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Thông tin thanh toán</h4>
            <form class="needs-validation" >

                <div class="mb-3">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" value="${auth != null ? auth.phone : "" }" ${auth != null ? "readonly" : "" } required>
                </div>

                <div class="mb-3">
                    <label for="email">Email </label>
                    <input type="email" class="form-control" id="email" value="${auth != null ? auth.email : "" }" ${auth != null ? "readonly" : "" } required>
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Họ và tên</label>
                    <div class="input-group">

                        <input type="text" class="form-control" id="username"  value="${auth != null ? auth.name : "" }" ${auth != null ? "readonly" : "" } required>
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>



                <div class="mb-3">
                    <label for="address">Địa chỉ</label>
                    <input type="text" class="form-control" id="address"  required="Vui lòng nhập địa chỉ">
<%--                    <div class="invalid-feedback">--%>
<%--                        Please enter your shipping address.--%>
<%--                    </div>--%>
                </div>



                <div class="mb-3">
                    <label for="note" class="form-label">Ghi chú</label>
                        <textarea class="form-control" id="note" rows="3"></textarea>
                </div>


                <hr class="mb-4">

                <h4 class="mb-3">Phương thức thanh toán</h4>

                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" value="Thanh toán khi nhận hàng" name="paymentMethod" type="radio" class="custom-control-input" checked required/>
                        <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" value="Thanh toán qua VNPay" type="radio" class="custom-control-input" required>
                        <label class="custom-control-label" for="debit">Thanh toán qua VNPay</label>
                    </div>

                </div>

                <hr class="mb-4">
                <a class="btn btn-primary btn-lg btn-block" onclick="OrderAction()">Thanh toán</a>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2019 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/checkout.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<%--<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>--%>
</body>>
</html>