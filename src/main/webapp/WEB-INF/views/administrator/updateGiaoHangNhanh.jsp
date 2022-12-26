<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <style>
        .GHN {
            /* padding-left: 3rem;
            padding-right: 3rem; */
        }

        .row-title {
            margin-left: 16rem;
            color: #f26522;
            margin-top: 1rem;
        }

        .GHN label {
            font-weight: bold;
        }

        .products-info {
            width: 70%;
            display: flex;
            margin-bottom: 1rem;
            padding: 10px;
            margin-left: 14.5rem;
            box-shadow: 0 0 4px rgb(0 0 0 / 25%);
            border-radius: 12px;
        }
        .products-info img{
            height: 4rem;
            width: 4rem;
        }

        .products-info input {
            border: none !important;
            border-bottom: 1px solid #d4d4d4 !important;
            height: 28px !important;
            padding: 5px;
            background-color: transparent !important;
        }
        .products-info div{
        }
        .products-info label{
            font-weight: bold;
        }
        .boder{
            padding: 10px;
        }
        .save-btn button{
            padding: 15px 30px;
            border-radius: 20px;
        }
    </style>
</head>

<body>
<!-- Navbar-->
<jsp:include page="header.jsp"/>
<jsp:include page="home-menu.jsp"/>
<!-- bên gửi -->
<div class="row GHN justify-content-center">
    <h2 style="text-align: center;margin-top: 25px" id="ghn-status"></h2>
</div>
<h4 class="row-title"> | Bên gửi</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="sender-name" class="form-label">Tên cửa hàng/bên gửi</label>
            <input type="text" class="form-control" id="sender-name">
        </div>
        <div class="mb-2">
            <label for="sender-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="sender-phone">
        </div>
        <div class="mb-2">
            <label for="sender-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="sender-address">
        </div>
    </div>
    <div class="col-4">
<%--        <div class="mb-2">--%>
<%--            <label for="sender-district" class="form-label">Tỉnh/Thành Phố</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="sender-province">--%>
<%--                <option selected id="sender-province-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="sender-district" class="form-label">Quận/Huyện</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="sender-district">--%>
<%--                <option selected id="sender-district-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="sender-wards" class="form-label">Phường/Xã</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="sender-wards">--%>
<%--                <option selected id="sender-wards-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>

<!-- bên nhận -->
<h4 class="row-title"> | Bên nhận</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="receive-name" class="form-label">Họ tên</label>
            <input type="text" class="form-control" id="receive-name">
        </div>
        <div class="mb-2">
            <label for="receive-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="receive-phone">
        </div>
        <div class="mb-2">
            <label for="receive-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="receive-address">
        </div>
    </div>
    <div class="col-4">
<%--        <div class="mb-2">--%>
<%--            <label for="sender-district" class="form-label">Tỉnh/Thành Phố</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="receive-province">--%>
<%--                <option selected id="receive-province-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="receive-district" class="form-label">Quận/Huyện</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="receive-district">--%>
<%--                <option selected id="receive-district-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="receive-wards" class="form-label">Phường/Xã</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="receive-wards">--%>
<%--                <option selected id="receive-wards-opt"></option>--%>
<%--            </select>--%>
<%--        </div>--%>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>



<!-- địa chỉ trả hàng chuyển hoàn -->
<h4 class="row-title"> | Địa chỉ trả hàng chuyển hoàn</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="return-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="return-phone">
        </div>
        <div class="mb-2">
            <label for="return-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="return-address">
        </div>
    </div>
    <div class="col-4">
        <div class="mb-2">
            <label for="sender-district" class="form-label">Tỉnh/Thành Phố</label>
            <select class="form-select" aria-label="Default select example" id="return-province">
                <option selected id="return-province-opt">Bắc Ninh</option>
            </select>
        </div>
        <div class="mb-2">
            <label for="return-district" class="form-label">Quận/Huyện</label>
            <select class="form-select" aria-label="Default select example" id="return-district">
                <option selected id="return-district-opt">Quận 11</option>
            </select>
        </div>
        <div class="mb-2">
            <label for="return-wards" class="form-label">Phường/Xã</label>
            <select class="form-select" aria-label="Default select example" id="return-wards">
                <option selected id="return-wards-opt">phường 5</option>
            </select>
        </div>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>


