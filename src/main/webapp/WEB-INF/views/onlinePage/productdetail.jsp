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

    <!-- ============================================== NAVBAR ============================================== -->
    <div class="header-nav animate-dropdown">
        <div class="container">
            <div class="yamm navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="nav-bg-class">
                    <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
                        <div class="nav-outer">
                            <ul class="nav navbar-nav">
                                <li class="active dropdown yamm-fw">
                                    <a href="home.html" data-hover="dropdown" class="dropdown-toggle" data-toggle="dropdown">Home</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <div class="yamm-content">
                                                <div class="row">
                                                    <div class="col-md-8 col-sm-8">
                                                        <div class="row">
                                                            <div class='col-md-12'>

                                                                <div class="col-xs-12 col-sm-6 col-md-3">
                                                                    <h2 class="title">Computer</h2>
                                                                    <ul class="links">
                                                                        <li><a href="#">Lenovo</a></li>
                                                                        <li><a href="#">Microsoft </a></li>
                                                                        <li><a href="#">Fuhlen</a></li>
                                                                        <li><a href="#">Longsleeves</a></li>
                                                                    </ul>
                                                                </div><!-- /.col -->

                                                                <div class="col-xs-12 col-sm-6 col-md-3">
                                                                    <h2 class="title">Camera</h2>
                                                                    <ul class="links">
                                                                        <li><a href="#">Fuhlen</a></li>
                                                                        <li><a href="#">Lenovo</a></li>
                                                                        <li><a href="#">Microsoft </a></li>
                                                                        <li><a href="#">Longsleeves</a></li>
                                                                    </ul>
                                                                </div><!-- /.col -->

                                                                <div class="col-xs-12 col-sm-6 col-md-3">
                                                                    <h2 class="title">Apple Store</h2>
                                                                    <ul class="links">
                                                                        <li><a href="#">Longsleeves</a></li>
                                                                        <li><a href="#">Fuhlen</a></li>
                                                                        <li><a href="#">Lenovo</a></li>
                                                                        <li><a href="#">Microsoft </a></li>
                                                                    </ul>
                                                                </div><!-- /.col -->

                                                                <div class="col-xs-12 col-sm-6 col-md-3">
                                                                    <h2 class="title">Smart Phone</h2>
                                                                    <ul class="links">
                                                                        <li><a href="#">Microsoft </a></li>
                                                                        <li><a href="#">Longsleeves</a></li>
                                                                        <li><a href="#">Fuhlen</a></li>
                                                                        <li><a href="#">Lenovo</a></li>

                                                                    </ul>
                                                                </div><!-- /.col -->

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                    </div>
                                                </div><!-- /.row -->



                                                <!-- ============================================== WIDE PRODUCTS : END ============================================== -->

                                            </div><!-- /.yamm-content -->					</li>
                                    </ul>
                                </li>
                                <li class="dropdown yamm">
                                    <a href="home.html" data-hover="dropdown" class="dropdown-toggle" data-toggle="dropdown">Desktop</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <div class="yamm-content">
                                                <div class="row">
                                                    <div class='col-sm-12'>
                                                        <div class="col-xs-12 col-sm-12 col-md-4">
                                                            <h2 class="title">Laptops &amp; Notebooks</h2>
                                                            <ul class="links">
                                                                <li><a href="#">Power Supplies Power</a></li>
                                                                <li><a href="#">Power Supply Testers Sound </a></li>
                                                                <li><a href="#">Sound Cards (Internal)</a></li>
                                                                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                                                                <li><a href="#">Other</a></li>
                                                            </ul>
                                                        </div><!-- /.col -->

                                                        <div class="col-xs-12 col-sm-12 col-md-4">
                                                            <h2 class="title">Computers &amp; Laptops</h2>
                                                            <ul class="links">
                                                                <li><a href="#">Computer Cases &amp; Accessories</a></li>
                                                                <li><a href="#">CPUs, Processors</a></li>
                                                                <li><a href="#">Fans, Heatsinks &amp; Cooling</a></li>
                                                                <li><a href="#">Graphics, Video Cards</a></li>
                                                                <li><a href="#">Interface, Add-On Cards</a></li>
                                                                <li><a href="#">Laptop Replacement Parts</a></li>
                                                                <li><a href="#">Memory (RAM)</a></li>
                                                                <li><a href="#">Motherboards</a></li>
                                                                <li><a href="#">Motherboard &amp; CPU Combos</a></li>
                                                                <li><a href="#">Motherboard Components &amp; Accs</a></li>
                                                            </ul>
                                                        </div><!-- /.col -->

                                                        <div class="col-xs-12 col-sm-12 col-md-4">
                                                            <h2 class="title">Dekstop Parts</h2>
                                                            <ul class="links">
                                                                <li><a href="#">Power Supplies Power</a></li>
                                                                <li><a href="#">Power Supply Testers Sound</a></li>
                                                                <li><a href="#">Sound Cards (Internal)</a></li>
                                                                <li><a href="#">Video Capture &amp; TV Tuner Cards</a></li>
                                                                <li><a href="#">Other</a></li>
                                                            </ul>
                                                        </div><!-- /.col -->
                                                    </div>
                                                </div><!-- /.row -->
                                            </div><!-- /.yamm-content -->					</li>
                                    </ul>
                                </li>

                                <li class="dropdown">

                                    <a href="category.html">Electronics
                                        <span class="menu-label hot-menu hidden-xs">hot</span>
                                    </a>
                                </li>
                                <li class="dropdown hidden-sm">

                                    <a href="category.html">Television
                                        <span class="menu-label new-menu hidden-xs">new</span>
                                    </a>
                                </li>

                                <li class="dropdown hidden-sm">
                                    <a href="category.html">Smart Phone</a>
                                </li>

                                <li class="dropdown">
                                    <a href="contact.html">Contact</a>
                                </li>

                                <li class="dropdown navbar-right">
                                    <a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown">Pages</a>
                                    <ul class="dropdown-menu pages">
                                        <li>
                                            <div class="yamm-content">
                                                <div class="row">

                                                    <div class='col-xs-12 col-sm-4 col-md-4'>
                                                        <ul class='links'>
                                                            <li><a href="home.html">Home I</a></li>
                                                            <li><a href="home2.html">Home II</a></li>
                                                            <li><a href="category.html">Category</a></li>
                                                            <li><a href="category-2.html">Category II</a></li>
                                                            <li><a href="detail.html">Detail</a></li>
                                                            <li><a href="detail2.html">Detail II</a></li>
                                                            <li><a href="shopping-cart.html">Shopping Cart Summary</a></li>

                                                        </ul>
                                                    </div>
                                                    <div class='col-xs-12 col-sm-4 col-md-4'>
                                                        <ul class='links'>
                                                            <li><a href="checkout.html">Checkout</a></li>
                                                            <li><a href="blog.html">Blog</a></li>
                                                            <li><a href="blog-details.html">Blog Detail</a></li>
                                                            <li><a href="contact.html">Contact</a></li>
                                                            <li><a href="homepage1.html">Homepage 1</a></li>
                                                            <li><a href="homepage2.html">Homepage 2</a></li>
                                                            <li><a href="home-furniture.html">Home Furniture</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class='col-xs-12 col-sm-4 col-md-4'>
                                                        <ul class='links'>
                                                            <li><a href="sign-in.html">Sign In</a></li>
                                                            <li><a href="my-wishlist.html">Wishlist</a></li>
                                                            <li><a href="terms-conditions.html">Terms and Condition</a></li>
                                                            <li><a href="track-orders.html">Track Orders</a></li>
                                                            <li><a href="product-comparison.html">Product-Comparison</a></li>
                                                            <li><a href="faq.html">FAQ</a></li>
                                                            <li><a href="404.html">404</a></li>
                                                        </ul>

                                                    </div>

                                                </div>
                                            </div>
                                        </li>


                                    </ul>
                                </li>

                            </ul><!-- /.navbar-nav -->
                            <div class="clearfix"></div>
                        </div><!-- /.nav-outer -->
                    </div><!-- /.navbar-collapse -->


                </div><!-- /.nav-bg-class -->
            </div><!-- /.navbar-default -->
        </div><!-- /.container-class -->

    </div><!-- /.header-nav -->

