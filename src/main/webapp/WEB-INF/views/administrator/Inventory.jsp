<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inventory</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Custom Icon -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- Bootstrap Date-Picker Plugin -->
    <link type="text/css" rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/alumuko/vanilla-datetimerange-picker@latest/dist/vanilla-datetimerange-picker.css">

    <style>
        body{
            background-color: #f2f2f0  ;
        }
        .heading-page{
            font-size: 1.5rem;
            font-weight: 700;
        }
        .boxLeft{
            margin-bottom: 15px;
            background-color: #fff;
            position: relative;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgb(0 0 0 / 10%);
        }
        .line-under{
            border: none;
            border-bottom: 0.5px solid #d2d4d6;
            padding-bottom: 3px;
        }
        .fa-solid{
            cursor: pointer;
        }
        .time-popup{
            width: 60%;
            padding:50px 10px;
            background-color:white;
            border-radius: 5px;
            position: absolute;
            top:200px;
            left:480px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }
        .hide{
            display:none
        }
        .block{
            display:block
        }
        .calendar-popup{
            width: 230px;
            padding:10px;
            background-color:white;
            border-radius: 5px;
            position: absolute;
            top:295px;
            left:470px;
            border:none;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }
        .datepicker {
            left: 7.823px;
        }
        .table-responsive table {
            height: 30rem;
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }
        .bootstrap-iso .formden_header h2,
        .bootstrap-iso .formden_header p,
        .bootstrap-iso form {
            font-family: Arial, Helvetica, sans-serif;
            color: black
        }
        .bootstrap-iso form button,
        .bootstrap-iso form button:hover {
            color: white !important;
        }
        .asteriskField {
            color: red;
        }
    </style>
