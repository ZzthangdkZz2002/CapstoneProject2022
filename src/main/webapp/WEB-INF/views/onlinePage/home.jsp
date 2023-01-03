<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <title>Home</title>

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

<body>

<body class="cnt-home">



<jsp:include page="header.jsp"/>

<div class="body-content outer-top-xs" id="top-banner-and-menu">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-3 sidebar">

                <div class="side-menu animate-dropdown outer-bottom-xs">
                    <div class="head" style="font-family: Calibri"><i class="icon fa fa-align-justify fa-fw"></i> Danh mục sản phẩm</div>
                    <nav class="yamm megamenu-horizontal" role="navigation">
                        <ul class="nav">
                            <c:forEach var="cate" items="${categories}">
                                <li class="dropdown menu-item">
                                    <a href="${pageContext.request.contextPath}/product?cate=${cate.id}&pageNo=1" class="dropdown-toggle" data-hover="dropdown">${cate.name}</a>
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


                <%--                Left products--%>


            </div>
            <div class="col-xs-12 col-sm-12 col-md-9">
                <div id="hero"  style="margin-bottom: 20px;">
                    <div id="owl-main" class="owl-carousel silder4 owl-inner-nav owl-ui-sm">
                        <div class="item" style="background-image: url('https://lucluclac.com/wp-content/uploads/2020/02/banner-1-1475x461.jpg');">
                        </div><!-- /.item -->

                        <div class="item" style="background-image: url('https://khonggianhoanmy.files.wordpress.com/2021/09/dich-vu-don-dep-ve-sinh-khong-gian-hoan-my-uy-tin-chat-luong-hieu-qua-chiem-duoc-nhieu-su-tin-tuong-tu-khach-hang-870x368-1.jpg');">
                        </div><!-- /.item -->

                        <div class="item" style="background-image: url('https://beeo.nl/wp-content/uploads/2019/05/GmzGWinter_2017_cut-870x368.jpg');">
                        </div><!-- /.item -->
                    </div>
                </div>
                <h3 class="section-title" style="margin-bottom: 20px; font-weight: bold">Sản phẩm</h3>

                <div class="row list-product">

                </div>
            </div>

        </div>


    </div>
    </section>


</div>
</div>

</div>




<!-- ============================================================= FOOTER ============================================================= -->
<jsp:include page="footer.jsp"></jsp:include>

<script>var contextPath = "${pageContext.request.contextPath}"</script>

<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="assets_onlinepage/js/jquery-1.11.1.min.js"></script>
<script src="assets_onlinepage/js/onlinepage.js"></script>

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

</body>

</html>