</header>


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
                            <h1 class="name">${products.name}</h1>



                            <div class="stock-container info-container m-t-10">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="stock-box">
                                            <span class="label">Tình trạng :</span>
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
                                        <span class="label">Số lượng :</span>
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
                                <li class="active"><a data-toggle="tab" href="#description">Mô tả sản phẩm</a></li>

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
                <section class="section featured-product wow fadeInUp">
                    <h3 class="section-title">upsell products</h3>
                    <div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets_onlinepage/images/blank.gif" data-echo="assets_onlinepage/images/products/4.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag sale"><span>sale</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">LG Smart Phone LP68</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets_onlinepage/images/blank.gif" data-echo="assets_onlinepage/images/products/3.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag sale"><span>sale</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">Apple Iphone 5s 32GB</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/1.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag hot"><span>hot</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">Sony Ericson Vaga</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag new"><span>new</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">Samsung Galaxy S4</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/2.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag hot"><span>hot</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">Samsung Galaxy S4</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->

                        <div class="item item-carousel">
                            <div class="products">

                                <div class="product">
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="detail.html"><img  src="assets/images/blank.gif" data-echo="assets/images/products/6.jpg" alt=""></a>
                                        </div><!-- /.image -->

                                        <div class="tag new"><span>new</span></div>
                                    </div><!-- /.product-image -->


                                    <div class="product-info text-left">
                                        <h3 class="name"><a href="detail.html">Nokia Lumia 520</a></h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">
				<span class="price">
					$650.99				</span>
                                            <span class="price-before-discount">$ 800</span>

                                        </div><!-- /.product-price -->

                                    </div><!-- /.product-info -->
                                    <div class="cart clearfix animate-effect">
                                        <div class="action">
                                            <ul class="list-unstyled">
                                                <li class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </button>
                                                    <button class="btn btn-primary" type="button">Add to cart</button>

                                                </li>

                                                <li class="lnk wishlist">
                                                    <a class="add-to-cart" href="detail.html" title="Wishlist">
                                                        <i class="icon fa fa-heart"></i>
                                                    </a>
                                                </li>

                                                <li class="lnk">
                                                    <a class="add-to-cart" href="detail.html" title="Compare">
                                                        <i class="fa fa-retweet"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- /.action -->
                                    </div><!-- /.cart -->
                                </div><!-- /.product -->

                            </div><!-- /.products -->
                        </div><!-- /.item -->
                    </div><!-- /.home-owl-carousel -->
                </section><!-- /.section -->
                <!-- ============================================== UPSELL PRODUCTS : END ============================================== -->

            </div><!-- /.col -->
            <div class="clearfix"></div>
        </div><!-- /.row -->
        <!-- ============================================== BRANDS CAROUSEL ============================================== -->
        <div id="brands-carousel" class="logo-slider wow fadeInUp">

            <h3 class="section-title">Our Brands</h3>
            <div class="logo-slider-inner">
                <div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">
                    <div class="item m-t-15">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand1.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item m-t-10">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand2.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand3.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand4.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand5.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand6.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand2.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand4.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand1.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->

                    <div class="item">
                        <a href="#" class="image">
                            <img data-echo="assets/images/brands/brand5.png" src="assets/images/blank.gif" alt="">
                        </a>
                    </div><!--/.item-->
                </div><!-- /.owl-carousel #logo-slider -->
            </div><!-- /.logo-slider-inner -->

        </div><!-- /.logo-slider -->
        <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->

