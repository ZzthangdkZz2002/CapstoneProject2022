<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm nhập kho | Quản trị</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/warehouse.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    <!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="header.jsp"/>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="warehouse-home-menu.jsp"/>
<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item"><a href="warehouse-import-management.html"><b>Quản lý nhập
                        kho</b></a>
                    </li>
                    <li class="breadcrumb-item active"><b>Thêm nhập kho</b></li>
                </ul>
                <div id="clock"></div>
            </div>
        </div>
    </div>
    <form>
        <div class="row">
            <div class="row">
                <div class="col-md-8">
                    <div class="tile">
                        <h3 class="tile-title">Thông tin sản phẩm</h3>
                        <div class="row element-button">
                            <div class="col-sm-12">
                                <button class="btn btn-add btn-sm" title="Thêm" data-toggle="modal" data-target="#productList" type="button" onclick="importInfoSelect(this)">
                                    <i class="fas fa-plus"></i>
                                    Thêm sản phẩm
                                </button>
                            </div>
                        </div>
                        <div class="du--lieu-san-pham">
                            <table id="importProductList" class="table table-hover table-bordered form-product">
                                <thead>
                                <tr>
                                    <th>Mã sản phẩm</th>
                                    <th class="order-item-number">Giá bán</th>
                                    <th class="order-item-number" width="200">Tên sản phẩm</th>
                                    <th class="order-item-number">Hình ảnh</th>
                                    <th class="order-item-number" width="100">Đơn giá</th>
                                    <th class="order-item-number" width="10">Số lượng</th>
                                    <th class="order-item-number" width="10">Giảm giá</th>
                                    <th class="order-item-number">Thành tiền</th>
                                    <th width="100" class="order-item-number text-center"
                                        style="text-align: center; vertical-align: middle;">Tuỳ chọn</th>
                                </tr>
                                </thead>
                                <tbody>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="tile">
                        <h3 class="tile-title">Thông tin nhập hàng</h3>
                        <div class="tile-body">
<%--                            <div class="form-group col-md-12">--%>
<%--                                <label for="importDate" class="control-label required-field">Ngày nhập</label>--%>
<%--                                <input class="form-control" type="date" name="birthmonth" id="importDate" onchange="checkDate()" required--%>
<%--                                >--%>
<%--                            </div>--%>
                            <div class="form-group col-md-12">
                                <label for="warehouse" class="control-label required-field">Vị trí lưu
                                    kho</label>
                                <select class="form-control" id="warehouse" required onchange="SelectWarehouse(this.value)">
                                    <option value="0">Chọn ví trí lưu kho</option>
                                    <c:forEach var="warehouse" items="${listWarehouses}">
                                        <option value="${warehouse.id}">${warehouse.wardName}, ${warehouse.districtName},${warehouse.provinceName}</option>
                                    </c:forEach>
                                </select>
                            </div>
    <div class="form-group col-md-12">
        <label for="warehouse" class="control-label required-field">Vị trí lưu sản phẩm</label>
        <select class="form-control" id="warehouseLocation" required>
            <option value="0">Chọn vị trí lưu sản phẩm</option>
            <option>Vui lòng chọn vị trí lưu kho trước</option>
        </select>
    </div>

    <div class="form-group col-md-3">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductLocation">
            Thêm vị trí
        </button>
    </div>

    <div class="form-group col-md-12">
        <label for="supplierSelect" class="control-label required-field">Nhà cung
            cấp</label>
        <select class="form-control" id="supplierSelect" >
            <option value="0">Chọn nhà cung cấp</option>
            <c:forEach items="${listSupplier}" var="supplier">
                <option value="${supplier.id}">${supplier.name}</option>
            </c:forEach>
        </select>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelId">
            Thêm nhà cung cấp
        </button>
    </div>

                            <div class="form-group col-md-12">
                                <label class="control-label">Tổng tiền: </label>
                                <p class="control-all-money-total"><span id="sum">0</span></p>
                            </div>
    <div class="form-group col-md-12">
        <label class="control-label">Tiền trả nhà cung cấp: </label>
        <input type="text" class="form__field money_mustPay" id="moneyMustPay" required="" value="0" style="width: 200px; margin-left: 30px">
    </div>
    <div class="form-group col-md-12">
        <label class="control-label">Tính vào công nợ: </label>
        <p class="control-all-money-total"><span id="debt">0</span></p>
    </div>
                            <div class="row">
                                <div class="tile-footer col-md-12">
                                    <button id="createImport" class="btn btn-primary create-order-button"
                                            type="button">Lưu giao
                                        dịch</button>
                                    <a class="btn btn-primary cancel-order-button" href="order-management.html"
                                       type="button">Huỷ và quay về</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</main>
