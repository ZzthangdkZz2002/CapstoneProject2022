const shoppingCart = document.querySelector('.cart-shop');
const badge = document.querySelector('.badge');
const totalMoney = document.querySelector('.total-money');

function convertMoney(num) {
    if(num == null){
        num = "0";
    }
    return num.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
}

const getListCart=()=>{
    shoppingCart.innerHTML='';
    let cartList=JSON.parse(localStorage.getItem('cart'))
    cartList.map((item,key)=>{
        shoppingCart.innerHTML+=`<li class="list-group-item d-flex justify-content-between lh-condensed">
       <div style="display:flex">
       <div style="width: 40px;height: 40px;object-fit: cover;margin-right:20px">
       <img src="${contextPath}/img/${item.product.image}" alt="Girl in a jacket" style="width: 100%;height: 100%;object-fit: cover;">
       </div>
       <div>
         <h6 class="my-0">${item.product.name}</h6>
         <small class="text-muted">Số lượng: ${item.quantity}</small>
       </div>
       </div>
    
        <span class="text-muted">${convertMoney(item.product.price * item.quantity)}</span>
      </li>`
    })

    badge.textContent=cartList.length;
    const money = cartList.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
      );
    totalMoney.textContent=convertMoney(money);
}

getListCart()

function rePayment(orderid) {
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/homepage/re-payment?orderid="+orderid,
        dataType:"json",
        success: function (response){
            console.log(response);
            if(response.status === "00"){
                window.location.href = response.data;
            }
            else {
                console.log(response.message);
                return;
            }
        },
        error: function (error){
            console.log("Error");
            return;
        }


    });
}

function OrderAction() {
    let username = $('#username').val();
    let email = $('#email').val();
    let phone = $('#phone').val();
    let address = $('#address').val();
    let note = $('#note').val();
    let paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;



    let products = new Array();

    const cartList = JSON.parse(localStorage.getItem('cart'))
    const totalMoney = cartList.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
    );

    for(let i=0; i<cartList.length; i++){
        let item = new Object();
        item.product_id = cartList[i].product.id;
        item.quantity = cartList[i].quantity;
        item.amount = cartList[i].product.price * cartList[i].quantity;
        products.push(item);
    }

    let data = {
        "user_name" : username,
        "user_email" : email,
        "user_phone" : phone,
        "address" : address,
        "amount" : totalMoney,
        "payment_method" : paymentMethod,
        "message" : note,
        "orderTransactionDetails" : products
    };
    if(paymentMethod == 'Thanh toán qua VNPay'){
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/homepage/create-payment",
            data: JSON.stringify(data),
            dataType:"json",
            success: function (response){
                console.log(response);
                if(response.status === "00"){
                    localStorage.removeItem("cart");
                    window.location.href = response.data;
                }
                else {
                    console.log(response.message);
                    return;
                }
            },
            error: function (error){
                console.log("Error");
                return;
            }


        });

    }else{
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/homepage/checkout",
            data: JSON.stringify(data),
            dataType:"json",
            success: function (response){
                console.log(response);
                console.log(response.status);
                if(response.status === "00"){
                    localStorage.removeItem("cart");
                    window.location.href = 'http://localhost:5000/homepage/confirmOrder?id='+response.data;
                    console.log("Ô văn Kê")
                }
                else {
                    console.log("Ngu đần");
                    return;
                }
            },
            error: function (error){
                console.log("Error");
                return;
            }


        });
    }
}