</head>
<body class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="header.jsp"/>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="home-menu.jsp"/>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Inventory</b></a></li>
        </ul>
    </div>
    <div class="tile">
        <div class="tile-body">
            <div class="row">
                <div class="col-2">
                    <h1 class="heading-page mt-2">Phiếu nhập kho</h1>
                    <div class="boxLeft mt-5">
                        <h5>Thời gian</h5>
                        <div class="form-check my-3">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="thisMonth">
                            <label class="form-check-label d-flex justify-content-between line-under" for="thisMonth">
                                <span>Tháng này</span>
                                <i class="fa-solid fa-sort pt-1 btn-time"></i>
                            </label>
                        </div>
                        <div class="form-check my-3 ">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="otherChoices">
                            <label class="form-check-label d-flex justify-content-between line-under" for="otherChoices">
                                <span>Lựa chọn khác</span>
                                <i class="fa-solid fa-calendar-days pt-1 input-prefix choose-date" tabindex=0></i>
                            </label>
                        </div>

                    </div>
                    <div class="boxLeft mt-3 py-4">
                        <h5>Người tạo</h5>
                        <input type="text" class="line-under mt-2" name="cus-name" list="pname" style="width: 95%;"
                               placeholder="Chọn người tạo">
                        <datalist id="pname">
                            <option value="Long">
                            <option value="Hải">
                            <option value="Thắng">
                        </datalist>
                    </div>
                </div>
                <div class="col-10">
                    <div class="search-box">
                        <div class="input-group" style="width: 50%;">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="Theo mã phiếu kiểm"
                                   aria-label="Input group example" aria-describedby="btnGroupAddon">
                            <a class="btn btn-add btn-sm ml-3 mt-1" href="${pageContext.request.contextPath}/admin/warehouses/import/add" title="Thêm"><i class="fas fa-plus"></i>
                                Thêm giao dịch mới</a>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table mt-5 table-bordered " id="inventory-table" style="width: 100%;">
                            <thead class="thead" style="background-color: #5FB55F; color: white;">
                            <tr>
                                <th scope="col">Mã nhập kho</th>
                                <th scope="col">Thời gian</th>
                                <th scope="col">Nhà cung cấp</th>
                                <th scope="col">Kho hàng</th>
                                <th scope="col">Người nhập kho</th>
                                <th scope="col">Tổng số lượng</th>
                                <th scope="col">Tổng tiền hàng</th>
                                <th scope="col">Tiền đã trả NCC</th>
                                <th scope="col">Ghi chú</th>

                                <th scope="col"></th>

                            </tr>
                            </thead>

                            <tbody style="background-color: white;">
                            <c:forEach var="inventory" items="${inventories}">
                                <tr>
                                    <th scope="row">${inventory.code}</th>
                                    <td>${inventory.created_date}</td>
                                    <td>${inventory.supplier.name}</td>
                                    <td>Chi nhánh trung tâm</td>
                                    <td>${inventory.creator_name}</td>
                                    <td>${inventory.total_quantity}</td>
                                    <td class="currency-text">${inventory.total_importPrice}</td>
                                    <td style="color: ${inventory.money_paid != inventory.total_importPrice ? "red" :""}" class="currency-text">${inventory.money_paid}</td>
                                    <td>${inventory.note}</td>
                                    <td> <a href="#detailInventory" onclick="showDetailInventory(`${inventory.id}`,`${inventory.code}`,`${inventory.created_date}`,`${inventory.supplier.name}`,`${inventory.creator_name}`)">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
                                    </td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <!-- detail inventory-->

    <div class="tile">
        <div class="tile-body">
            <form  class="mt-4 hide" id="detailInventory" style="display: none">
                <div class="container mt-2">
                    <div class="row pre-info">
                        <div class="col-5 mr-5">
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-4 col-form-label font-weight-bold">Mã nhập hàng:</label>
                                <div class="col-sm-8">
                                    <p id="inventory_code" class="mt-2"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-4 col-form-label font-weight-bold">Thời gian:</label>
                                <div class="col-sm-8">
                                    <p id="inventory_date" class="mt-2"></p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-4 col-form-label font-weight-bold">Nhà cung cấp:</label>
                                <div class="col-sm-8">
                                    <p id="inventory_supplier" class="mt-2"></p>
                                </div>
                            </div>

                        </div>
                        <div class="col-5">

                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-4 col-form-label font-weight-bold">Chi nhánh:</label>
                                <div class="col-sm-8">
                                    <p class="mt-2">Chi nhánh trung tâm</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inputPassword" class="col-sm-4 col-form-label font-weight-bold">Người nhập:</label>
                                <div class="col-sm-8">
                                    <p id="inventory_creatorname" class="mt-2"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h3 style="margin: 20px 0 15px 33px">Thông tin chi tiết hàng nhập</h3>
                    <table class="table" id="importItemTable" style="margin-left: 33px">
                        <thead style="background-color: #5FB55F; color: white;">
                        <tr>
                            <th scope="col">Mã hàng</th>
                            <th scope="col">Tên hàng</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Giảm giá</th>
                            <th scope="col">Giá nhập</th>
                            <th scope="col">Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <%--            <div class="count mt-2 d-flex justify-content-end">--%>
                    <%--                <table>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Tổng số lượng:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">3</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Tổng số mặt hàng:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">1</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Tổng tiền hàng:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">8000</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Giảm giá:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">0</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Tổng cộng:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">9000</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="width:150px;">Tiền đã trả NCC:</td>--%>
                    <%--                        <td style="width:100px; text-align: right;">9000</td>--%>
                    <%--                    </tr>--%>
                    <%--                </table>--%>
                    <%--            </div>--%>
                    <%--            <div class="buttons mt-5 text-center">--%>
                    <%--                <button class="btn btn-success mr-2" type="submit"><i--%>
                    <%--                        class="fa-solid fa-floppy-disk mr-2"></i>Lưu</button>--%>
                    <%--                <button class="btn btn-danger"><i class="fa-solid fa-trash-can mr-2"></i>Hủy bỏ</button>--%>
                    <%--            </div>--%>
                </div>
            </form>
        </div>
    </div>






    <!-- hiển thị time(theo ngày, tháng, năm)  -->
    <div class="time-popup hide">
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <p><strong>Theo ngày</strong></p>
                    <a href="#">Hôm nay</a><br />
                    <a href="#">Hôm qua</a>
                </div>
                <div class="col-2">
                    <p><strong>Theo tuần</strong></p>
                    <a href="#">Tuần này</a><br />
                    <a href="#">Tuần trước</a><br />
                </div>
                <div class="col-2">
                    <p><strong>Theo tháng</strong></p>
                    <a href="#">Tháng này</a><br />
                    <a href="#">Tháng trước</a><br />
                </div>
                <div class="col-2">
                    <p><strong>Theo quý</strong></p>
                    <a href="#">Quý này</a><br />
                    <a href="#">Quý trước</a><br />
                </div>
                <div class="col-2">
                    <p><strong>Theo năm</strong></p>
                    <a href="#">Năm này</a><br />
                    <a href="#">Năm trước</a><br />
                </div>
            </div>
        </div>
    </div>

    <!-- hiển thị calendar  -->
    <input type="text" id="datetimerange-input1" class="calendar-popup hide" size="24" style="text-align:center">
</main>

<script>
    window.addEventListener("load", function (event) {
        new DateRangePicker('datetimerange-input1',
            {
                locale: {
                    format: "DD-MM-YYYY",
                }
            });
    });
    const btntimePopup = document.querySelector('.btn-time')
    const modal = document.querySelector('.time-popup')
    const btnChooseDate = document.querySelector('.choose-date')
    const modalCalendar = document.querySelector('.calendar-popup')
    const thisMonth = document.querySelector('#thisMonth')
    const otherChoices = document.querySelector('#otherChoices')
    function toggleModal() {
        modal.classList.toggle('hide');
        modalCalendar.classList.add("hide");
    }
    function toggleModalCalendar() {
        modalCalendar.classList.toggle('hide')
        modal.classList.add("hide");
    }
    btntimePopup.addEventListener('click', toggleModal)
    btnChooseDate.addEventListener('click', toggleModalCalendar)
    thisMonth.addEventListener('click', toggleModal)
    otherChoices.addEventListener('click', toggleModalCalendar)
    $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        var options={
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        date_input.datepicker(options);
    })
</script>


<!-- Essential javascripts for application to work-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/common.js"></script>
<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
<script src="<c:url value="/resources/data.json"/>"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/alumuko/vanilla-datetimerange-picker@latest/dist/vanilla-datetimerange-picker.js"></script>