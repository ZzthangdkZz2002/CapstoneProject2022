var productList=[]


var customers=[]
const moneyRadio1 = document.getElementById('cash');
const moneyRadio2 = document.getElementById('transfer');
const tranferMoney = document.querySelector('.tranfer-money');
const nobank = document.querySelector('.no-bank');
const Savebank = document.querySelector('.save-bank');
const listInforBank = document.querySelector('.custom-select');
const img_qr = document.querySelector('.img_qr');
const qr_code_modal = document.querySelector('.qr_code_modal');
const qr_code_image_model = document.querySelector('.qrCode-image');
const add_bank = document.querySelector('.add_bank');
const add_bank2 = document.querySelector('.add_bank2');
const cust_pay = document.querySelector('.custpay');
var moneyForQr = 0;
var invoice_template = document.querySelector('.bill');
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

function removeAccents(str) {
    return str.normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .replace(/đ/g, 'd').replace(/Đ/g, 'D');
}

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
            var name_khong_dau = removeAccents(arr[i].name);
            if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase() || name_khong_dau.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                b = document.createElement("DIV");
                b.style.display='flex'
                b.className = arr[i].id;
                c=document.createElement("img");
                c.src=`${contextPath}/img/${arr[i].image}`
                c.width=50
                c.height=50
                b.appendChild(c)
                b.innerHTML +=`<div class="infor-search" style="display:flex;flex-direction: column;margin-left:80px">
            <strong class=${arr[i].id} >${arr[i].name}</strong>
            <span id="price-span" class=${arr[i].id}>${convertMoney(arr[i].price)}</span>
            <span id="quantity" class=${arr[i].id}>Số lượng: ${arr[i].quantity}</span>
            </div>`
                b.innerHTML += `<input type='hidden' value=${arr[i].name}>`;
                b.addEventListener("click", function(e) {
                        inp.value = this.getElementsByTagName("input")[0].value;
                        let storage =localStorage.getItem('cartAdmin');
                        console.log("storage = ", storage);
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
                    }
                );
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

    document.querySelector(".img-modal").src=contextPath+'/img/'+productItem.product.image
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
      <td>${item.product.unit == null ? 'cái' : item.product.unit}</td>

        <td>${convertMoney(item.product.price)}</td>
        <td>
          <button class="btn-decrement-quantity " onclick="decreasing(${item.product.id})"><i class="fa-solid fa-minus"></i></button>
          
          <input type="text" name="quantity" value=${item.quantity} maxlength="3" max="10" style="width:50px;padding:7px 0;margin:0 10px;color: ${item.quantity > item.product.quantity ? "red" : ""}" 
            class="oder-quantity" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
            
          <button class="btn-increment-quantity" onclick="increasing(${item.product.id})"><i class="fa-solid fa-plus"></i></button>
        </td>
        <td>${convertMoney(item.product.price*item.quantity*0.1)}</td>
        <td>${convertMoney(item.product.price*item.quantity*1.1)}</td>
        <td><i class="fa-regular fa-trash-can remove-product"  onclick="removeCart(${item.product.id})"></i></td>
        <td><i class="fa-solid fa-eye" data-bs-toggle="modal" onclick="viewDetaild(${item.product.id})" data-bs-target="#exampleModal"></i></td>

        </div>
    </tr>`
    })

    let money = cartListAdmin?.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity*1.1),
        0
    );
    moneyForQr = parseInt(money);
    totalMoney.textContent=convertMoney(money);
    $('#cash').prop('checked',true);
    tranferMoney.style.display = "none";
    cust_pay.style.display = "block";
    // moneyRadio1.prop('checked',true);
    renderPay()

}
const renderPay=()=>{
    let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))

    const customPay=parseInt(document.querySelector(".customer-pay").value,10)
    const money = cartListAdmin?.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity*1.1),
        0
    );
    if(Number.isNaN(customPay-money)){
        tienThua.textContent=0;
        return

    }
    tienThua.textContent=convertMoney(customPay-money);
}



document.querySelector(".customer-pay").addEventListener('keyup',()=>{
    renderPay()

})

// btnBill.addEventListener("click",()=>{
//     let cartListAdmin=JSON.parse(localStorage.getItem('cartAdmin'))
//
//     const customPay=parseInt(document.querySelector(".customer-pay").value,10)
//     const money = cartListAdmin.reduce(
//         (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity),
//         0
//     );
//
//     if(customPay<money){
//         alert('Số tiền của bạn không đủ để thanh toán :(')
//         return
//     }
//     if(Number.isNaN(customPay-money)){
//         alert(`Hãy xem lại phần nhập tiền của khách !`)
//         return
//
//     }
//
//
//     // alert(`Bạn đã thanh toán thành công,Tiền thừa bạn khách nhận đc là :${customPay-money}`)
//     localStorage.removeItem('cartAdmin')
//     renderCartAdmin();
//     location.reload()
// })
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
            var name_khong_dau = removeAccents(arr[i].name);
            if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase() || name_khong_dau.substr(0, val.length).toUpperCase() == val.toUpperCase() ||
               arr[i].phone.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
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





var listBank=[]

img_qr.addEventListener('click',()=>{
    qr_code_modal.src=img_qr.src
})

add_bank.addEventListener('click',()=>{
    $.ajax(
        {
            type : "GET",
            contentType: "application/json",
            url : "https://api.vietqr.io/v2/banks",
            success: function (response){
                console.log(response)
                if(response.code === '00'){
                    response.data.map((item,key)=>{
                        $('#bank_list_select').append(`<option class="en" style="background-image:url('${item.logo}');" value=${item.bin}>${item.code}-${item.name}</option>`)
                    })

                }
                else{
                    alert(response.desc);
                    return;
                }
            },

            error: function () {
                console.log("Get List bank Error");
                return false;
            }
        }

    );
    console.log('hiihho',listBank);
})



add_bank2.addEventListener('click',()=>{
    $.ajax(
        {
            type : "GET",
            contentType: "application/json",
            url : "https://api.vietqr.io/v2/banks",
            success: function (response){
                console.log(response)
                if(response.code === '00'){
                    response.data.map((item,key)=>{
                        $('#bank_list_select').append(`<option value=${item.bin}>${item.code}-${item.name}</option>`)
                    })

                }
                else{
                    alert(response.desc);
                    return;
                }
            },

            error: function () {
                console.log("Get List bank Error");
                return false;
            }
        }

    );
    console.log('hiihho',listBank);
})

//change payment type
function valueChange(event) {
    if (moneyRadio1.checked) {
        console.log('moneyRadio1');
        tranferMoney.style.display = "none";
        nobank.style.display = "none";
        cust_pay.style.display = "block";
    } else {
        console.log('moneyRadio2');
        cust_pay.style.display = "none";
        let listbank = JSON.parse(localStorage.getItem('bankList'));
        if(listbank == null || listbank.length <= 0){
            tranferMoney.style.display = "none";
            nobank.style.display = "block";
        }else{
            localStorage.removeItem('bankList');
            bankList =[];
            listbank?.map((item,key)=>{
                var dataGenQr = {
                    "accountNo": item.stk,
                    "accountName": item.usernameBank,
                    "acqId": item.bin,
                    "addInfo": "FPT Electronic Shop - Thanh toan hoa don",
                    "amount": Number(moneyForQr),
                    "template": "compact2"
                };
                $.ajax(
                    {
                        type : "POST",
                        contentType: "application/json",
                        async: false,
                        url : "https://api.vietqr.io/v2/generate",
                        headers: {
                            'x-api-key':'.com',
                            'x-client-id':'we-l0v3-v1et-qr'
                        },
                        data: JSON.stringify(dataGenQr),
                        success: function (response){
                            if(response.code === '00'){
                                var usernameBank = item.usernameBank;
                                var stk = item.stk;
                                var bin = item.bin;
                                var bankname = item.bankname;
                                var qrImage = response.data.qrDataURL;
                                // item.qrImage = response.data.qrDataURL;
                                const bankInfor={usernameBank,stk,bin,bankname,qrImage}
                                bankList.push(bankInfor)
                                localStorage.setItem('bankList',JSON.stringify(bankList))
                            }
                            else{
                                alert(response.desc);
                                return;
                            }
                        },

                        error: function () {
                            console.log("Get QrCode Error");
                            return false;
                        }
                    }
                );
            })
            renderListInforBank();

            bankList?.slice(0,1).map((item,key)=>{
                img_qr.src = item.qrImage;
            })

            tranferMoney.style.display = "block";
        }

    }
}
var bankList=[]
moneyRadio1.addEventListener('change', valueChange);
moneyRadio2.addEventListener('change', valueChange);
const renderListInforBank=()=>{
    listInforBank.innerHTML='';
    let listBanks=JSON.parse(localStorage.getItem('bankList'))
    let i=0;
    listBanks?.map((item,key)=>{

        return listInforBank.innerHTML+=`<option value=${++i}>${item.stk}-${item.bankname}</option>`

    })
}

// $('#custom-select').on('change', function () {
//     var selectVal = $("#custom-select option:selected").val();
//     console.log("value selected: "+selectVal.bin);
// });
listInforBank.addEventListener('change', bankChange);

function bankChange(event) {
    let listBanks=JSON.parse(localStorage.getItem('bankList'))
    const selectVal = $('#custom-select').find(":selected").val();;
    listBanks?.slice(selectVal-1, selectVal).map((item,key)=>{
        img_qr.src = item.qrImage;
    })
}

Savebank.addEventListener("click",()=>{
    let storage =localStorage.getItem('bankList');
    if(storage){
        bankList=JSON.parse(storage)
    }
    const stk = document.querySelector('#stk').value;
    const bin = document.querySelector('#bank_list_select').value;
    const bankname = $('#bank_list_select').find(":selected").text();
    const usernameBank = document.querySelector('#nameBank').value;
    var qrImage;
    console.log("moneyy: "+moneyForQr)
    var dataGenQr = {
        "accountNo": stk,
        "accountName": usernameBank,
        "acqId": bin,
        "addInfo": "FPT Electronic Shop - Thanh toan hoa don",
        "amount": Number(moneyForQr),
        "template": "compact2"
    };
    $.ajax(
        {
            type : "POST",
            contentType: "application/json",
            async: false,
            url : "https://api.vietqr.io/v2/generate",
            headers: {
                'x-api-key':'.com',
                'x-client-id':'we-l0v3-v1et-qr'
            },
            data: JSON.stringify(dataGenQr),
            success: function (response){
                console.log(response)
                if(response.code === '00'){
                    img_qr.src = response.data.qrDataURL;
                    qrImage = response.data.qrDataURL;
                    nobank.style.display = "none";
                    tranferMoney.style.display = "block";
                }
                else{
                    alert(response.desc);
                    return;
                }
            },

            error: function () {
                console.log("Get QrCode Error");
                return false;
            }
        }
    );
    console.log("QR image: "+qrImage);
    const bankInfor={usernameBank,stk,bin,bankname,qrImage}
    bankList.push(bankInfor)
    localStorage.setItem('bankList',JSON.stringify(bankList))
    renderListInforBank()
})


renderListInforBank();

autocompleteCustomer(document.getElementById("search-customer"), customers);




function addCustomer() {
    var phone = $('#cust_phone').val();
    var name = $('#cust_name').val();
    var email = $('#cust_email').val();
    var address = $('#cust_address').val();
    let province = $("#city option:selected").text();
    let district = $("#district option:selected").text();
    let ward = $( "#ward option:selected").text();
    var note = $('#cust_note').val();
    if(name == null || name == ''){
        alert("Vui lòng nhập Tên");
        return;
    }
    if(phone == null || phone == ''){
        alert("Vui lòng nhập số điện thoại");
        return;
    }
    if(address == null || address == ''){
        alert("Vui lòng nhập địa chỉ chi tiết");
        return;
    }
    if($('#city').val() == '0'){
        alert("Vui lòng điền Tỉnh/Thành phố!!")
        return
    }
    if($('#district').val() == '0'){
        alert("Vui lòng điền Quận/Huyện!!")
        return
    }
    if($('#ward').val() == '0'){
        alert("Vui lòng điền Xã/Phường!!")
        return
    }
    var data = {
        "name" : name,
        "phone" : phone,
        "email" : email,
        "address" : address,
        "province" : province,
        "district" : district,
        "ward" : ward,
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

function printInvoice(payment_method, order_id) {
    if(payment_method == 'Chuyển khoản'){
        document.getElementById('qr-title').style.display = "block";
        document.getElementById('qr-invoice').style.display = "block";
        var qr_code = qr_code_image_model.innerHTML;
        var src_qr = document.getElementById('qrcode_image').getAttribute('src');
        console.log(src_qr)
        document.getElementById('qr-invoice').src = src_qr;
        // document.getElementById('qr-code').innerHTML = qr_code;
    }else{
        document.getElementById('qr-title').style.display = "none";
        document.getElementById('qr-invoice').style.display = "none";
    }

    $.ajax(
        {
            type : "GET",
            async: false,
            url : "/admin/orders/getOrder?id=" + order_id,
            success: function (response){
                console.log(response)
                if(response.status === '00'){
                    let items = response.data.orderTransactionDetails;
                    let result = '';
                    document.getElementById('invoice-id').innerHTML = "Mã hóa đơn: " + response.data.orderid;
                    document.getElementById('invoice-day').innerHTML = new Date().getDate().toString();
                    document.getElementById('invoice-month').innerHTML = (new Date().getMonth() + 1).toString();
                    document.getElementById('invoice-year').innerHTML = new Date().getFullYear().toString();



                    if(response.data.customer == null){
                        document.getElementById('cust-name').innerHTML = "Khách lẻ";
                    }else{
                        if(response.data.customer.name != null){
                            document.getElementById('cust-name').innerHTML = response.data.customer.name;
                        }
                        if(response.data.customer.phone != null){
                            document.getElementById('cust-phone').innerHTML = response.data.customer.phone;
                        }
                        if(response.data.customer.address != null){
                            document.getElementById('cust-address').innerHTML = response.data.customer.address;
                        }
                    }
                    // var invoiceTotal = 0;
                    for(let i=0; i<response.data.orderTransactionDetails.length ; i++){
                        let itemTemp = '<tr>\n' +
                            '                <th scope="row" style="border: 1px solid black;">index</th>\n' +
                            '                <td style="border: 1px solid black;">name</td>\n' +
                            '                <td style="border: 1px solid black;">unit</td>\n' +
                            '                <td style="border: 1px solid black;">quantity</td>\n' +
                            '                <td style="border: 1px solid black;">price</td>\n' +
                            '                <td style="border: 1px solid black;">vat</td>\n' +
                            '                <td style="border: 1px solid black;">total</td>\n' +
                            '            </tr>' +
                            '';
                        // var total = response.data.orderTransactionDetails[i].amount + response.data.orderTransactionDetails[i].productDTO.price * response.data.orderTransactionDetails[i].quantity *0.1
                        itemTemp = itemTemp.replace('index', i+1);
                        itemTemp = itemTemp.replace('name', response.data.orderTransactionDetails[i].productDTO.name);
                        itemTemp = itemTemp.replace('unit', "cái");
                        itemTemp = itemTemp.replace('quantity', response.data.orderTransactionDetails[i].quantity);
                        itemTemp = itemTemp.replace('price', convertMoney(response.data.orderTransactionDetails[i].productDTO.price));
                        itemTemp = itemTemp.replace('vat', convertMoney(response.data.orderTransactionDetails[i].productDTO.price * response.data.orderTransactionDetails[i].quantity *0.1));
                        itemTemp = itemTemp.replace('total', convertMoney(response.data.orderTransactionDetails[i].amount));
                        // invoiceTotal += total;
                        result += itemTemp;
                    }
                    document.getElementById('total-word').innerHTML = to_vietnamese(response.data.amount) + " đồng";
                    // result += '<tr>\n' +
                    //     '                <td style="border: 1px solid black;" colspan="6">vat</td>\n' +
                    //     '                <td style="border: 1px solid black;">invoiceTotal</td>\n' +
                    //     '      </tr>' +
                    //     '';

                    // itemTemp.replace('index', i);
                    // itemTemp.replace('index', i);
                    // console.log("inner: ", document.getElementById('invoice-items') );
                    document.getElementById('invoice-items').innerHTML = result;
                }

                else{
                    alert(response.message);
                    return;
                }
            },

            error: function () {
                alert('Tạo hóa đơn không thành công');
                return false;
            }
        }
    )

    var divContents = invoice_template.innerHTML;
    console.log("div: ", divContents);
    var width = window.screen.width;
    var height = window.screen.height;
    var a = window.open('', '', `left=0,top=0,width=${width},height=${height}`);
    a.document.write('<html>');
    a.document.write('<body>');
    a.document.write(divContents);
    a.document.write('</body></html>');
    a.document.close();
    a.print();
}

function OrderOfflineAction() {
    let cust_id = JSON.parse(localStorage.getItem('idDetalCustomer'));
    let payment_method = $('input[name="inlineRadioOptions"]:checked').val();
    let products = new Array();

    const cartAdmin = JSON.parse(localStorage.getItem('cartAdmin'));
    const totalMoney = cartAdmin.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity*1.1),
        0
    );
    console.log("total money: ",totalMoney);

    const customPay=parseInt(document.querySelector(".customer-pay").value,10)
    const money = cartAdmin.reduce(
        (previousValue, currentValue) => previousValue + (currentValue.product.price*currentValue.quantity*1.1),
        0
    );

    //validate
    if(customPay<money && moneyRadio1.checked){
        alert('Số tiền của bạn không đủ để thanh toán :(')
        return
    }
    if(Number.isNaN(customPay-money) && moneyRadio1.checked){
        alert(`Hãy xem lại phần nhập tiền của khách !`)
        return
    }
    for(let i=0; i<cartAdmin.length; i++){
        if(cartAdmin[i].product.quantity < cartAdmin[i].quantity){
            alert('Sản phẩm '+cartAdmin[i].product.name + ' vuợt quá số lượng tồn kho.');
            return;
        }
    }
    //
    for(let i=0; i<cartAdmin.length; i++){
        let item = new Object();
        item.product_id = cartAdmin[i].product.id;
        item.quantity = cartAdmin[i].quantity;
        item.amount = cartAdmin[i].product.price * cartAdmin[i].quantity*1.1;
        products.push(item);
    }

    let cust_object = new Object();
    cust_object.id = cust_id;
    let data = {
        "amount" : totalMoney,
        "payment_method" : payment_method,
        "orderTransactionDetails" : products,
        "customer" : cust_object
    };

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/admin/orders/orderOffline",
        data: JSON.stringify(data),
        dataType:"json",
        success: function (response){
            console.log("order_id: "+response);
            if(response.status === "00"){
                localStorage.removeItem('cartAdmin')
                localStorage.removeItem('idDetalCustomer')
                renderCartAdmin();
                if(confirm("Bạn có muốn tạo hóa đơn không?")){
                    printInvoice(payment_method, response.data);
                    location.reload();
                }else{
                    alert('Tạo đơn hàng thành công');
                    location.reload();
                }
            }
            else {
                alert(response.message);
                return;
            }
        },
        error: function (error){
            alert('Something went wrong');
            return;
        }


    });

}
function openModalData(oderId){
    $('#OderIdModal').val(oderId);
}


function cancelOrder() {
    let reason = $('textarea[name="cancelReason"]').val();
    console.log(reason);
    let orderid = $('#OderIdModal').val();
    console.log("/admin/orders/cancel?id="+orderid + "&reason="+reason);
    $.ajax({
        type: "GET",
        url: "/admin/orders/cancel?id="+orderid + "&reason="+reason,
        success: function (response){
            console.log(response);
            if(response.status === "00"){
                alert(response.message);
                window.location.href = "http://localhost:5000/admin/orders/cancelled";
            }
            else {
                alert(response.message);
                return;
            }
        },
        error: function (error){
            alert('Something went wrong');
            return;
        }


    });

}

const defaultNumbers =' hai ba bốn năm sáu bảy tám chín';

const chuHangDonVi = ('1 một' + defaultNumbers).split(' ');
const chuHangChuc = ('lẻ mười' + defaultNumbers).split(' ');
const chuHangTram = ('không một' + defaultNumbers).split(' ');

function convert_block_three(number) {
    if(number == '000') return '';
    var _a = number + ''; //Convert biến 'number' thành kiểu string

    //Kiểm tra độ dài của khối
    switch (_a.length) {
        case 0: return '';
        case 1: return chuHangDonVi[_a];
        case 2: return convert_block_two(_a);
        case 3:
            var chuc_dv = '';
            if (_a.slice(1,3) != '00') {
                chuc_dv = convert_block_two(_a.slice(1,3));
            }
            var tram = chuHangTram[_a[0]] + ' trăm';
            return tram + ' ' + chuc_dv;
    }
}

function convert_block_two(number) {
    var dv = chuHangDonVi[number[1]];
    var chuc = chuHangChuc[number[0]];
    var append = '';

    // Nếu chữ số hàng đơn vị là 5
    if (number[0] > 0 && number[1] == 5) {
        dv = 'lăm'
    }

    // Nếu số hàng chục lớn hơn 1
    if (number[0] > 1) {
        append = ' mươi';

        if (number[1] == 1) {
            dv = ' mốt';
        }
    }

    return chuc + '' + append + ' ' + dv;
}

const dvBlock = '1 nghìn triệu tỷ'.split(' ');

function to_vietnamese(number) {
    var str = parseInt(number) + '';
    var i = 0;
    var arr = [];
    var index = str.length;
    var result = [];
    var rsString = '';

    if (index == 0 || str == 'NaN') {
        return '';
    }

    // Chia chuỗi số thành một mảng từng khối có 3 chữ số
    while (index >= 0) {
        arr.push(str.substring(index, Math.max(index - 3, 0)));
        index -= 3;
    }

    // Lặp từng khối trong mảng trên và convert từng khối đấy ra chữ Việt Nam
    for (i = arr.length - 1; i >= 0; i--) {
        if (arr[i] != '' && arr[i] != '000') {
            result.push(convert_block_three(arr[i]));

            // Thêm đuôi của mỗi khối
            if (dvBlock[i]) {
                result.push(dvBlock[i]);
            }
        }
    }

    // Join mảng kết quả lại thành chuỗi string
    rsString = result.join(' ');

    // Trả về kết quả kèm xóa những ký tự thừa
    return rsString.replace(/[0-9]/g, '').replace(/ /g,' ').replace(/ $/,'');
}