<!-- ============================================================= FOOTER ============================================================= -->
<footer id="footer" class="footer color-bg">
    <div class="links-social inner-top-sm">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <!-- ============================================================= CONTACT INFO ============================================================= -->
                    <div class="contact-info">
                        <div class="footer-logo">
                            <div class="logo">
                                <a href="home.html">

                                    <img src="assets/images/logo.png" alt="">

                                </a>
                            </div><!-- /.logo -->

                        </div><!-- /.footer-logo -->

                        <div class="module-body m-t-20">
                            <p class="about-us"> Nam libero tempore, cum soluta nobis est ses  eligendi optio cumque cum soluta nobis est ses  eligendi optio cumque.</p>

                            <div class="social-icons">

                                <a href="http://facebook.com/transvelo" class='active'><i class="icon fa fa-facebook"></i></a>
                                <a href="#"><i class="icon fa fa-twitter"></i></a>
                                <a href="#"><i class="icon fa fa-linkedin"></i></a>
                                <a href="#"><i class="icon fa fa-rss"></i></a>
                                <a href="#"><i class="icon fa fa-pinterest"></i></a>

                            </div><!-- /.social-icons -->
                        </div><!-- /.module-body -->

                    </div><!-- /.contact-info -->
                    <!-- ============================================================= CONTACT INFO : END ============================================================= -->            	</div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <!-- ============================================================= CONTACT TIMING============================================================= -->
                    <div class="contact-timing">
                        <div class="module-heading">
                            <h4 class="module-title">opening time</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body outer-top-xs">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                    <tr><td>Monday-Friday:</td><td class="pull-right">08.00 To 18.00</td></tr>
                                    <tr><td>Saturday:</td><td class="pull-right">09.00 To 20.00</td></tr>
                                    <tr><td>Sunday:</td><td class="pull-right">10.00 To 20.00</td></tr>
                                    </tbody>
                                </table>
                            </div><!-- /.table-responsive -->
                            <p class='contact-number'>Hot Line:(400)888 868 848</p>
                        </div><!-- /.module-body -->
                    </div><!-- /.contact-timing -->
                    <!-- ============================================================= CONTACT TIMING : END ============================================================= -->            	</div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <!-- ============================================================= LATEST TWEET============================================================= -->
                    <div class="latest-tweet">
                        <div class="module-heading">
                            <h4 class="module-title">latest tweet</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body outer-top-xs">
                            <div class="re-twitter">
                                <div class="comment media">
                                    <div class='pull-left'>
                    <span class="icon fa-stack fa-lg">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                    </span>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">@laurakalbag</a> As a result of your previous recommendation :)
                                        <span class="time">
                        12 hours ago
                    </span>
                                    </div>
                                </div>

                            </div>
                            <div class="re-twitter">
                                <div class="comment media">
                                    <div class='pull-left'>
                    <span class="icon fa-stack fa-lg">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                    </span>
                                    </div>
                                    <div class="media-body">
                                        <a href="#">@laurakalbag</a> As a result of your previous recommendation :)
                                        <span class="time">
                        12 hours ago
                    </span>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.module-body -->
                    </div><!-- /.contact-timing -->
                    <!-- ============================================================= LATEST TWEET : END ============================================================= -->            	</div><!-- /.col -->

                <div class="col-xs-12 col-sm-6 col-md-3">
                    <!-- ============================================================= INFORMATION============================================================= -->
                    <div class="contact-information">
                        <div class="module-heading">
                            <h4 class="module-title">information</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body outer-top-xs">
                            <ul class="toggle-footer" style="">
                                <li class="media">
                                    <div class="pull-left">
                     <span class="icon fa-stack fa-lg">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
                    </span>
                                    </div>
                                    <div class="media-body">
                                        <p>868 Any Stress,Burala Casi,Picasa USA.</p>
                                    </div>
                                </li>

                                <li class="media">
                                    <div class="pull-left">
                     <span class="icon fa-stack fa-lg">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-mobile fa-stack-1x fa-inverse"></i>
                    </span>
                                    </div>
                                    <div class="media-body">
                                        <p>(400) 0888 888 888<br>(400) 888 888 888</p>
                                    </div>
                                </li>

                                <li class="media">
                                    <div class="pull-left">
                     <span class="icon fa-stack fa-lg">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
                    </span>
                                    </div>
                                    <div class="media-body">
                                        <span><a href="#">Contact @Unicase.com</a></span><br>
                                        <span><a href="#">Sale @Unicase.com</a></span>
                                    </div>
                                </li>

                            </ul>
                        </div><!-- /.module-body -->
                    </div><!-- /.contact-timing -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.links-social -->

        <div class="footer-bottom inner-bottom-sm">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="module-heading outer-bottom-xs">
                            <h4 class="module-title">category</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body">
                            <ul class='list-unstyled'>
                                <li><a href="#">Order History</a></li>
                                <li><a href="#">Returns</a></li>
                                <li><a href="#">Libero Sed rhoncus</a></li>
                                <li><a href="#">Venenatis augue tellus</a></li>
                                <li><a href="#">My Vouchers</a></li>
                            </ul>
                        </div><!-- /.module-body -->
                    </div><!-- /.col -->

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="module-heading outer-bottom-xs">
                            <h4 class="module-title">my account</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body">
                            <ul class='list-unstyled'>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Customer Service</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Site Map</a></li>
                                <li><a href="#">Search Terms</a></li>
                            </ul>
                        </div><!-- /.module-body -->
                    </div><!-- /.col -->

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="module-heading outer-bottom-xs">
                            <h4 class="module-title">our services</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body">
                            <ul class='list-unstyled'>
                                <li><a href="#">Order History</a></li>
                                <li><a href="#">Returns</a></li>
                                <li><a href="#">Libero Sed rhoncus</a></li>
                                <li><a href="#">Venenatis augue tellus</a></li>
                                <li><a href="#">My Vouchers</a></li>
                            </ul>
                        </div><!-- /.module-body -->
                    </div><!-- /.col -->

                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="module-heading outer-bottom-xs">
                            <h4 class="module-title">help & support</h4>
                        </div><!-- /.module-heading -->

                        <div class="module-body">
                            <ul class='list-unstyled'>
                                <li><a href="#">Knowledgebase</a></li>
                                <li><a href="#">Terms of Use</a></li>
                                <li><a href="#">Contact Support</a></li>
                                <li><a href="#">Marketplace Blog</a></li>
                                <li><a href="#">About Unicase</a></li>
                            </ul>
                        </div><!-- /.module-body -->
                    </div>
                </div>
            </div>
        </div>

        <div class="copyright-bar">
            <div class="container">
                <div class="col-xs-12 col-sm-6 no-padding">
                    <div class="copyright">
                        Copyright © 2014
                        <a href="home.html">Unicase Shop.</a>
                        - All rights Reserved
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 no-padding">
                    <div class="clearfix payment-methods">
                        <ul>
                            <li><img src="assets/images/payments/1.png" alt=""></li>
                            <li><img src="assets/images/payments/2.png" alt=""></li>
                            <li><img src="assets/images/payments/3.png" alt=""></li>
                            <li><img src="assets/images/payments/4.png" alt=""></li>
                            <li><img src="assets/images/payments/5.png" alt=""></li>
                        </ul>
                    </div><!-- /.payment-methods -->
                </div>
            </div>
        </div>
</footer>


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