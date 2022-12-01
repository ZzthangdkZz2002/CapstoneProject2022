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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">



    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            user-select: none;
        }
        .navbar{
            justify-content: normal;
        }
        .navbar-nav{
            flex-direction: row;
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

<%--                <div>--%>
<%--                    <select class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">--%>
<%--                        <option value="" selected>Chọn tỉnh thành</option>--%>
<%--                    </select>--%>

<%--                    <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">--%>
<%--                        <option value="" selected>Chọn quận huyện</option>--%>
<%--                    </select>--%>

<%--                    <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">--%>
<%--                        <option value="" selected>Chọn phường xã</option>--%>
<%--                    </select>--%>
<%--                </div>--%>

                <div class="mb-3">
                    <label for="city">Tỉnh/Thành phố</label> <br>
                    <select class="form-select form-select-lg mb-3" aria-label="Default select example" id="city" name="city">
                        <option value="0" selected>Chọn tỉnh thành</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="district">Quận/Huyện</label> <br>
                    <select class="form-select form-select-lg mb-3" aria-label="Default select example" id="district" name="district">
                        <option value="0" selected>Chọn quận huyện</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="ward">Xã/Phường</label> <br>
                    <select class="form-select form-select-lg mb-3" aria-label="Default select example" id="ward" name="ward">
                        <option value="0" selected>Chọn phường xã</option>
                    </select>
                </div>


                <div class="mb-3">
                    <label for="address">Địa chỉ chi tiết</label>
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
                <a class="btn btn-primary btn-lg btn-block text-light" onclick="OrderAction()">Thanh toán</a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if(this.value != ""){
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/assets_onlinepage/js/checkout.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<%--<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>--%>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/onlinepage.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-hover-dropdown.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/echo.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery.easing-1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-slider.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery.rateit.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets_onlinepage/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/scripts.js"></script>
</body>>
</html>