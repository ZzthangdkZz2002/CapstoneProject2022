<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">

    <title>Category</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="assets_onlinepage/css/bootstrap.min.css">

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="assets_onlinepage/css/main.css">
    <link rel="stylesheet" href="assets_onlinepage/css/owl.carousel.css">
    <link rel="stylesheet" href="assets_onlinepage/css/owl.transitions.css">
    <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
    <link href="assets_onlinepage/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets_onlinepage/css/animate.min.css">
    <link rel="stylesheet" href="assets_onlinepage/css/bootstrap-select.min.css">

    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="assets_onlinepage/css/config.css">

    <link href="assets_onlinepage/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">


    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets_onlinepage/images/favicon.ico">

    <style>
    </style>
</head>


<body class="cnt-home">


<jsp:include page="header.jsp"/>

<div class="body-content outer-top-xs" id="top-banner-and-menu">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3 sidebar">
                <div class="side-menu animate-dropdown outer-bottom-xs">
                    <div class="head" style="font-family: Calibri"><i class="icon fa fa-align-justify fa-fw"></i> Danh
                        mục sản phẩm
                    </div>
                    <nav class="yamm megamenu-horizontal" role="navigation">
                        <ul class="nav">
                            <c:forEach var="cate" items="${categories}">
                                <li class="dropdown menu-item">
                                    <a href="${pageContext.request.contextPath}/product?cate=${cate.id}&pageNo=1"
                                       class="dropdown-toggle" data-hover="dropdown">${cate.name}</a>
                                    <ul class="dropdown-menu mega-menu">
                                        <li class="yamm-content">
                                            <div class="row">
                                                <ul class="links list-unstyled">
                                                    <c:forEach var="childCate" items="${cate.childCategories}">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/product?cate=${childCate.id}&pageNo=1">${childCate.name}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9">
                <h3 class="section-title" style="margin-bottom: 20px; font-weight: bold">Sản phẩm</h3>
                <div class="row list-product">
                    <c:forEach var="product" items="${products}">
                        <a href="${pageContext.request.contextPath}/homepage/detailProduct?id=${product.id}"
                           onclick="saveId(${product.id})"></a>
                        <div class="product col-md-4"
                             style="height: 200px;margin-bottom: 20px; border: 0.5px solid #e6e6e6; padding: 5px">
                            <div class="product-micro">
                                <div class="row product-micro-row">
                                    <div class="col col-xs-5">
                                        <div class="product-image" style="  width: 111px;
                height: 20px;">
                                            <div class="image"
                                                 href="${pageContext.request.contextPath}/homepage/detailProduct?id=${product.id}">
                                                <img style="object-fit: cover;"
                                                     src="${pageContext.request.contextPath}/img/${product.image}"
                                                     alt="" width="111px" height="111px"
                                                     onerror="this.src='https://cdn-img.thethao247.vn//storage/files/camhm/2022/10/11/tin-mu-moi-nhat-11-10-ronaldo-duoc-doi-thu-tang-len-may-casemiro-tim-lai-chinh-minh-200731.jpg'">
                                                <div class="zoom-overlay"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-xs-7">
                                        <div class="product-info">
                                            <h3 class="name"><a
                                                    href="${pageContext.request.contextPath}/homepage/detailProduct?id=${product.id}"
                                                    onclick="saveId(${product.id})">${product.name}</a></h3>
                                            <p class="decriptions">${product.description}</p>
                                            <div class="product-price">
                        <span class="price">
                                ${product.price}</span>

                                                <p style="color: ${product.quantity > 0 ? "green" : "red"}">${product.quantity > 0 ? "Còn hàng" : "Liên hệ"}</p>
                                            </div>
                                            <div class="action" style="display:flex;position: absolute;top: 160px">
                                                <button type="button" onclick="addCart(${product.id})"
                                                        class="btn btn-info"
                                                        style="padding: 5px 10px;border:none;font-size:12px;margin-right:10px"
                                                        ;><i class="glyphicon glyphicon-shopping-cart"
                                                             style="margin-right: 2px"></i>Chọn mua
                                                </button>
                                                <a onclick="saveId(${product.id})"
                                                   href="${pageContext.request.contextPath}/homepage/detailProduct?id=${product.id}"
                                                   class="btn btn-info"
                                                   style="padding: 5px 10px;font-size:12px;border:none">Xem</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                </div>


                <div class="pagination-row" style="text-align: center">
                    <div class="pagination-container">
                        <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                            <ul class="pagination">
                                <c:forEach var="i" begin="1" end="${pageNum}">
                                    <c:choose>
                                        <c:when test="${active == i}">
                                            <li class="active paginate_button page-item " id="sampleTable_previous">
                                                <a id="active"
                                                   href="${pageContext.request.contextPath}/product?cate=${category.id}&pageNo=${i}">${i}</a>
                                            </li>
                                        </c:when>

                                        <c:otherwise>
                                            <li class="paginate_button page-item " id="sampleTable_previous">
                                                <a href="${pageContext.request.contextPath}/product?cate=${category.id}&pageNo=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    </section>


</div>
</div>

</div>


<!-- ============================================================= FOOTER ============================================================= -->
<%--<jsp:include page="../customer/footer.jsp"></jsp:include>--%>
<jsp:include page="footer.jsp"></jsp:include>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script>
    const saveId = (id) => {
        console.log("saveid")
        localStorage.setItem('idDetald', id);
    }
</script>
<script>
    const text = document.getElementsByClassName('decriptions');
    for (var i = 0; i < text.length; i++) {
        var result = '';
        if (text[i] == null) {
            result = "";
        } else if (text[i].textContent.length > 40) {
            result = text[i].textContent.toString().substr(0, 40) + '...'
        }
        text[i].textContent = result;
    }
</script>
<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="assets_onlinepage/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/huhu.js"></script>

<script src="assets_onlinepage/js/bootstrap.min.js"></script>

<script src="assets_onlinepage/js/bootstrap-hover-dropdown.min.js"></script>
<script src="assets_onlinepage/js/owl.carousel.min.js"></script>

<script src="assets_onlinepage/js/echo.min.js"></script>
<script src="assets_onlinepage/js/jquery.easing-1.3.min.js"></script>
<script src="assets_onlinepage/js/bootstrap-slider.min.js"></script>
<script src="assets_onlinepage/js/jquery.rateit.min.js"></script>
<script type="text/javascript" src="assets_onlinepage/js/lightbox.min.js"></script>
<script src="assets_onlinepage/js/bootstrap-select.min.js"></script>
<script src="assets_onlinepage/js/wow.min.js"></script>
<script src="assets_onlinepage/js/scripts.js"></script>

<!-- For demo purposes – can be removed on production -->


<!-- For demo purposes – can be removed on production : End -->


</body>


</html>