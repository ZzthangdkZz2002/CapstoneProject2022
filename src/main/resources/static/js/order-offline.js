var productList=[]


var customers=[]

function convertMoney(num) {
    if(num == null){
        num = "0";
    }
    return num.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
}

$.ajax({
    type: "GET",
    async: false,
    contentType: false,
    url: "/homepage/products",
    success: function (response){
        if(response.status === "00"){
            console.log(response.data);
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

$.ajax({
    type: "GET",
    async: false,
    contentType: false,
    url: "/customer/customers",
    success: function (response){
        if(response.status === "00"){
            console.log(response.data);
            customers = response.data;
        }
        else {
            customers = [];
        }
    },
    error: function (){
        return false;
    }


});

var cartAdmin =[]
function autocomplete(inp, arr) {
    var currentFocus;
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        closeAllLists();
        if (!val) { return false;}
        currentFocus = -1;
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        this.parentNode.appendChild(a);
        for (i = 0; i < arr.length; i++) {
            if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                b = document.createElement("DIV");
                b.style.display='flex'
                b.className = arr[i].id;

                b.innerHTML = `<img src="${contextPath}/img/${arr[i].image}" alt="img-produc" width="100" height="100" onerror="this.src='https://cdn-img.thethao247.vn//storage/files/camhm/2022/10/11/tin-mu-moi-nhat-11-10-ronaldo-duoc-doi-thu-tang-len-may-casemiro-tim-lai-chinh-minh-200731.jpg'">`;
                b.innerHTML +=`<div class="infor-search" style="display:flex;flex-direction: column;margin-left:80px">
            <strong style="font-size: 16px; color: #333">${arr[i].name}</strong>
            <span style="font-size: 16px; color: #333">${convertMoney(arr[i].price)}</span>
            <span style="font-size: 16px; color: #333">Tồn kho: ${arr[i].quantity}</span>
            </div>`
                b.innerHTML += `<input type='hidden' value=${arr[i].name}>`;
                b.addEventListener("click", function(e) {
                    inp.value = this.getElementsByTagName("input")[0].value;

                    let storage =localStorage.getItem('cartAdmin');
                    if(storage){
                        cartAdmin=JSON.parse(storage)
                    }

                    const productCart=cartAdmin.find(item=>item.product?.id==e.target.className)
                    console.log('productCart',productCart);
                    if(productCart){
                        console.log('thêm quantity');

                        productCart.quantity+=1;
                        localStorage.setItem('cartAdmin',JSON.stringify(cartAdmin));
                        console.log('themquantity',cartAdmin);

                    }
                    else{
                        console.log('thêm mới');
                        console.log('productList',productList);
                        const product=productList.find(item=>item.id==e.target.className)
                        console.log('productddd',product);
                        cartAdmin.push({product,quantity:1})
                        console.log('cartAdminuiuiuiuiui',cartAdmin);
                        localStorage.setItem('cartAdmin',JSON.stringify(cartAdmin));

                    }
                    renderCartAdmin()


                    closeAllLists();
                });
                a.appendChild(b);
            }
        }
    });

    function addActive(x) {
        if (!x) return false;
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {

        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}

autocomplete(document.getElementById("myInput"), productList);



const productTable=document.querySelector(".cart-product-table")
const totalMoney=document.querySelector("#total-money")
const btnBill=document.querySelector(".btn-bill")
const tienThua=document.querySelector("#tienThua")


const handeleCartAdmin=()=>{

}




const increasing=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cartAdmin'))
    const cart = cartList.find((item)=>item.product.id==id);
    if(cart){
        cart.quantity+=1;
        localStorage.setItem('cartAdmin',JSON.stringify(cartList))
    }
    renderCartAdmin()
}
const decreasing=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cartAdmin'))
    const cart = cartList.find((item)=>item.product.id==id);
    if(cart){
        if(cart.quantity<=1){
            alert('Số lượng phải lớn hơn 0 !.Xin thử lại');
            return
        }
        cart.quantity-=1;
        localStorage.setItem('cartAdmin',JSON.stringify(cartList))
    }
    renderCartAdmin()
}

const removeCart=(id)=>{
    const cartList=JSON.parse(localStorage.getItem('cartAdmin'))
    const cartRemove = cartList.findIndex((item)=>item.product.id==id);
    console.log('cartRemove',cartRemove);

    cartList.splice(cartRemove,1)
    localStorage.setItem('cartAdmin',JSON.stringify(cartList))


    renderCartAdmin()
}

const viewDetaild=(id)=>{
    let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))

    const productItem=cartListAdmin.find((item)=>item.product.id==id);
    console.log('id',id);
    console.log('cartListAdmin',cartListAdmin);
    console.log('productItem',productItem);

    document.querySelector(".img-modal").src=productItem.product.image
    document.querySelector(".name-modal").value=productItem.product.name
    document.querySelector(".price-modal").value=productItem.product.price
    document.querySelector(".quantity-modal").value=productItem.quantity
    document.querySelector(".total-modal").value=productItem.product.price*productItem.quantity
    document.querySelector(".description-modal").value=productItem.product.description



}
const renderCartAdmin=()=>{
    productTable.innerHTML='';
    let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))

    cartListAdmin?.map((item,key)=>{
        productTable.innerHTML+=`<tr >
      <div class="choose-product">
      <td><img src=${contextPath}/img/${item.product?.image} alt="error_img" width="50" height="60" onerror="this.src='https://cdn-img.thethao247.vn//storage/files/camhm/2022/10/11/tin-mu-moi-nhat-11-10-ronaldo-duoc-doi-thu-tang-len-may-casemiro-tim-lai-chinh-minh-200731.jpg'"></td>

      <td>${item.product.name}</td>

        <td>${convertMoney(item.product.price)}</td>
        <td>
          <button class="btn-decrement-quantity " onclick="decreasing(${item.product.id})"><i class="fa-solid fa-minus"></i></button>
          <input type="text" name="quantity" value=${item.quantity} maxlength="3" max="10" style="width:50px;padding:7px 0;margin:0 10px" 
            class="oder-quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
          <button class="btn-increment-quantity" onclick="increasing(${item.product.id})"><i class="fa-solid fa-plus"></i></button>
        </td>
        <td>${convertMoney(item.product.price*item.quantity)}</td>
        <td><i class="fa-regular fa-trash-can remove-product"  onclick="removeCart(${item.product.id})"></i></td>
        <td><i class="fa-solid fa-eye" data-bs-toggle="modal" onclick="viewDetaild(${item.product.id})" data-bs-target="#exampleModal"></i></td>

        </div>
    </tr>`
    })

    const money = cartListAdmin?.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
    );
    totalMoney.textContent=convertMoney(money);
    renderPay()

}
const renderPay=()=>{
    let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))

    const customPay=parseInt(document.querySelector(".customer-pay").value,10)
    const money = cartListAdmin?.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
    );
    if(Number.isNaN(customPay-money)){
        tienThua.textContent=0;
        return

    }
    tienThua.textContent=customPay-money;
}