<!-- sản phẩm-->
<h4 class="row-title"> | Sản phẩm</h4>
<div class="boder">
    <c:forEach var="item" items="${order.orderTransactionDetails}">
        <div class="products-info justify-content-around">
            <div class="d-flex">
                <label for="product-name" class="form-label">1.</label>
                <input type="text" class="form-control" id="product-name" value="${item.productDTO.name}" readonly>
            </div>
            <div class="">
                <input type="text" class="form-control" id="product-category" value="${item.productDTO.code}" readonly>
            </div>
            <div class="d-flex">
                <label for="product-mass" class="form-label">KL (gam)</label>
                <input style="width: 60%;" type="text" class="form-control" id="product-mass" placeholder="g" readonly>
            </div>
            <div class="d-flex">
                <label for="product-quantity" class="form-label">SL</label>
                <input type="text" class="form-control" id="product-quantity" value="${item.quantity}" readonly>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Thông tin gói hàng-->
<h4 class="row-title"> | Thông tin gói hàng</h4>
<div class="boder">
    <div class="products-info justify-content-center">
        <img src="https://bizweb.dktcdn.net/100/307/433/articles/87126502-2509242206005371-2073523065622364160-n.jpg?v=1627806241047" alt="">
        <div class="d-flex ms-2">
            <label for="product-name" class="form-label">Tổng KL(gam)</label>
            <input style="width: 60%;" type="text" class="form-control" id="weight">
        </div>
        <div class="d-flex">
            <label for="product-mass" class="form-label">Dài</label>
            <input type="text" class="form-control" id="length">
        </div>
        <div class="d-flex">
            <label for="product-mass" class="form-label">Rộng</label>
            <input  type="text" class="form-control" id="width" >
        </div>
        <div class="d-flex">
            <label for="product-quantity" class="form-label">Cao</label>
            <input type="text" class="form-control" id="height">
        </div>
    </div>
</div>
<div class="row justify-content-center">
    <div class="col-md-4">
        <p class="fw-bold">Tổng tiền thu hộ COD</p>
        <input type="number" class="form-control" id="total-cod">
    </div>
    <div class="col-md-4">
        <p class="fw-bold">Tổng giá trị hàng hoá</p>
        <input type="number" class="form-control" id="total-value">
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>


<!-- Lưu ý - Ghi chú-->
<h4 class="row-title"> | Lưu ý - Ghi chú</h4>
<div class="row justify-content-center">
    <div class="col-md-4">
        <p style="margin-top: 1rem;" class="fw-bold">Ngày giao dự kiến </p>
        <input type="text" class="form-control" id="delivery-date" readonly>
        <p class="fw-bold">Lưu ý giao hàng</p>
        <select class="form-select" aria-label="Default select example" id="ship-note">
            <option selected value="KHONGCHOXEMHANG">Không cho xem hàng</option>
            <option value="CHOXEMHANGKHONGTHU">Cho xem hàng không cho thử</option>
            <option value="CHOTHUHANG">cho thử hàng</option>
        </select>
        <p style="margin-top: 1rem;" class="fw-bold">Thêm mã đơn khách hàng </p>
        <input type="text" class="form-control" id="order-id" readonly>
<%--        <select class="form-select mt-4" aria-label="Default select example" id="">--%>
<%--            <option selected>Bên nhận trả phí</option>--%>
<%--            <option value="1">xxx</option>--%>
<%--        </select>--%>
    </div>
    <div class="col-md-4">
        <div class="d-flex justify-content-between">
            <p class="fw-bold">Ghi chú</p>
        </div>
        <textarea class="form-control"  id="note" style="height: 130px"></textarea>
    </div>
