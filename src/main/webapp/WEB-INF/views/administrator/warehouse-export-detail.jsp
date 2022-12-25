<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm giao dịch xuất kho | Quản trị</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="header.jsp"/>


<!-- Sidebar menu-->
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/img/avatar.jpg" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}</b></p>
            <p class="app-sidebar__user-designation">
                <sec:authorize access="hasRole('ROLE_MANAGER')">
                    Quản lí
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                    Nhân viên
                </sec:authorize>
            </p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/products"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản
            phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/orders/waiting"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/accounts/system-account"><i class='app-menu__icon bx bx-id-card'></i>
            <span class="app-menu__label">Quản lý tài khoản</span>
        </a>
        </li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/categories"><i class='app-menu__icon bx bx-category'></i><span
                class="app-menu__label">Quản lý danh mục</span></a></li>

        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/suppliers"><i
                class='app-menu__icon bx bxs-user-account'></i><span class="app-menu__label">Quản lý nhà cung cấp
          </span></a></li>
        <li><a class="app-menu__item active" href="${pageContext.request.contextPath}/admin/warehouses"><i
                class='app-menu__icon bx bx-building-house'></i><span class="app-menu__label">Quản lý kho
                        hàng
                    </span></a>
            <ul class="sub-app-menu">
                <li><a class="sub-app-menu_item" href="${pageContext.request.contextPath}/admin/warehouses"><span class="app-menu__label">Kho
                                hàng</span></a></li>
                <li><a class="sub-app-menu_item" href="${pageContext.request.contextPath}/admin/warehouses/view/import"><span
                        class="app-menu__label">Quản lý
                                nhập kho</span></a></li>
                <li><a class="sub-app-menu_item sub-item-active" href="${pageContext.request.contextPath}/admin/warehouses/view/export"><span
                        class="app-menu__label">Quản lý
                                xuất kho</span></a></li>
            </ul>
        </li>
        <sec:authorize access="hasRole('ROLE_MANAGER')">
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/feedbacks"><i class='app-menu__icon bx bx-user-voice'></i><span
                    class="app-menu__label">Feedback</span></a>
            </li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/reports"><i class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
                    class="app-menu__label">Báo cáo thống kê</span></a>
            </li>
        </sec:authorize>
    </ul>
</aside>

<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item"><a href="warehouse-export-management.html"><b>Quản lý xuất
                        kho</b></a>
                    </li>
                    <li class="breadcrumb-item active"><b>Tạo giao dịch xuất kho</b></li>
                </ul>
            </div>
        </div>
    </div>
    <form>
        <div class="row">

            <div class="col-md-9">
                <div class="tile">
                    <h3 class="tile-title">Thông tin sản phẩm</h3>
                    <div class="du--lieu-san-pham">
                        <table id="exportProductList" class="table table-hover table-bordered form-product">
                            <thead>
                            <tr>
                                <th class="order-item-number">Mã sản phẩm</th>
                                <th class="order-item-number">Tên sản phẩm</th>
                                <th class="order-item-number">Hình ảnh</th>
                                <th class="order-item-number" width="10">Tổng số lượng</th>
                                <th class="order-item-number">Kho hàng</th>
                                <th class="order-item-number">Vị trí</th>
                                <%--                                <th class="order-item-number">Số lượng tồn kho</th>--%>
                                <th width="100" class="order-item-number text-center"
                                    style="text-align: center; vertical-align: middle;">Tuỳ chọn
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="o" items="${order.orderTransactionDetails}">
                                <tr>
                                    <td>${o.productDTO.code}</td>
                                    <td>${o.productDTO.name}</td>
                                    <td><img src="/img/${o.productDTO.image}" alt="" width="100px;"></td>
                                    <td >${o.quantity}</td>
                                    <input type="hidden" id="${o.productDTO.id}-quantity-order" value="${o.quantity}">
                                    <td>
                                        <button class="btn btn-add btn-sm" type="button" onclick="findAvailableItemInWarehouse('${o.productDTO.id}')">Tìm kho còn hàng</button>
                                        <select  id="warehouses-list-${o.productDTO.id}" style="display: none;" onchange="genDetailLocation(this.value, '${o.productDTO.id}')">
                                            <option value="0">--------Chọn kho hàng--------</option>
                                        </select>
                                    </td>
                                    <td id="detail-location-${o.productDTO.id}">

                                    </td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="tile">
                    <h3 class="tile-title">Thông tin xuất hàng</h3>
                    <div class="tile-body">
                        <div class="form-group col-md-12">
                            <label for="ExportDate" class="control-label required-field">Mã đơn hàng</label>
                            <p id="order-id" style="font-weight: bold;color: green">#${order.orderid}</p>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="exportName" class="control-label required-field">Họ và tên người xuất
                                kho</label>
                            <input class="form-control" type="text" name="exportName" id="exportName" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}" readonly>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="receive" class="control-label required-field">Họ và tên người
                                nhận</label>
                            <input class="form-control" type="text" name="receive" id="receive" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ghi chú</label>
                            <textarea class="form-control" name="mota" id="mota"></textarea>
                        </div>
                        <div class="row">
                            <div class="tile-footer col-md-12">
                                <button class="btn btn-primary create-order-button" style="margin-left: 8px" onclick="handleSubmit()" type="button">Lưu
                                    giao
                                    dịch</button>
                                <a class="btn btn-primary cancel-order-button"
                                   href="warehouse-export-management.html" type="button">Huỷ và quay về</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</main>
