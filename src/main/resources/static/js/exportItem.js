var exportItem = []

function unique(arr) {
    return Array.from(new Set(arr))
}


const saveTransaction= document.getElementById("save-transaction")
saveTransaction.addEventListener("click",()=>{
    document.getElementById("table-infor-export").innerHTML="";
    const haha = document.querySelectorAll('.checkbox-choose')
    let resd
    const fgh=[]
    const p=document.querySelectorAll(".huhu")
    for (let i=0;i<p.length;i++){
        resd  = p[i].id.split("-")
        fgh.push(resd[0])
    }
    console.log('fgh',fgh)
    var checkedid=[]
    var checkedChoose=[]
    var infoTable=[]
    for(let i =0 ;i<haha.length;i++){
        const id=haha[i].value
        if(haha[i].checked==true){
            var str=haha[i].id
            var res = str.split("-")
            checkedid.push(
                res[0]
            )
            if(parseInt($(`.${id}-quantity`).val(),10)!=0){
                checkedChoose.push({
                    id:haha[i].value,
                    idP:res[0],
                    locationID:res[1],
                    quantityInput:parseInt($(`.${id}-quantity`).val(),10),
                    quantityOrder : document.getElementById(`${res[0]}-quantity-order`).value,
                    code:res[2],
                    name:res[3],
                    image:res[4]
                })
            }
        }
    }
    var  temp=unique(checkedid)
    console.log('temp',temp)
    var sameArray = fgh.length === temp.length && fgh.every((value, index) => value === temp[index])
    console.log(sameArray)
    if(sameArray == false){
        alert('Bạn cần chọn đủ hàng trong đơn trước khi xuất !')
        infoTable.splice(0,infoTable.length)
        saveTransaction.removeAttribute("data-toggle")
        saveTransaction.removeAttribute("data-target")
        return
    }
    if(checkedChoose.length>0){


        console.log('temp',temp)
        console.log('checkedChoose',checkedChoose)

        for (let i=0;i<temp.length;i++) {
            console.log('i',i)
            var ki = checkedChoose.filter((item) => item.idP == temp[i])
            console.log("huhuuu",ki)
            console.log('koko')
            const abc = ki.reduce(
                (previousValue, currentValue) => previousValue + currentValue.quantityInput,
                0
            );
            let inforQuantity
            console.log('jijij',ki)

            // for(let j=0; j<ki.length;j++){
            if(ki[0] != undefined){
                console.log('koko',0)
                if(abc != parseInt(ki[0].quantityOrder,10)){
                    console.log('koko')
                    console.log('abc',abc)
                    console.log('ki[j].quantityOrder',ki[0].quantityOrder)

                    // checkedChoose=checkedChoose.filter((item) => item.idP != temp[i])
                    if(parseInt(abc,10)  > parseInt(ki[0].quantityOrder,10)  ){
                        inforQuantity=`Xuất thừa ${parseInt(abc,10) - parseInt(ki[0].quantityOrder,10)}`
                    }
                    if(abc < ki[0].quantityOrder ){
                        inforQuantity=`Xuất thiếu ${parseInt(ki[0].quantityOrder,10)- parseInt(abc,10) }`
                    }

                    const inforItem={
                        inforQuantity:inforQuantity,
                        quantityInput:abc,
                        quantityOrder : ki[0].quantityOrder,
                        code:ki[0].code,
                        name:ki[0].name,
                        image:ki[0].image

                    }


                    infoTable.push(inforItem)
                    console.log('hohoho',checkedChoose)
                    console.log('inforTable',infoTable)
                }
            }
            // }
        }


    }


    if(infoTable.length >0){



        saveTransaction.setAttribute("data-toggle","modal")
        saveTransaction.setAttribute("data-target","#exampleModal")
        const expo=document.getElementById("table-infor-export")
        infoTable.map((item,key)=>{
            return $('#table-infor-export').append(`

    <tr>
      <td >${item.code}</td>
      <td>${item.name}</td>
      <td><img src="${item.image}" alt="error_img" width="500" height="600"></td>
      <td>${item.quantityOrder}</td>
       <td>${item.quantityInput}</td>
        <td><p style="color: red">${item.inforQuantity}</p></td>
    </tr>

        `)
        })

    }

    else {
        saveTransaction.removeAttribute("data-toggle")
        saveTransaction.removeAttribute("data-target")
        console.log('checkedChoose',checkedChoose)

        const temp0rderId=document.getElementById("order-id").textContent;
        const orderId=temp0rderId.substring(1,temp0rderId.length)
        const exportName=document.getElementById("exportName").value;
        const receive=document.getElementById("receive").value;
        const mota=document.getElementById("mota").value;
        const dataProduct=checkedChoose .map((item)=>{
            return {

                "product_id" : item.idP,
                "productWarehouseExportDTOS" :
                    [
                        {
                            "location_id" : item.locationID,
                            "quantity" : item.quantityInput
                        }
                    ]

            }
        })

        const data={
            "order_id" : orderId,
            "exportPerson":exportName,
            "receivedPerson":receive,
            "description" : mota,
            "exportProducts" : dataProduct
        }
        console.log("dataProduct",dataProduct)


        $.ajax(
            {
                type : "POST",
                contentType: "application/json",

                url : "http://localhost:5000/admin/warehouses/export/add",

                data: JSON.stringify(data),
                success: function (response){
                    if(response.status == '00'){
                        alert("Xuất kho thành công");
                        window.location.href = "http://localhost:5000/admin/warehouses/export/add";
                    }
                    else{
                        alert("Xuất kho thất bại");
                    }
                },

                error: function () {
                    console.log("error")
                    return false;
                }
            }
        );

    }




})