</div>
<div class="save-btn text-center mt-5">
    <button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#cancelOrder">Hủy Đơn</button>
    <button type="button" class="btn btn-success" id="btnUpdate" onclick="updateGHN('${order.order_code}')">Cập nhật</button>
</div>
<%--Model cancel order--%>
<div class="modal fade" id="cancelOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="form-group">
                    <h2 class="modal-title" style="color: #9d9d9d;text-align: center;margin-bottom: 15px">Bạn chắc chắn muốn hủy đơn hàng?</h2>
                    <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal" style="margin-left: 60px">Đóng</button>
                    <button type="button" class="btn btn-success" onclick="cancelGHN('${order.order_code}','${order.orderid}')" style="margin-left: 110px">Hủy đơn hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js" integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
    var data = {
        "order_code": "${order.order_code}"
    }
    $.ajax(
        {
            type : "POST",
            contentType: "application/json",
            url : "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/detail",
            headers: {
                'Content-Type':'application/json',
                'Token':'6178a70e-7006-11ed-a83f-5a63c54f968d',
            },
            data: JSON.stringify(data),
            success: function (response){
                console.log(response)
                if(response.code === 200){
                    var status;
                    if(response.data.status = 'ready_to_pick'){
                        status = 'Chờ lấy hàng'
                    }
                    if(response.data.status = 'cancel'){
                        status = 'Đơn hủy'
                        $("#btnUpdate").prop('disabled', true);
                    }
                    var requiredNote = response.data.required_note;

                    $('#ghn-status').text(response.data.order_code + ' - ' + status)
                    $('#sender-name').val(response.data.from_name)
                    $('#sender-phone').val(response.data.from_phone)
                    $('#sender-address').val(response.data.from_address)
                    $('#receive-name').val(response.data.to_name)
                    $('#receive-phone').val(response.data.to_phone)
                    $('#receive-address').val(response.data.to_address)
                    $('#return-phone').val(response.data.return_phone)
                    $('#return-address').val(response.data.return_address)
                    $('#weight').val(response.data.weight)
                    $('#length').val(response.data.length)
                    $('#width').val(response.data.width)
                    $('#height').val(response.data.height)
                    $('#total-cod').val(response.data.cod_amount)
                    $('#total-value').val(response.data.insurance_value)
                    $('#delivery-date').val(moment(response.data.leadtime).utc().format('DD/MM/YYYY'))
                    $('#order-id').val(response.data.client_order_code)
                    $("textarea#note").text(response.data.note)

                    if(requiredNote == 'KHONGCHOXEMHANG'){
                        $('#ship-note  option[value="KHONGCHOXEMHANG"]').prop("selected", true);
                    }else if(requiredNote == 'CHOXEMHANGKHONGTHU'){
                        $('#ship-note  option[value="CHOXEMHANGKHONGTHU"]').prop("selected", true);
                    }else{
                        $('#ship-note  option[value="CHOTHUHANG"]').prop("selected", true);
                    }
                }
                else{
                    alert(response.message);
                    return;
                }
            },
            error: function () {
                alert('error')
                return false;
            }
        }
    );
    
    function getDistrict(distric_id) {
        $.ajax(
            {
                type : "POST",
                contentType: "application/json",
                url : "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/detail",
                headers: {
                    'Content-Type':'application/json',
                    'Token':'6178a70e-7006-11ed-a83f-5a63c54f968d',
                },
                data: JSON.stringify(data),
                success: function (response){
                    console.log(response)
                    if(response.code === 200){

                    }
                    else{
                        alert(response.message);
                        return;
                    }
                },
                error: function () {
                    alert('error')
                    return false;
                }
            }
        );
    }

    function updateGHN(order_code) {

        var data = {
            "order_code" : order_code,
            "from_name" : $('#sender-name').val(),
            "from_phone" : $('#sender-phone').val(),
            "from_address" : $('#sender-address').val(),
            "to_name" : $('#receive-name').val(),
            "to_phone" : $('#receive-phone').val(),
            "to_address" : $('#receive-address').val(),
            "return_phone" : $('#return-phone').val(),
            "return_address" : $('#return-address').val(),
            "cod_amount" : parseInt($('#total-cod').val()),
            "weight" : parseInt($('#weight').val()),
            "length" : parseInt($('#length').val()),
            "width" : parseInt($('#width').val()),
            "height" : parseInt($('#height').val()),
            "insurance_value" : parseInt($('#total-value').val()),
            "note" : $('textarea#note').val(),
            "required_note" : $('#ship-note').val()
        };
        $.ajax(
            {
                type : "POST",
                contentType: "application/json",
                url : "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/update",
                headers: {
                    'Content-Type':'application/json',
                    'ShopId':'120862',
                    'Token':'6178a70e-7006-11ed-a83f-5a63c54f968d',
                },
                data: JSON.stringify(data),
                success: function (response){
                    console.log(response)
                    if(response.code === 200){
                        window.location.href = "http://localhost:5000/admin/orders/shipping"
                    }
                    else{
                        alert(response.message);
                        return;
                    }
                },
                error: function (error) {
                    alert(error)
                    return false;
                }
            }
        );
    }