document.querySelector(".customer-pay").addEventListener('keyup',()=>{
    renderPay()

})

btnBill.addEventListener("click",()=>{
    let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))

    const customPay=parseInt(document.querySelector(".customer-pay").value,10)
    const money = cartListAdmin.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
        0
    );

    if(customPay<money){
        alert('Số tiền của bạn không đủ để thanh toán :(')
        return
    }
    if(Number.isNaN(customPay-money)){
        alert(`Hãy xem lại phần nhập tiền của khách !`)
        return

    }
    alert(`Bạn đã thanh toán thành công,Tiền thừa bạn khách nhận đc là :${customPay-money}`)
    localStorage.removeItem('cartAdmin')
    renderCartAdmin();
    location.reload()
})
renderCartAdmin()








function autocompleteCustomer(inp, arr) {
    var currentFocus;
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        closeAllLists();
        if (!val) { return false;}
        currentFocus = -1;
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        this.parentNode.appendChild(a);
        for (i = 0; i < arr.length; i++) {
            if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                b = document.createElement("DIV");
                b.style.display='flex'
                b.className = arr[i].id;

                // b.innerHTML = `<img src="${arr[i].image}" alt="img-produc" width="50" height="50">`;
                b.innerHTML +=`<div class="infor-search" style="display:flex;flex-direction: column;margin-left:80px">
            <strong >${arr[i].name}</strong>
            <span >${arr[i].phone}</span>
            </div>`
                b.innerHTML += `<input type='hidden'  value="${arr[i].name}"  >`;
                b.addEventListener("click", function(e) {
                    localStorage.setItem('idDetalCustomer',e.target.className);
                    inp.value = this.getElementsByTagName("input")[0].value;
                    closeAllLists();
                });
                a.appendChild(b);
            }
        }
    });

    function addActive(x) {
        if (!x) return false;
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {

        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}

autocompleteCustomer(document.getElementById("search-customer"), customers);

function addCustomer() {
    var phone = $('#cust_phone').val();
    var name = $('#cust_name').val();
    var email = $('#cust_email').val();
    var address = $('#cust_address').val();
    var note = $('#cust_note').val();
    console.log(name+phone);
    if(name == null || name == ''){
        alert("Vui lòng nhập Tên");
        return;
    }
    if(phone == null || phone == ''){
        alert("Vui lòng nhập số điện thoại");
        return;
    }
    var data = {
        "name" : name,
        "phone" : phone,
        "email" : email,
        "address" : address,
        "note" : note
    };
    $.ajax(
        {
            type : "POST",
            contentType: "application/json",
            url : "/customer/addCustomer",
            data: JSON.stringify(data),
            success: function (response){
                console.log(response)
                if(response.status === '00'){
                    console.log("00")
                    $('#exampleModal3').modal('hide');
                    customers.push(response.data);
                }
                else{
                    alert(response.message);
                    return;
                }
            },

            error: function () {
                console.log("Add customer error");
                return false;
            }
        }
    )

}