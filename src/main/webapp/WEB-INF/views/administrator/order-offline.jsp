<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font: 16px Arial;
        }

        /*the container must be positioned relative:*/
        .autocomplete {
            position: relative;
            display: inline-block;
        }

        input {
            border: 1px solid transparent;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 16px;
        }

        .search_product {
            background-color: #f1f1f1;
            width: 100%;
        }

        input[type=submit] {
            background-color: DodgerBlue;
            color: #fff;
            cursor: pointer;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            padding: 10px;
            cursor: pointer;
            background-color: #fff;
            border-bottom: 1px solid #d4d4d4;
        }

        /*when hovering an item:*/
        .autocomplete-items div:hover {
            background-color: #e9e9e9;
        }

        /*when navigating through the items using the arrow keys:*/
        .autocomplete-active {
            background-color: DodgerBlue !important;
            color: #ffffff;
        }
        .autocomplete-items{
            height: 200px;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order-offline.css">
    <!-- Custom Icon -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />


    <!-- Custom Icon -->
    <script src="https://kit.fontawesome.com/0d49bb56e3.js" crossorigin="anonymous"></script>
</head>

<body>
<ul class="nav custom-nav">
    <form autocomplete="off"  style="display:flex ;align-items: center;">
        <div class="autocomplete" style="width:500px;">
            <input id="myInput" type="text" name="search_product" class="search_product" placeholder="Search product...">
        </div>
    </form>
</ul>


<!-- main content -->
<div class="container-fluid main-bill">

    <div class="row">
        <div class="col-8  custom-table-infor">
            <!-- order product -->
            <table class="table custom-table mt-2" style="text-align: center;">
                <thead class="thead">
                <tr>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Tên Sản phẩm</th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col">Xóa</th>
                </tr>
                </thead>
                <tbody class="cart-product-table">
                <!-- LIST PRODUCT IN HERE -->


                </tbody>
            </table>



        </div>
        <div class="col-4 custom-bill-infor">



            <div class="row">
                <div class="col-7">
                    <input type="text" name="search" placeholder="Tìm khách hàng" class="mb-4 form-boder search-customer" id="search-customer">
<%--                    <i style="position: absolute;right: 30px;top: 10px;cursor: pointer;" class="fa-solid fa-plus" data-bs-toggle="modal" data-bs-target="#exampleModal3"></i>--%>
                </div>
                <div class="col-5 pl-4">
                    <button type="button" class="btn btn-primary ml-4" data-bs-toggle="modal" data-bs-target="#exampleModal3">Thêm khách hàng</button>
                </div>
                <div class="col-7 pl-4">
                    <p class="mb-4 custom-text-bill">Tổng tiền hàng</p>
                </div>
                <div class="col-5">
                    <p class="mb-4 text-right" id="total-money">0</p>


                </div>
                <div class="col-7 mt-3 pt-2 pl-4">
                    <p class="mb-4 custom-text-bill">Khách trả:</p>
                </div>
                <div class="col-5 mt-3">
                    <input type="text" class="form-control customer-pay mb-4" >
                </div>
                <div class="col-8 mt-3 pl-4">
                    <p class="mb-4 custom-text-bill">Tiền thừa trả khách</p>
                </div>
                <div class="col-4 mt-3">
                    <p class="mb-4 text-right" id="tienThua">0</p>
                </div>
                <div class="col-12 pl-4 mt-3">
                    <p class="mb-4 custom-text-bill">Phương thức thanh toán:</p>
                </div>

                <div class="col-12 pl-4">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input custom-checkbox" type="radio" name="inlineRadioOptions" id="cash"
                               value="Tiền mặt" checked />
                        <label class="form-check-label custom-checkbox-label mr-2" for="cash">Tiền mặt</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input custom-checkbox" type="radio" name="inlineRadioOptions" id="transfer"
                               value="Chuyển khoản" />
                        <label class="form-check-label custom-checkbox-label" for="transfer">Chuyển khoản</label>
                    </div>


                </div>
                <!-- suggest money -->

                <!-- transfer money -->
                <div class="col-12 mt-3 tranfer-money">
                    <div class="row">
                        <div class="col-3 qrCode-image">
                            <img
                                    src=""
                                    alt="" class="img_qr" data-bs-toggle="modal" data-bs-target="#exampleModal5" style="cursor: pointer;">
                        </div>
                        <div class="col-9">
                            <select class="custom-select" id="custom-select">
                                <option selected>Sacombank-030047139480-Nguyễn Viết Thắng</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <button type="button" class="btn btn-light add_acount mt-2 add_bank" style="cursor: pointer;"
                                    data-bs-toggle="modal" data-bs-target="#exampleModal4">Thêm tài khoản</button>
                        </div>
                    </div>

                </div>

                <!-- don't have bank -->
                <div class="col-12 mt-3 no-bank" style="display: none">
                    <div class="row">
                        <h3>Chưa có tài khoản ngân hàng nào</h3>
                        <div class="col-9">
                            <button type="button" class="btn btn-light add_acount mt-2 add_bank2" style="cursor: pointer;"
                                    data-bs-toggle="modal" data-bs-target="#exampleModal4">Thêm tài khoản</button>
                        </div>
                    </div>

                </div>

                <div class="col-12" style="position: absolute; bottom: 100px;">
                    <button type="button" class="btn btn-primary btn-bill" onclick="OrderOfflineAction()">Thanh toán</button>
                </div>


            </div>

        </div>


    </div>

</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-4">
                            <img style="width: 100%;height:100%" class="img-modal" src="" alt="error_img">
                        </div>
                        <div class="col-8">
                            <div class="row mb-4">
                                <div class="col-6">
                                    <label >Tên sản phẩm</label>
                                    <input type="text" class="form-control name-modal" >
                                </div>
                                <div class="col-6">
                                    <label >Giá</label>
                                    <input type="text" class="form-control price-modal" >
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-6">
                                    <label >Số lượng</label>
                                    <input type="text" class="form-control quantity-modal" >
                                </div>
                                <div class="col-6">
                                    <label >Thành tiền</label>
                                    <input type="text" class="form-control total-modal" >
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-12">
                                    <label >Mô tả</label>
                                    <textarea class="form-control description-modal"  rows="4"></textarea>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>




<!-- Modal Thông tin khách hàng-->
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabe3" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin khách hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="container-fluid">
                    <div class="row justify-content-between">




                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="name" id='cust_name' required />
                            <label for="name" class="form__label">Tên  khách hàng</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="name" id='cust_email' required />
                            <label for="name" class="form__label">Email</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="name" id='cust_phone' required />
                            <label for="name" class="form__label">Điện thoại</label>
                        </div>



                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="name" id='cust_address' required />
                            <label for="name" class="form__label">Địa chỉ</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Name" name="name" id='cust_note' required />
                            <label for="name" class="form__label">Ghi chú</label>
                        </div>

                    </div>
                </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="addCustomer()">Lưu</button>

            </div>
        </div>
    </div>
</div>

<!-- Modal Thêm thông tin tài  khoản-->
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabe4" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Thêm thông tin tài khoản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="container-fluid">
                    <div class="row justify-content-between">




                        <div class="form__group field col-12">
                            <input type="input" class="form__field" placeholder="Name" name="nameBank" id='nameBank' required />
                            <label for="name" class="form__label">Tên hiển thị</label>
                        </div>

                        <div class="form__group field col-5">
                            <input type="input" class="form__field" placeholder="Số tài khoản" name="stk" id='stk' required />
                            <label for="name" class="form__label">Số tài khoản</label>
                        </div>

                        <div class="form__group field col-5 drop-down">
                            <select name="options" class="custom-select" id="bank_list_select">
                                <!-- LIST INFOR BANK -->
                            </select>
                        </div>

                    </div>
                </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary save-bank" data-bs-dismiss="modal">Lưu</button>

            </div>
        </div>
    </div>
</div>


<!-- Modal show img_qr-->
<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabe5" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >QR code</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="container-fluid">
                    <div class="row" style="justify-content: center;">

                        <div class="col-7">
                            <img src="" alt="Error_img_qr" style="width:100% ;height: 100%;object-fit: cover;"
                                 class="qr_code_modal">
                        </div>
                        <div class="col-7">
                            <button type="button" class="btn btn-success" onclick="printQrCode();" style="margin-left: 148px">Print</button>
                        </div>

                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary save-bank">Lưu</button>

            </div>
        </div>
    </div>
</div>


<script>var contextPath = "${pageContext.request.contextPath}"</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/order-offline.js"></script>


</body>

</html>