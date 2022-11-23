


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
                    // $('#p-quantity-'+p_id).innerHTML = "0";
                    // document.getElementById('p-quantity-'+p_id).style.display = "none";
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
        // $('#p-quantity-'+p_id).innerHTML = "0";
        // document.getElementById('p-quantity-'+p_id).style.display = "none";
    }
    $.ajax(
        {
            type : "GET",
            url : "/admin/warehouses/getLocation?pid="+p_id+"&wid="+w_id,
            success: function (response){
                console.log(response)
                if(response.status === '00'){
                    for(var i=0; i < response.data.length; i++){

                    }
                    // $('#'+idname).empty().append(`<option value="0">--------Chọn vị trí--------</option>`)
                    // for(var i=0; i < response.data.length; i++){
                    //     optionText = response.data[i].name;
                    //     optionValue = response.data[i].id;
                    //     $('#'+idname).append(`<option value="${optionValue}">
                    //                    ${optionText}
                    //               </option>`);
                    // }
                    // document.getElementById('location-list-'+p_id).style.display = "block";
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