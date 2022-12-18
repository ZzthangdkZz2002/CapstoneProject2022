var exportItem = []
function  handleSubmit(){

    const temp0rderId=document.getElementById("order-id").textContent;
    const orderId=temp0rderId.substring(1,temp0rderId.length)
    const exportName=document.getElementById("exportName").value;
    const receive=document.getElementById("receive").value;
    const mota=document.getElementById("mota").value;

    const dataProduct=exportItem .map((item)=>{
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

var result=[]
function increasing(id,total,p_id,w_id){
    document.getElementById(`${id}-choose`).checked = false
    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getLocation?pid="+p_id+"&wid="+w_id,
            success: function (response){

                if(response.status === '00'){
                    result =response.data;
                    console.log('gdgdggdgdg',result)
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

const handleQuantity=(id,total)=>{
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

function chooseLocation(id,p_id,w_id,total,idP,locationID){
    console.log("locationID",locationID)
    const location = document.getElementById(`${id}-choose`)
    const quantityInput = $(`.${id}-quantity`).val()
    const quantityOrder = document.getElementById(`${idP}-quantity-order`).value;


    if(location.checked == true){

        let a = {
            id:id,
            quantityInput:parseInt(quantityInput,10),
            locationID:locationID,
            idP:idP
        }

        const check = exportItem.findIndex((item)=>item.id==id);

        if(check !=-1 ){
            return;


        }else {
            exportItem.push(a)
            console.log('haha',exportItem)
            const abc= exportItem.filter((item)=>item.idP===idP).reduce(
                (previousValue, currentValue) => previousValue + currentValue.quantityInput,
                0
            );
            if(abc !=parseInt(quantityOrder,10) ){
                alert(`Bạn cần nhập đúng số lượng tổng là ${quantityOrder}, hãy xem lại`);
                location.checked = false
                return;
            }


        }
    }else {
        console.log('location.checked == false')
        const check = exportItem.findIndex((item)=>item.id==id);
        exportItem.splice(check,1)
        console.log('huhuhu',exportItem)
    }
    console.log('hihihih',exportItem)
}


function decreasing(id,p_id,w_id){
    document.getElementById(`${id}-choose`).checked = false

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


                    response.data.map((item,key)=>{
                        let idlocation = 'detail-location-'+p_id;

                        return   $('#'+idlocation).append(`   
   
          
           <div class="d-flex" style="display: flex;align-items: center;margin-bottom: 10px;" >
        <input type="checkbox" onchange="chooseLocation(${item.id},${p_id},${w_id},${item.total},${item.product.id},${item.productLocation.id})" id="${item.id}-choose" name="choose-location" value="0">

     <h4 style="margin-right: 3px">${item.productLocation.name}</h4>
        <input min="0"  name="quantity" value=${item.total} type="text" 
        class="${item.id}-quantity" style="width: 50px;"  onkeyup="handleQuantity(${item.id})"/>
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