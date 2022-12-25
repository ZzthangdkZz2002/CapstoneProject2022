<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            background-color: #dee2e6;
        }

        .bill {
            width: 40%;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            padding: 2rem 1rem 4rem 1rem;
        }

        .bill-header {
            display: flex;
        }

        .bill-header img {
            width: 10rem;
            margin-right: 2rem;
        }

        .bill-main table {
            margin-left: 2rem;
            margin-right: 2rem;
        }
    </style>
</head>

<body>
<div class="bill mt-3 invoice">
    <div class="bill-header">
        <img src="https://yt3.ggpht.com/ytc/AMLnZu9GCNaRZ_9jmsfiK2tgRjAFEXhjcZPyaRcZG79j=s900-c-k-c0x00ffffff-no-rj"
             alt="">
        <div class="header-info">
            <h5>CÔNG TY TNHH ELECTROCO</h5>
            <p>Văn phòng đại diện chi nhánh Hòa Lạc</p>
            <p>Địa chỉ: FPT University, P.D317, khu CNC Hòa Lạc</p>
            <p>ĐT Hotline: 1900 636 980</p>
            <p>Website: electroco.vn</p>
        </div>
    </div>
    <div class="bill-main">
        <h1 class="text-center">HÓA ĐƠN BÁN LẺ</h1>
        <p class="text-center fs-4 text-danger">Số: 00001</p>
        <p class="mt-2 ms-5">Họ tên khách hàng: <span>........</span></p>
        <p class="ms-5">ĐT: <span>........</span></p>
        <p class="ms-5">Địa chỉ: <span>........</span></p>
        <table class="table table-bordered" style="width: 90%;">
            <thead>
            <tr>
                <th scope="col">Số TT</th>
                <th scope="col">Tên hàng hóa</th>
                <th scope="col">Đơn vị tính</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Đơn giá</th>
                <th scope="col">Thuế(VAT)</th>
                <th scope="col">Thành tiền</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            </tbody>
        </table>
        <p class="ms-5">Cộng thành tiền (Viết bằng chữ): <span>............</span></p>
        <div class="d-flex justify-content-end me-3">
            <div class="p-2">Ngày <span>...</span></div>
            <div class="p-2">Tháng <span>...</span></div>
            <div class="p-2">Năm <span>...</span></div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/order-offline.js"></script>

</body>

</html>