<!--
PRODUCT MODAL
-->
<div class="modal fade" id="productList" role="dialog" tabindex="-1" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static">
    <div class="modal-dialog info-modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
<%--                                <div class="form-group col-md-5">--%>
<%--                                    <label for="warehouse" class="control-label required-field">Chọn ô chứa</label>--%>
<%--                                    <select class="form-control" id="container" required >--%>
<%--                                        <c:forEach var="container" items="${listContainer}">--%>
<%--                                            <option value = "${container.id}">${container.shelf}-${container.columnIn}-${container.rowIn}</option>--%>

<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>

                                <form>
                                    <div class="modal-search-row">

                                        <button class="btn btn-save" type="button" data-dismiss="modal"
                                                onclick="addToImportTable()"><i class='fas fa-plus'></i>
                                            Thêm vào đơn hàng</button>
                                        <form action="">
                                            <div class="search-container">
                                                <input class="form-control" type="text" placeholder="Tìm kiếm"
                                                       name="search" id="searchText">
                                                <button type="button" onclick="searchProductInImport(1)"><i class="fa fa-search"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                    <table id="products" class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ảnh sản phẩm</th>
                                            <%--                  <th>Số lượng tồn kho</th>--%>
                                            <th>Giá vốn</th>
                                            <th>Giá bán</th>
                                            <th>Chọn</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td>${product.code}</td>
                                                <td>${product.name}</td>
                                                <td><img src="/img/${product.image}" alt="" width="100px;"></td>
                                                    <%--                  <td>${product.available}</td>--%>
                                                <td>${product.original_price}</td>
                                                <td>${product.price}</td>
<%--                                                <td>--%>
<%--                                                    <c:forEach var="categoryDto" items="${product.categories}">--%>
<%--                                                        ${categoryDto.name} ,--%>
<%--                                                    </c:forEach>--%>
<%--                                                </td>--%>
<%--                                                <td>${product.brand.name}</td>--%>
                                                <td>
                                                    <input class="status-checkbox" type="checkbox" data-toggle="modal" data-target="#confirmStatus" name="check1" value="1">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="pagination-row">
                                        <div class="pagination-container">
                                            <%--              <p>${pageNo}</p>--%>
                                            <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                                <ul class="pagination">
                                                    <c:forEach var="i" step="1" begin="1" end="${total<=0 ? 0: total-1}">
                                                        <li class="paginate_button page-item " id="sampleTable_previous">
                                                            <a aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link" onclick="<c:choose><c:when test="${text!=null}">searchProductInImport(1)</c:when><c:otherwise>Pagination(${i})</c:otherwise></c:choose>" >
                                                                    ${i}
                                                            </a>
                                                        </li>
<%--                                                        <c:choose>--%>
<%--                                                            <c:when test="${pageNo == i}">--%>
<%--                                                                <li class="active paginate_button page-item " id="sampleTable_previous" onclick="Pagination(${i})">${i}</li>--%>
<%--                                                            </c:when>--%>
<%--                                                            <c:otherwise>--%>
<%--                                                                <li class="paginate_button page-item " id="sampleTable_previous" onclick="Pagination(${i})">${i}</li>--%>
<%--                                                            </c:otherwise>--%>
<%--                                                        </c:choose>--%>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="modal-confirm-button">
                        <div>
                            <button class="btn btn-cancel" data-dismiss="modal">Hủy bỏ</button>
                        </div>
                    </div>
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
                        <p class="modal-notify-successful">Tạo đơn nhập thành công</p>
                    </div>
                </div>
                <div style="display: flex; justify-content: center; padding: 10px;">
                    <a href="${pageContext.request.contextPath}/admin/warehouses/view/import" style="margin: 5px;" class="btn btn-save">Đóng</a>
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
<!--
MODAL PRODUCT EMPTY
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
                        <p class="modal-notify-unsuccessful">Chưa có sản phẩm trong danh sách</p>
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
<!--
MODAL CHOOSE INFO BEFORE SELECTING PRODUCT
-->

