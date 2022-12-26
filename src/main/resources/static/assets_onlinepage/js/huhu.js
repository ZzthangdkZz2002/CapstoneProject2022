var productList;
var cart=[]
$.ajax({
    type: "GET",
    async: false,
    contentType: false,
    url: "/homepage/api/products",
    success: function (response){
        if(response.status === "00"){
            productList = response.data;
        }
        else {
            productList = [];
        }
    },
    error: function (){
        return false;
    }


});


const addCart=(id)=>{
    console.log('id',id)
    console.log('productList',productList)

    let storage =localStorage.getItem('cart');
    if(storage){
        cart=JSON.parse(storage)
    }


    const getProductById=productList.find((item)=>item.id==id)
    console.log('getProductById',getProductById)
    if(cart.length==0){
        cart.push({product:getProductById,quantity:1})
    }
    else {
        const findProduct=cart.find((item)=>item.product.id==id)
        if(findProduct){
            findProduct.quantity+=1
        }
        else{
            cart.push({product:getProductById,quantity:1})
        }
    }

    localStorage.setItem('cart',JSON.stringify(cart));
    count.textContent=countQuantity()
}