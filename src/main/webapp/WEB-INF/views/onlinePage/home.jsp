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
                <div class="sidebar-widget outer-bottom-small wow fadeInUp">
                    <h3 class="section-title">Special Offer</h3>
                    <div class="sidebar-widget-body">
                        <div class="owl-carousel sidebar-carousel special-offer custom-carousel owl-theme outer-top-xs">
                            <div class="item">
                                <div class="products special-product">
                                    <%--                                    list ra các sản phầm--%>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row" style="border: 0.5px solid #e6e6e6; padding: 8px">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href=""
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img src="https://cf.shopee.vn/file/d9f15835b782f90027996bad8ad501f3" alt="" style="width: 100%">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div>

                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Simple Product</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="btn btn-info">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row" style="border: 0.5px solid #e6e6e6; padding: 8px">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href=""
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img src="https://cf.shopee.vn/file/d9f15835b782f90027996bad8ad501f3" alt="" style="width: 100%">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div>

                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Simple Product</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="btn btn-info">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="products special-product">
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm1.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm1.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->


                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Simple Product</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm2.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm2.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->


                                                        <div class="tag tag-micro sale">
                                                            <span>sale</span>
                                                        </div>
                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Canon EOS 60D</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm3.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm3.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->


                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Sony Camera X30</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="products special-product">
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm1.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm1.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->

                                                        <div class="tag tag-micro new">
                                                            <span>new</span>
                                                        </div>

                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Simple Product</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm2.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm2.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->
                                                        <div class="tag tag-micro hot">
                                                            <span>hot</span>
                                                        </div>


                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Canon EOS 60D</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                    <div class="product">
                                        <div class="product-micro">
                                            <div class="row product-micro-row">
                                                <div class="col col-xs-5">
                                                    <div class="product-image">
                                                        <div class="image">
                                                            <a href="assets/images/products/sm3.jpg"
                                                               data-lightbox="image-1" data-title="Nunc ullamcors">
                                                                <img data-echo="assets/images/products/sm3.jpg"
                                                                     src="assets/images/blank.gif" alt="">
                                                                <div class="zoom-overlay"></div>
                                                            </a>
                                                        </div><!-- /.image -->


                                                    </div><!-- /.product-image -->
                                                </div><!-- /.col -->
                                                <div class="col col-xs-7">
                                                    <div class="product-info">
                                                        <h3 class="name"><a href="#">Sony Camera X30</a></h3>
                                                        <div class="rating rateit-small"></div>
                                                        <div class="product-price">
																<span class="price">
																	$650.99 </span>

                                                        </div><!-- /.product-price -->
                                                        <div class="action"><a href="#"
                                                                               class="lnk btn btn-primary">Add To Cart</a></div>
                                                    </div>
                                                </div><!-- /.col -->
                                            </div><!-- /.product-micro-row -->
                                        </div><!-- /.product-micro -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.sidebar-widget-body -->
                </div>


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

<!--/.Our branch-->
<%--<div id="brands-carousel" class="logo-slider wow fadeInUp">--%>

<%--    <h3 class="section-title">Our Brands</h3>--%>
<%--    <div class="logo-slider-inner">--%>
<%--        <div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">--%>
<%--            <div class="item m-t-15">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand1.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item m-t-10">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand2.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand3.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--           --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand4.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand5.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand6.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand2.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand4.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand1.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>

<%--            <div class="item">--%>
<%--                <a href="#" class="image">--%>
<%--                    <img data-echo="assets/images/brands/brand5.png" src="assets/images/blank.gif" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            --%>
<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>
<%--</div>--%>
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