<div class="modal fade" id="selectImportInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
                        <p class="modal-notify-successful">Chọn đầy đủ thông tin trước khi chọn sản phẩm</p>
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

<!-- Add supplier model -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm nhà cung cấp</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row justify-content-between">

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Mã mặc định" name="s_code" id='code' required />
                            <label for="name" class="form__label">Mã nhà cung cấp</label>
                        </div>


                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="s_name" id='supplier_name' required />
                            <label for="name" class="form__label">Tên  nhà cung cấp</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="s_email" name="name" id='supplier_email' required />
                            <label for="name" class="form__label">Email</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="phone" id='supplier_phone' required />
                            <label for="name" class="form__label">Điện thoại</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="company" id='supplier_company' required />
                            <label for="name" class="form__label">Công ty</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="address" id='supplier_address' required />
                            <label for="name" class="form__label">Địa chỉ</label>
                        </div>
                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="tax_code" id='supplier_taxcode' required />
                            <label for="name" class="form__label">Mã số thuế</label>
                        </div>


                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="note" id='supplier_note' required />
                            <label for="name" class="form__label">Ghi chú</label>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa-solid fa-ban mr-2"></i>Huỷ</button>
                <button type="button" class="btn btn-primary"><i class="fa-regular fa-floppy-disk mr-2"></i>Lưu</button>
            </div>
        </div>
    </div>
</div>

<!--
MODAL
-->
<!-- Essential javascripts for application to work-->

<%--Model add brand--%>
<div class="modal fade" id="addProductLocation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="color: green">Thêm mới vị trí</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="addProductLocationError" style="color: red;display: none"></p>
                <div class="form-group col-md-3">
                    <label class="control-label required-field">Tên vị trí</label>
                    <input class="form-control" id="addLocaiton" type="text" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="addProductLocation()">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>

<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script src="<c:url value="/js/api-province.js"/>"></script>
<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
<script src="<c:url value="/resources/data.json"/>"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script>
    $('#exampleModal').on('show.bs.modal', event => {
        var button = $(event.relatedTarget);
        var modal = $(this);
        // Use above variables to manipulate the DOM

    });
</script>
<script>
    var element = document.getElementById("createImport");
    element.addEventListener('click',()=>{
        var importProducts= new Array();
        $(".import-items").each(function (){
            var row = $(this);
            var importProduct = new Object();

            importProduct.product_code = row.find("TD").eq(0).html();
            // importItem.skuId = row.find("TD").eq(1).html();
            // importProduct.import_price = row.find("TD").eq(4).find("INPUT").val();
            importProduct.quantity = row.find("TD").eq(5).find("INPUT").val();
            importProduct.original_price = row.find("TD").eq(4).find("INPUT").val();
            importProduct.discount_price = row.find("TD").eq(6).find("INPUT").val();
            importProduct.total = row.find("TD").eq(7).html();
            // importProduct.containerId =  row.find("TD").eq(8).html();;
            importProducts.push(importProduct);

        });

        var location_name = $( "#warehouseLocation option:selected" ).text();
        var warehouse = new Object();
        warehouse.id = $('#warehouse').val();
        var data1={
            "supplier_id": $('#supplierSelect').val(),
            // importDate: $('#importDate').val(),
            "location_name": location_name,
            "warehouse": warehouse,
            "total_importPrice" : totalMoney.toFixed(0),
            "money_paid" : $('#moneyMustPay').val(),
            "importProducts": importProducts
        };

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/admin/warehouses/import/add",
            data:
                JSON.stringify(data1)
            ,
            // dataType:"text",
            success: function (response){
                console.log(response);
                if(response.status === "00"){
                    $('#successful').modal('show');
                }
                else {
                    console.log(response.message + '\n' + response.data + response.status);
                    $('#reason').html(response.data);
                    $('#unsuccessful').modal('show');
                }

            },
            error: function () {
                return false;
            }

        });
    });
</script>
</body>

</html>