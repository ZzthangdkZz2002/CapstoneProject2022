var productList;

var cart=[]
const products = document.querySelector('.list-product');


// const count = document.querySelector('.count');
// const countQuantity=()=>{
//     return  countCart = JSON.parse(localStorage.getItem('cart'))?.reduce(
//         (previousValue, currentValue) => previousValue + currentValue.quantity,
//         0
//     );
//
// }



const formatDescription=(text)=>{
    if(text == null){
        return "";
    }
    if(text.toString().length >40){
        return text.substr(0,40) +'...'
    }
    return text
}
const addCart=(id)=>{
    let storage =localStorage.getItem('cart');
    if(storage){
        cart=JSON.parse(storage)
    }
    const getProductById=productList.find((item)=>item.id==id)

    const findProduct=cart.find((item)=>item.product.id==id)

    if(findProduct){
        findProduct.quantity+=1
    }
    else{
        cart.push({product:getProductById,quantity:1})
    }

    localStorage.setItem('cart',JSON.stringify(cart));
    count.textContent=countQuantity()
}
const saveId=(id)=>{
    console.log("saveid")
    localStorage.setItem('idDetald',id);

}

$.ajax({
    type: "GET",
    async: false,
    contentType: false,
    url: "/homepage/products",
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
function convertMoney(num) {
    if(num == null){
        num = "0";
    }
    return num.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
}

productList.map((item,key)=>{

    products.innerHTML+=`<a href="${contextPath}/homepage/detailProduct?id=${item.id}" onclick="saveId(${item.id})">
   <div class="product col-md-4" style="height: 200px;margin-bottom: 20px; border: 0.5px solid #e6e6e6; padding: 5px">
    <div class="product-micro">
        <div class="row product-micro-row">
            <div class="col col-xs-5">
                <div class="product-image" style="  width: 111px;
                height: 20px;">
                    <div class="image" href="${contextPath}/homepage/detailProduct?id=${item.id}">
                        
                            <img style="object-fit: cover;"
                                src="img/${item.image}" alt="" width="111px" height="111px" onerror="this.src='https://cdn-img.thethao247.vn//storage/files/camhm/2022/10/11/tin-mu-moi-nhat-11-10-ronaldo-duoc-doi-thu-tang-len-may-casemiro-tim-lai-chinh-minh-200731.jpg'">
                            <div class="zoom-overlay"></div>
                    </div>


                </div>
            </div>
            <div class="col col-xs-7">
                <div class="product-info">
                    <h3 class="name"><a href="${contextPath}/homepage/detailProduct?id=${item.id}" onclick="saveId(${item.id})">${item.name}</a></h3>
                    <p class="decription">${formatDescription(item.description)}</p>
                    <div class="product-price">
                        <span class="price">
                        ${convertMoney(item.price)}</span>
                        
                        <p style="color: ${item.quantity > 0 ? "green" : "red"}">${item.quantity > 0 ? "Còn hàng" : "Liên hệ"}</p>
                    </div>
                       <div class="action" style="display:flex;position: absolute;top: 160px"><button type="button" onclick="addCart(${item.id})" class="btn btn-info" style="padding: 5px 10px;border:none;font-size:12px;margin-right:10px";><i class="glyphicon glyphicon-shopping-cart" style="margin-right: 2px"></i>Chọn mua</button>
                      <a onclick="saveId(${item.id})" href="${contextPath}/homepage/detailProduct?id=${item.id}" class="btn btn-info" style="padding: 5px 10px;font-size:12px;border:none">Xem</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
    </a>`
})
// count.textContent=countQuantity();




// function autocomplete(inp, arr) {
//     /*the autocomplete function takes two arguments,
//     the text field element and an array of possible autocompleted values:*/
//     var currentFocus;
//     /*execute a function when someone writes in the text field:*/
//     inp.addEventListener("input", function(e) {
//         var a, b, i, val = this.value;
//         /*close any already open lists of autocompleted values*/
//         closeAllLists();
//         if (!val) { return false;}
//         currentFocus = -1;
//         /*create a DIV element that will contain the items (values):*/
//         a = document.createElement("DIV");
//         a.setAttribute("id", this.id + "autocomplete-list");
//         a.setAttribute("class", "autocomplete-items");
//         /*append the DIV element as a child of the autocomplete container:*/
//         this.parentNode.appendChild(a);
//         /*for each item in the array...*/
//         for (i = 0; i < arr.length; i++) {
//             if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
//                 b = document.createElement("DIV");
//                 b.style.display='flex'
//                 b.className = arr[i].id;
//                 b.addEventListener('click', (e)=>{
//                     localStorage.setItem('idDetald',e.target.className);
//                 });
//                 b.innerHTML = `<img src="img/${arr[i].image}" alt="img-produc" width="50" height="50">`;
//                 b.innerHTML +=`<div class="infor-search" style="display:flex;flex-direction: column;margin-left:80px">
//               <strong >${arr[i].name}</strong>
//               <span >${arr[i].price}</span>
//
//               </div>`
//
//
//                 b.innerHTML += `<input type='hidden' value=${arr[i].name}>`;
//
//                 b.addEventListener("click", function(e) {
//                     inp.value = this.getElementsByTagName("input")[0].value;
//
//                     closeAllLists();
//                 });
//                 a.appendChild(b);
//             }
//         }
//     });
//
//     function addActive(x) {
//         if (!x) return false;
//         removeActive(x);
//         if (currentFocus >= x.length) currentFocus = 0;
//         if (currentFocus < 0) currentFocus = (x.length - 1);
//         x[currentFocus].classList.add("autocomplete-active");
//     }
//     function removeActive(x) {
//         for (var i = 0; i < x.length; i++) {
//             x[i].classList.remove("autocomplete-active");
//         }
//     }
//     function closeAllLists(elmnt) {
//
//         var x = document.getElementsByClassName("autocomplete-items");
//         for (var i = 0; i < x.length; i++) {
//             if (elmnt != x[i] && elmnt != inp) {
//                 x[i].parentNode.removeChild(x[i]);
//             }
//         }
//     }
//     /*execute a function when someone clicks in the document:*/
//     document.addEventListener("click", function (e) {
//         closeAllLists(e.target);
//     });
// }





/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
// autocomplete(document.getElementById("myInput"), productList);