var result=[]
function increasing(id,total,p_id,w_id){
    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getLocation?pid="+p_id+"&wid="+w_id,
            success: function (response){
                if(response.status === '00'){
                    result =response.data;
                    const check = result.findIndex((item)=>item.id==id);
                    if(check !=-1 ){
                        if($(`.${id}-quantity`).val()>total-1){
                            alert('Số lượng chọn không được lớn hơn số lượng trong kho !.Xin thử lại');
                            return
                        }
                        let a =parseInt($(`.${id}-quantity`).val(),10)+1;
                        $(`.${id}-quantity`).val(a)
                    }
                }}})

}
function decreasing(id,p_id,w_id){

    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getLocation?pid="+p_id+"&wid="+w_id,
            success: function (response){

                if(response.status === '00'){
                    result =response.data;

                    const check = result.findIndex((item)=>item.id==id);
                    if(check !=-1 ){
                        if($(`.${id}-quantity`).val()<=1){
                            alert('Số lượng phải lớn hơn 1 !.Xin thử lại');
                            return
                        }
                        let a =parseInt($(`.${id}-quantity`).val(),10)-1;

                        $(`.${id}-quantity`).val(a)
                    }
                }}})

}

const handleQuantity=(id,p_id,w_id,total,idP,locationID)=>{
    const quantityInput = $(`.${id}-quantity`).val()
    if(  quantityInput==''){
        $(`.${id}-quantity`).val(1)
        return
    }
    const isDigit = /^[0-9]+$/;
    if( !isDigit.test(quantityInput)){
        let a =quantityInput.substring(0,quantityInput.length-1);
        $(`.${id}-quantity`).val(a)
        alert('Bạn vui lòng nhập đúng định dạng số!.Xin thử lại');
        return
    }
}