</script>
<script>
    function cancelGHN(order_code,orderid) {
        console.log(order_code + ", "+orderid)
        var data = {
            "order_codes" : [order_code]
        }
        $.ajax(
            {
                type : "POST",
                contentType: "application/json",
                url : "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/switch-status/cancel",
                headers: {
                    'Content-Type':'application/json',
                    'ShopId':'120862',
                    'Token':'6178a70e-7006-11ed-a83f-5a63c54f968d',
                },
                data: JSON.stringify(data),
                success: function (response){
                    console.log(response)
                    if(response.code === 200){
                        window.location.href = "http://localhost:5000/admin/orders/cancelGHN?orderid="+orderid
                    }
                    else{
                        alert(response.message);
                        return;
                    }
                },
                error: function (error) {
                    alert(error)
                    return false;
                }
            }
        );
    }
</script>
<script>
    var citis = document.getElementById("return-province");
    var district = document.getElementById("return-district");
    var ward = document.getElementById("return-wards");

    var citisSender = document.getElementById("sender-province");
    var districtSender = document.getElementById("sender-district");
    var wardSender = document.getElementById("sender-wards");

    var citiesReceive = document.getElementById("receive-province");
    var districtReceive = document.getElementById("receive-district");
    var wardReceive = document.getElementById("receive-wards");

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
            citisSender.options[citisSender.options.length] = new Option(x.Name, x.Id);
            citiesReceive.options[citiesReceive.options.length] = new Option(x.Name, x.Id);
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
                    ward.options[ward.options.length] = new Option(w.Name, w.Id);
                }
            }
        };


        citisSender.onchange = function () {
            districtSender.length = 1;
            wardSender.length = 1;
            if(this.value != ""){
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    districtSender.options[districtSender.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        districtSender.onchange = function () {
            wardSender.length = 1;
            const dataCity = data.filter((n) => n.Id === citisSender.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wardSender.options[wardSender.options.length] = new Option(w.Name, w.Id);
                }
            }
        };


        citiesReceive.onchange = function () {
            districtReceive.length = 1;
            wardReceive.length = 1;
            if(this.value != ""){
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    districtReceive.options[districtReceive.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        districtReceive.onchange = function () {
            wardReceive.length = 1;
            const dataCity = data.filter((n) => n.Id === citiesReceive.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wardReceive.options[wardReceive.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }
</script>

</body>

</html>