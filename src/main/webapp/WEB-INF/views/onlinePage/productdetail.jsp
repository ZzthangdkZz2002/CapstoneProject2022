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

    <title>Detail</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/bootstrap.min.css">

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/main.css">
    <%--    <link href="<c:url value="assets_onlinepage/css/main.css"/>" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/owl.transitions.css">
    <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
    <link href="${pageContext.request.contextPath}/assets_onlinepage/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/bootstrap-select.min.css">

    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/config.css">

    <link href="${pageContext.request.contextPath}/assets_onlinepage/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">


    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>


    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets_onlinepage/images/favicon.ico">




</head>

<body class="cnt-home">



<jsp:include page="header.jsp"/>


<div class="body-content outer-top-xs">
    <div class='container'>
        <div class='row single-product outer-bottom-sm '>

            <!-- PHẦN CHỨA SILBAR -->


            <div class='col-md-9'>
                <div class="row  wow fadeInUp">
                    <div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
                        <div class="product-item-holder size-big single-product-gallery small-gallery">

                            <div id="owl-single-product">
                                <div class="single-product-gallery-item" id="slide1">
                                    <a data-lightbox="image-1" data-title="Gallery" href="assets_onlinepage/images/single-product/1.jpg">
                                        <img class="img-responsive description-img" alt="" src="${pageContext.request.contextPath}/img/${products.image}"  />
                                    </a>
                                </div><!-- /.single-product-gallery-item -->



                            </div><!-- /.single-product-slider -->




                        </div><!-- /.single-product-gallery -->
                    </div><!-- /.gallery-holder -->
                    <div class='col-sm-6 col-md-7 product-info-block'>
                        <div class="product-info">
                            <h1 class="name" style="font-family: 'Times New Roman'; font-weight: bold;font-size: 3rem; margin-bottom: 20px">${products.name}</h1>
                            <div class="stock-container info-container m-t-10">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="stock-box">
                                            <span class="label" style="font-family: Calibri">Tình trạng :</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="stock-box">
                                            <span class="value" style="color: ${products.quantity > 0 ? "green" : "red"}">${products.quantity > 0 ? "Còn hàng" : "Liên hệ"}</span>
                                        </div>
                                    </div>
                                </div><!-- /.row -->
                            </div><!-- /.stock-container -->

                            <div class="description-container m-t-20">
                                Mã sản phẩm  :  ${products.code}
                            </div><!-- /.description-container -->

                            <div class="price-container info-container m-t-20">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="price-box">
                                            <span class="price">${products.price}₫</span>
                                        </div>
                                    </div>
                                </div><!-- /.row -->
                            </div><!-- /.price-container -->

                            <div class="quantity-container info-container">
                                <div class="row">

                                    <div class="col-sm-2">
                                        <span class="label" style="font-family: Calibri">Số lượng :</span>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="cart-quantity">
                                            <div class="quant-input">

                                                <input type="number" style="width: 80px;" value="1" min="1">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-7 add-cart">
                                        <button  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-shopping-cart inner-right-vs"></i> Thêm vào giỏ hàng</button>
                                    </div>


                                </div><!-- /.row -->
                            </div><!-- /.quantity-container -->




                        </div><!-- /.product-info -->
                    </div><!-- /.col-sm-7 -->
                </div><!-- /.row -->


                <div class="product-tabs inner-bottom-xs  wow fadeInUp">
                    <div class="row">
                        <div class="col-sm-3">
                            <ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
                                <li class="active"><a data-toggle="tab" href="#description" style="font-family: 'Times New Roman'">Mô tả sản phẩm</a></li>

                            </ul><!-- /.nav-tabs #product-tabs -->
                        </div>
                        <div class="col-sm-9">

                            <div class="tab-content">

                                <div id="description" class="tab-pane in active">
                                    <div class="product-tab">
                                        <p class="text">${products.description}<p>
                                        <p class="text"></p>
                                    </div>
                                </div><!-- /.tab-pane -->



                            </div><!-- /.tab-content -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.product-tabs -->

                <!-- ============================================== UPSELL PRODUCTS ============================================== -->
                <%--                <section class="section featured-product wow fadeInUp">--%>
                <%--                    <h3 class="section-title">upsell products</h3>--%>
                <%--                    <div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets_onlinepage/images/blank.gif" data-echo="assets_onlinepage/images/products/4.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag sale"><span>sale</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">LG Smart Phone LP68</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets_onlinepage/images/blank.gif" data-echo="assets_onlinepage/images/products/3.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag sale"><span>sale</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">Apple Iphone 5s 32GB</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/1.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag hot"><span>hot</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">Sony Ericson Vaga</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag new"><span>new</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">Samsung Galaxy S4</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag hot"><span>hot</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">Samsung Galaxy S4</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>

                <%--                        <div class="item item-carousel">--%>
                <%--                            <div class="products">--%>

                <%--                                <div class="product">--%>
                <%--                                    <div class="product-image">--%>
                <%--                                        <div class="image">--%>
                <%--                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/6.jpg" alt=""></a>--%>
                <%--                                        </div><!-- /.image -->--%>

                <%--                                        <div class="tag new"><span>new</span></div>--%>
                <%--                                    </div><!-- /.product-image -->--%>


                <%--                                    <div class="product-info text-left">--%>
                <%--                                        <h3 class="name"><a href="detail.html">Nokia Lumia 520</a></h3>--%>
                <%--                                        <div class="rating rateit-small"></div>--%>
                <%--                                        <div class="description"></div>--%>

                <%--                                        <div class="product-price">--%>
                <%--				<span class="price">--%>
                <%--					$650.99				</span>--%>
                <%--                                            <span class="price-before-discount">$ 800</span>--%>

                <%--                                        </div><!-- /.product-price -->--%>

                <%--                                    </div><!-- /.product-info -->--%>
                <%--                                    <div class="cart clearfix animate-effect">--%>
                <%--                                        <div class="action">--%>
                <%--                                            <ul class="list-unstyled">--%>
                <%--                                                <li class="add-cart-button btn-group">--%>
                <%--                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">--%>
                <%--                                                        <i class="fa fa-shopping-cart"></i>--%>
                <%--                                                    </button>--%>
                <%--                                                    <button class="btn btn-primary" type="button">Add to cart</button>--%>

                <%--                                                </li>--%>

                <%--                                                <li class="lnk wishlist">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">--%>
                <%--                                                        <i class="icon fa fa-heart"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>

                <%--                                                <li class="lnk">--%>
                <%--                                                    <a class="add-to-cart" href="detail.html" title="Compare">--%>
                <%--                                                        <i class="fa fa-retweet"></i>--%>
                <%--                                                    </a>--%>
                <%--                                                </li>--%>
                <%--                                            </ul>--%>
                <%--                                        </div><!-- /.action -->--%>
                <%--                                    </div><!-- /.cart -->--%>
                <%--                                </div><!-- /.product -->--%>

                <%--                            </div><!-- /.products -->--%>
                <%--                        </div><!-- /.item -->--%>
                <%--                    </div><!-- /.home-owl-carousel -->--%>
                <%--                </section><!-- /.section -->--%>
                <!-- ============================================== UPSELL PRODUCTS : END ============================================== -->

            </div><!-- /.col -->
            <div class="clearfix"></div>
        </div><!-- /.row -->

        <!-- ============================================================= FOOTER ============================================================= -->
        <jsp:include page="footer.jsp"></jsp:include>


        <!-- ============================================================= FOOTER : END============================================================= -->


        <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <!-- For demo purposes – can be removed on production : End -->
        <script src="${pageContext.request.contextPath}/assets_onlinepage/js/detaild.js"></script>

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







</body>
</html>