var productList;
const counts = document.querySelector('.count');
const addCart = document.querySelector('.add-cart');
const quantityInput = document.querySelector('.quant-input input');
const nameProduct = document.querySelector('.product-info .name');
const descriptionProduct = document.querySelector('.description-container');
const priceProduct = document.querySelector('.price-box .price');
const descriptionMoreProduct = document.querySelector('.product-tab p');
const imgResponsive = document.querySelector('.description-img');



var cartList=[]
addCart.addEventListener('click',()=>{

    let storage =localStorage.getItem('cart');
    if(storage){
        cartList=JSON.parse(storage)
    }
    
    const id =localStorage.getItem('idDetald')
    $.ajax({
        type: "GET",
        async: false,
        contentType: false,
        url: "/homepage/getProductById?id="+id,
        success: function (response){
            if(response.status === "00"){
                console.log(response.data);
                itemcart = response.data;
            }
            else {
                console.log("else");
            }
        },
        error: function (){
            return false;
        }
    });
    var itemcart;

    console.log(itemcart);
const cartFind = cartList.find((item)=>item.product.id==id);

const countQuantity=()=>{
        return  countCart = JSON.parse(localStorage.getItem('cart'))?.reduce(
            (previousValue, currentValue) => previousValue + currentValue.quantity,
            0
        );
    }
if(cartFind){
    cartFind.quantity+=parseInt(quantityInput.value, 10);
}
else{
    cartList.push({product:itemcart,quantity:parseInt(quantityInput.value, 10)})
    }
swal("Bạn đã thêm thành công vào giỏ hàng !", "", "success");    localStorage.setItem('cart',JSON.stringify(cartList));
    count.textContent=countQuantity();
})
const formatDescription=(text)=>{
    if(text.length >550){
      return text.substr(0,550) +'...'
    }
     return text
  }

// const id =localStorage.getItem('idDetald')
// const productDetaild = productList.find((item)=>item.id==id);
// nameProduct.textContent=productDetaild.name
// descriptionProduct.textContent=formatDescription(productDetaild.description)
// priceProduct.textContent=productDetaild.price +'₫'
// descriptionMoreProduct.textContent=productDetaild.description
//
// imgResponsive.src=productDetaild.image