<!--
ORDER LIST MODAL
-->
<%--<div class="modal fade" id="productList" role="dialog" tabindex="-1" aria-labelledby="exampleModalCenterTitle"--%>
<%--     data-backdrop="static">--%>
<%--    <div class="modal-dialog info-modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-body">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="tile">--%>
<%--                            <div class="tile-body">--%>
<%--                                <form>--%>
<%--                                    <c:if test="${notFound!=null}">${notFound}</c:if>--%>
<%--                                    <c:if test="${notFound==null}">--%>
<%--                                        <div class="modal-search-row-export">--%>
<%--                                            <form action="">--%>
<%--                                                <div class="search-container">--%>
<%--                                                    <input class="form-control" type="text" placeholder="Tìm kiếm"--%>
<%--                                                           name="search">--%>
<%--                                                    <button type="submit"><i class="fa fa-search"></i></button>--%>
<%--                                                </div>--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                        <table id="orders" class="table table-hover table-bordered">--%>

<%--                                            <thead>--%>
<%--                                            <tr>--%>
<%--                                                <th width="100">Mã đơn hàng</th>--%>
<%--                                                <th>Số điện thoại đặt hàng</th>--%>
<%--                                                <th>Ngày đặt hàng</th>--%>
<%--                                                <th>Tổng tiền</th>--%>
<%--                                                <th width="100">Chọn</th>--%>
<%--                                            </tr>--%>
<%--                                            </thead>--%>

<%--                                            <tbody id="listItems">--%>
<%--                                            <c:forEach var="order" items="${listOrders}">--%>
<%--                                                <tr class="items" onclick="getItems(this)">--%>
<%--                                                    <td>${order.id}</td>--%>
<%--                                                    <td>${order.accountCustomerPhone}</td>--%>
<%--                                                    <td>${order.orderedDate}</td>--%>
<%--                                                    <td>${order.totalPayment}</td>--%>
<%--                                                    <td>--%>
<%--                                                        <button class="btn btn-add btn-sm" title="Chọn" type="button"--%>
<%--                                                                data-dismiss="modal" onclick="addToExportProductTable(this)">--%>
<%--                                                            <i class="fas fa-plus"></i></button>--%>
<%--                                                    </td>--%>
<%--                                                </tr>--%>
<%--                                            </c:forEach>--%>


<%--                                            </tbody>--%>
<%--                                        </table>--%>
<%--                                        <div class="pagination-row">--%>
<%--                                            <div class="pagination-container">--%>
<%--                                                <div class="dataTables_paginate paging_simple_numbers"--%>
<%--                                                     id="sampleTable_paginate">--%>
<%--                                                    <ul class="pagination">--%>
<%--                                                        <li class="paginate_button page-item previous disabled"--%>
<%--                                                            id="sampleTable_previous"><a href="#"--%>
<%--                                                                                         aria-controls="sampleTable" data-dt-idx="0" tabindex="0"--%>
<%--                                                                                         class="page-link">Lùi</a></li>--%>
<%--                                                        <li class="paginate_button page-item active"><a href="#"--%>
<%--                                                                                                        aria-controls="sampleTable" data-dt-idx="1" tabindex="0"--%>
<%--                                                                                                        class="page-link">1</a></li>--%>
<%--                                                        <li class="paginate_button page-item "><a href="#"--%>
<%--                                                                                                  aria-controls="sampleTable" data-dt-idx="2" tabindex="0"--%>
<%--                                                                                                  class="page-link">2</a></li>--%>
<%--                                                        <li class="paginate_button page-item next"--%>
<%--                                                            id="sampleTable_next"><a href="#"--%>
<%--                                                                                     aria-controls="sampleTable" data-dt-idx="3" tabindex="0"--%>
<%--                                                                                     class="page-link">Tiếp</a></li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </c:if>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="row">--%>
<%--                    <div class="modal-confirm-button">--%>
<%--                        <div>--%>
<%--                            <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!--
MODAL
-->

