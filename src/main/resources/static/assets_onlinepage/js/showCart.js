const shoppingCart = document.querySelector('.shopping-cart');
const totalMoney = document.querySelector('.total-order');



const increasing=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cart'))
    const cart = cartList.find((item)=>item.product.id==id);
    if(cart){
        cart.quantity+=1;
        localStorage.setItem('cart',JSON.stringify(cartList))
    }
 getListCart()
}
const decreasing=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cart'))
    const cart = cartList.find((item)=>item.product.id==id);
    if(cart){
        if(cart.quantity<=1){
            alert('Số lượng phải lớn hơn 0 !.Xin thử lại');
            return
        }
        cart.quantity-=1;
        localStorage.setItem('cart',JSON.stringify(cartList))
    }
 getListCart()
}

const removeCart=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cart'))
    const cartRemove = cartList.findIndex((item)=>item.product.id==id);

    if(cartRemove!= -1){
        cartList.splice(cartRemove,1)
        localStorage.setItem('cart',JSON.stringify(cartList))
    }
    if(cartList.length > 0 && cartList != null){
        document.getElementById('ContinueOrder').style.display = "block";
    }else{
        document.getElementById('ContinueOrder').style.display = "none";
    }
    getListCart()
}

const getListCart=()=>{
    shoppingCart.innerHTML='';
    let cartList=JSON.parse(localStorage.getItem('cart'))
    cartList.map((item,key)=>{
        shoppingCart.innerHTML+=` <tr>
        <td scope="row"><img
                src="${contextPath}/img/${item.product.image}"
                alt=""></td>
        <td>
            <p class="fw-bold">${item.product.name}</p>
            <p>Mã sản phẩm: ${item.product.id}</p>
        </td>
        <td class="price">${item.product.price}</td>
        <td>
            <div class="d-flex" style="justify-content: center">
                <button class="btnIncrease btn btn-link px-2"
                    onclick="decreasing(${item.product.id})">
                    <i class="fas fa-minus"></i>
                </button>

                <input min="0" max="" name="quantity" value="${item.quantity}" type="text" onkeyup="handleQuantity(${item.product.id})"
                    class="quantity form-control form-control-sm" style="width: 50px;" />

                <button class="btnDecrease btn btn-link px-2"
                    onclick="increasing(${item.product.id})">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
        </td>
        <td class="total">${item.quantity*item.product.price}</td>
        <td><i class="fas fa-trash fa-lg" style="color:red" onclick="removeCart(${item.product.id})"></i></td>
    </tr>`
    })
    const money = cartList.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
      );
    totalMoney.textContent=money
}
const handleQuantity=(id)=>{
    let quantityInput=document.querySelector('.quantity').value;
    const cartList=JSON.parse(localStorage.getItem('cart'))
const cartFind = cartList.find((item)=>item.product.id==id);

if( typeof parseInt(quantityInput,10) !='number' || quantityInput==''){
  
    document.querySelector('.quantity').value=cartFind.quantity;
    quantityInput=cartFind.quantity
}



if(cartFind){
    cartFind.quantity=parseInt(quantityInput,10);

    localStorage.setItem('cart',JSON.stringify(cartList))
 }

 getListCart()


}


      getListCart()


var cartlists = JSON.parse(localStorage.getItem('cart'));
console.log("carttt: "  + cartlists)
if(cartlists.length > 0 && cartlists != null){
    document.getElementById('ContinueOrder').style.display = "block";
}else{
    document.getElementById('ContinueOrder').style.display = "none";
}
