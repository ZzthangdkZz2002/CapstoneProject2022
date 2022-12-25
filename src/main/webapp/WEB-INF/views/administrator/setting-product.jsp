<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Tuỳ chỉnh sản phẩm | Quản trị Admin</title>
  <meta charset="utf-8">
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
  <!-- Font-icon css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body onload="greaterThanZero()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
  <!-- Navbar Right Menu-->
  <ul class="app-nav">


    <!-- User Menu-->
    <div class="app-nav__button">
      <div class="app-nav__item"><i class='bx bx-cog'></i></div>
      <div class="app-nav__item-content">
        <a href="personal-info.html">Thông tin cá nhân</a>
        <a href="#">Đăng xuất</a>
      </div>
    </div>
  </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="header.jsp"/>
<jsp:include page="home-menu.jsp"/>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item"><a href="#">Quản lý sản phẩm</a></li>
      <li class="breadcrumb-item active">Tuỳ chỉnh sản phẩm</li>
    </ul>
    <div id="clock"></div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="tile-title">Tuỳ chỉnh sản phẩm</h3>
        <div class="tile-body">
<%--          <div class="row element-button">--%>
<%--            <div class="col-sm-2">--%>
<%--              <a class="btn btn-add btn-sm" href="add-product-specification.html" title="Thêm"><i--%>
<%--                      class="fas fa-plus"></i>--%>
<%--                Thêm thông số kỹ thuật</a>--%>
<%--            </div>--%>
<%--          </div>--%>
          <form enctype="multipart/form-data" method="post">
            <div class="row">
              <div class="form-group col-md-3">
                <label class="control-label required-field">Tên sản phẩm</label>
                <input class="form-control" type="text" id="name" value="${productDto.name}" required>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label required-field">Giá vốn</label>
                <input class="form-control" type="number" id="original-price" value="${productDto.original_price}" required>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label required-field">Giá bán</label>
                <input class="form-control" type="number" id="price" value="${productDto.price}" required>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-3">
                <label for="exampleSelect1" class="control-label required-field">Danh mục</label>
                <select class="form-control" id="categoryOption" required>
                  <option selected hidden disabled value="">-- Chọn danh mục --</option>
                  <c:forEach var = "categoryDto" items="${listCategories}">
                    <option value="${categoryDto.id}">${categoryDto.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group col-md-3">
                <button class="side-button btn btn-add" type="button" title="Thêm vào danh sách"
                        onclick="addToCategoryTable()">Thêm
                  vào
                  danh sách</button>
                <button id="deleteButton" type="button" class="side-button btn btn-cancel" title="Xoá"
                        onclick="deleteFromCategoryTable()">Xoá</button>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-5">
                <label for="exampleSelect1" class="control-label">Bảng danh mục</label>
                <table id="categoryTable" class="table table-hover table-bordered js-copytextarea" cellpadding="0"
                       cellspacing="0">
                  <thead>
                  <tr>
                    <th width="200">Mã danh mục</th>
                    <th width="300">Tên danh mục</th>
                  </tr>
                  <c:forEach var="category" items="${productDto.categories}">
                    <tr class="category-items">
                      <td>${category.id}</td>
                      <td>${category.name}</td>
                      <td><input type="checkbox" ></td>
                    </tr>
                  </c:forEach>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-3">
                <label class="control-label required-field">Thương hiệu</label>
                <select class="form-control" id="brandOption" required>
                  <option value="${productDto.brand.id}" selected>${productDto.brand.name}</option>
                  <c:forEach var = "brand" items="${brands}">
                    <option value="${brand.id}">${brand.name}</option>
                  </c:forEach>
                </select>
                <button type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#addBrandModel">
                  Thêm thương hiệu
                </button>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-3">
                <label class="control-label required-field">Đơn vị</label>
                <input class="form-control" id="unit" type="text" value="${productDto.unit}">
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-12">
                <label class="control-label required-field">Chỉnh sửa ảnh</label>

                <input type="file" id="updateFileUpload" name="ImageUpload" accept="image/*" onchange="showPreview(event);">

                <div class="preview">
                  <img src="${pageContext.request.contextPath}/img/${productDto.image}" id="file-ip-1-preview" style="width: 250px; height: 250px;">
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="control-label">Mô tả sản phẩm</label>
                <textarea class="form-control" name="mota" id="mota">${productDto.description}</textarea>
              </div>
            </div>
            <div class="row">
              <div class="confirm-button">
                <div class="button">
                  <button type="submit" class="btn btn-save" onclick="updateProduct(${productDto.id})">Lưu lại</button>
                  <button type="button" class="btn btn-cancel" onclick="location.href='product-management.html'">Hủy
                    bỏ</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</main>
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
            <p class="modal-notify-successful">Thay đổi thông tin sản phẩm thành công</p>
          </div>
        </div>
        <div style="display: flex; justify-content: center; padding: 10px;">
          <a  href="${pageContext.request.contextPath}/admin/products/view/${productDto.id}" style="margin: 5px;" class="btn btn-save" >Đóng</a>
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
MODAL CATEGORY EMPTY
-->
<div class="modal fade" id="categoryEmpty" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
            <p class="modal-notify-unsuccessful">Chưa có danh mục nào được chọn</p>
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
MODAL UNSUCCESSFUL
-->
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
            <p class="modal-notify-unsuccessful" id="reasonUnsucces"></p>
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
<%--Model add brand--%>
<div class="modal fade" id="addBrandModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="color: green">Thêm mới thương hiệu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p id="addBrandError" style="color: red;display: none"></p>
        <div class="form-group">
          <label class="control-label required-field">Tên thương hiệu</label>
          <input class="form-control" id="addBrand" type="text" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="addBrand()">Lưu</button>
      </div>
    </div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/main.js"/>"></script>
<script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
<script src="<c:url value="/resources/data.json"/>"></script>

</body>

</html>