<!--
MODAL DELETE PRODUCT
-->
<div class="modal fade" id="deleteProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chú ý</h5>
                            </span>
                    </div>
                    <div class="form-group col-md-12" style="text-align: center;">
                        <label class="control-label">Bạn có chắc chắn xoá sản phẩm này khỏi danh sách</label>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <a style="margin: 5px;" class="btn btn-save btn-confirm" data-dismiss="modal" href="#">Xác
                        nhận</a>
                    <a style="margin: 5px;" class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->

<!--
MODAL MORE THAN ONE ORDER
-->
<div class="modal fade" id="moreThanOneOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Thông báo</h5>
                            </span>
                    </div>
                    <div class="form-group col-md-12" style="text-align: center;">
                        <p class="modal-notify-successful">Đơn hàng đã được chọn</p>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <button style="margin: 5px;" class="btn btn-save" data-dismiss="modal">Quay lại</button>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->
-->

<!--
MODAL SUCCESSFUL
-->
<div class="modal fade" id="successful" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Thông báo</h5>
                            </span>
                    </div>
                    <div class="form-group col-md-12" style="text-align: center;">
                        <p class="modal-notify-successful">Tạo giao dịch xuất thành công</p>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <a href="${pageContext.request.contextPath}/admin/warehouses/view/export" style="margin: 5px;" class="btn btn-save" >Đóng</a>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->
<!--
MODAL ORDER EMPTY
-->
<div class="modal fade" id="productEmpty" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Thông báo</h5>
                            </span>
                    </div>
                    <div class="form-group col-md-12" style="text-align: center;">
                        <p class="modal-notify-successful">Chưa có đơn hàng nào được chọn</p>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <button style="margin: 5px;" class="btn btn-save" data-dismiss="modal">Quay lại</button>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="unsuccessful" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thông báo</h5>
              </span>
                    </div>
                    <div class="form-group col-md-12" style="text-align: center;">
                        <p class="modal-notify-unsuccessful" id="reason"></p>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <button style="margin: 5px;" class="btn btn-save" data-dismiss="modal">Đóng</button>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--
MODAL
-->
<!-- Essential javascripts for application to work-->
<script src="${pageContext.request.contextPath}/js/exportItem.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
<script src="<c:url value="/resources/data.json"/>"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script>
    var element = document.getElementById("createExport");
    element.addEventListener('click',()=>{
        var exportItems= new Array();
        $(".export-items").each(function (){
            var row = $(this);
            var exportItem = new Object();
            exportItem.skuId = row.find("TD").eq(4).find("select").find("option:selected" ).text();
            exportItem.quantity = row.find("TD").eq(5).find("INPUT").val();
            exportItems.push(exportItem);
        });
        var data1={
            orderId:$('#order-id').text(),
            exportPerson: $('#exportName').val(),
            exportDate: $('#ExportDate').val(),
            receivedPerson:$('#receive').val(),
            description:$('#mota').val(),
            exportItems: exportItems
        };
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/warehouses/export/add",
            data:
                JSON.stringify(data1)
            ,
            dataType:"text",
            success: function (response){
                if(response === "thành công"){
                    $('#successful').modal('show');
                }
                else {
                    $('#reason').innerHTML = response;
                    $('#unsuccessful').modal('show');
                }
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        var opener;
        $('.modal').on('show.bs.modal', function (e) {
            opener = document.activeElement;
        });
        $('.modal .btn-confirm').click(function () {
            if (document.getElementById("orderProductList") != null) {
                console.log(opener.className);
                var index;
                if (opener.className == "minus-btn") {
                    index = opener.parentNode.parentNode.parentNode.rowIndex;
                } else {
                    index = opener.parentNode.parentNode.rowIndex;
                }
                var tableOrder = document.getElementById("orderProductList");
                tableOrder.deleteRow(index);
                setSumOrder();
            }
            if (document.getElementById("importProductList") != null) {
                var index;
                if (opener.className == "minus-btn") {
                    index = opener.parentNode.parentNode.parentNode.rowIndex;
                } else {
                    index = opener.parentNode.parentNode.rowIndex;
                }
                var tableImport = document.getElementById("importProductList");
                tableImport.deleteRow(index);
                setSumImport();
            }
            if (document.getElementById("exportProductList") != null) {
                var index;
                if (opener.className == "minus-btn") {
                    index = opener.parentNode.parentNode.parentNode.rowIndex;
                } else {
                    index = opener.parentNode.parentNode.rowIndex;
                }
                var tableExport = document.getElementById("exportProductList");
                tableExport.deleteRow(index);
            }
        });
    });
</script>
</body>

</html>