function genDetailLocation(w_id, p_id) {
    var idname = 'location-list-'+p_id;
    if(w_id == '0'){
        $('#'+idname).empty().append(`<option value="0">--------Chọn vị trí--------</option>`)

    }
    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getLocation?pid="+p_id+"&wid="+w_id,
            success: function (response){
                console.log('response.data',response.data)
                if(response.status === '00'){
                    let idlocation = 'detail-location-'+p_id;
                    $('#'+idlocation).empty();
                    ar=response.data
                    response.data.map((item,key)=>{

                        console.log(item)
                        return   $('#'+idlocation).append(`   
   
          
           <div class="d-flex" style="display: flex;align-items: center;margin-bottom: 10px;" >
        <input type="checkbox" class="checkbox-choose" id="${item.product.id}-${item.productLocation.id}-${item.product.code}-${item.product.name}-${item.product.image}" name="choose-location" value="${item.id}">

     <h4 style="margin-right: 3px">${item.productLocation.name}</h4>
        <input min="0"  name="quantity" value=${item.total} type="text" 
        class="${item.id}-quantity" style="width: 50px;"  onkeyup="handleQuantity(${item.id},${p_id},${w_id},${item.total},${item.product.id},${item.productLocation.id})"/>
     <div style="display: flex;flex-direction: column;">
     
     <i class="fas fa-plus" sty le="cursor: pointer;" onclick="increasing(${item.id},${item.total},${p_id},${w_id})"></i>
 
 <i class="fas fa-minus" style="cursor: pointer;" onclick="decreasing(${item.id},${p_id},${w_id})"></i>
     </div>

    </div>
`)
                    })
                    document.getElementById("detail-location")


                }
                else{
                    alert(response.data);
                    return;
                }
            },

            error: function () {
                alert('error');
                return false;
            }
        }
    );
}






function findAvailableItemInWarehouse(p_id) {
    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getWarehouse?pid="+p_id,
            success: function (response){
                console.log(response)
                if(response.status === '00'){
                    var idname = 'warehouses-list-'+p_id;
                    $('#location-list-'+p_id).empty().append(`<option value="0">--------Chọn vị trí--------</option>`)

                    $('#'+idname).empty().append(`<option value="0">--------Chọn kho hàng--------</option>`)
                    for(var i=0; i < response.data.length; i++){
                        optionText = response.data[i].name;
                        optionValue = response.data[i].id;
                        $('#'+idname).append(`<option value="${optionValue}">
                                       ${optionText}
                                  </option>`);
                    }
                    document.getElementById('warehouses-list-'+p_id).style.display = "block";
                }
                else{
                    alert(response.data);
                    return;
                }
            },

            error: function () {
                alert('error');
                return false;
            }
        }

    );
}

function genProductQuantity(l_id, p_id) {
    var idname = 'p-quantity-'+p_id;
    if(l_id == '0'){
        $('#p-quantity-'+p_id).innerHTML = "0";
        document.getElementById('p-quantity-'+p_id).style.display = "none";
    }else{
        $.ajax(
            {
                type : "GET",
                url : "/admin/warehouses/getProductQuantity?lid="+l_id+"&pid="+p_id,
                success: function (response){
                    console.log(response)
                    if(response.status === '00'){
                        console.log(response.data);
                        document.getElementById(idname).innerHTML = response.data;
                        document.getElementById('p-quantity-'+p_id).style.display = "block";
                    }
                    else{
                        alert(response.message);
                        return;
                    }
                },

                error: function () {
                    alert('error');
                    return false;
                }
            }

        );
    }
}

function genProductQuantity(l_id, p_id) {
    var idname = 'p-quantity-'+p_id;
    if(l_id == '0'){
        $('#p-quantity-'+p_id).innerHTML = "0";
        document.getElementById('p-quantity-'+p_id).style.display = "none";
    }else{
        $.ajax(
            {
                type : "GET",
                url : "/admin/warehouses/getProductQuantity?lid="+l_id+"&pid="+p_id,
                success: function (response){
                    console.log(response)
                    if(response.status === '00'){
                        console.log(response.data);
                        document.getElementById(idname).innerHTML = response.data;
                        document.getElementById('p-quantity-'+p_id).style.display = "block";
                    }
                    else{
                        alert(response.message);
                        return;
                    }
                },

                error: function () {
                    alert('error');
                    return false;
                }
            }

        );
    }
}