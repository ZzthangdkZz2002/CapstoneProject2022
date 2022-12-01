function giaohangnhanh(orderid) {
    var items = new Array();
    $.ajax(
        {
            type : "GET",
            contentType: "application/json",
            async : false,
            url : "/admin/orders/getOrder?id="+orderid,
            success: function (response){

                if(response.status === '00'){
                    for(let i=0; i < response.data.orderTransactionDetails.length; i++){
                        var item = new Object();
                        item.name = response.data.orderTransactionDetails[i].productDTO.name;
                        item.code = response.data.orderTransactionDetails[i].productDTO.code;
                        item.quantity = parseInt(response.data.orderTransactionDetails[i].quantity);
                        item.price = parseInt(response.data.orderTransactionDetails[i].productDTO.price);
                        items.push(item);
                    }
                }
                else{
                    alert(response.message);
                    return;
                }
            },

            error: function () {
                alert('error')
                return false;
            }
        }
    );
    var data = {
        "payment_type_id": 2,
        "note": $('textarea#note').val(),
        "from_name": $('#sender-name').val(),
        "from_phone": $('#sender-phone').val(),
        "from_address": $('#sender-address').val(),
        "from_ward_name": "",
        "from_district_name": "",
        "from_province_name": "",
        "required_note": $('#ship-note').val(),
        "return_name": $('#return-name').val(),
        "return_phone": $('#return-phone').val(),
        "return_address": $('#return-address').val(),
        "return_ward_name": "",
        "return_district_name": "",
        "return_province_name": "",
        "client_order_code": $('#order-id').val(),
        "to_name": $('#receive-name').val(),
        "to_phone": $('#receive-phone').val(),
        "to_address": $('#receive-address').val(),
        "to_ward_name": $( "#receive-wards option:selected" ).text(),
        "to_district_name": $( "#receive-district option:selected" ).text(),
        "to_province_name": $( "#receive-province option:selected" ).text(),
        "cod_amount": parseInt($('#cod-amount').val()),
        "content": "Theo New York Times",
        "weight": parseInt($('#total-mass').val()),
        "length": parseInt($('#product-length').val()),
        "width": parseInt($('#product-width').val()),
        "height": parseInt($('#product-height').val()),
        "pick_station_id": 1444,
        "deliver_station_id": null,
        "insurance_value": parseInt($('#total-value').val()),
        "service_id": 0,
        "service_type_id": 2,
        "coupon": null,
        "pick_shift": null,
        "pickup_time": 1665272576,
        "items": items
    };


    $.ajax(
        {
            type : "POST",
            contentType: "application/json",
            url : "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/create",
            headers: {
                'Content-Type':'application/json',
                'Token':'6178a70e-7006-11ed-a83f-5a63c54f968d',
                'ShopId':'120862'
            },
            data: JSON.stringify(data),
            success: function (response){
                console.log(response)
                if(response.code === '200'){
                    $.ajax(
                        {
                            type : "GET",
                            url : "/admin/orders/updateIsShip?id="+orderid,
                            success: function (response){
                                if(response.status === '00'){
                                    console.log("update is shipping success");
                                    window.location.href = "http://localhost:5000/admin/orders/shipping";
                                }
                                else{
                                    console.log("update is shipping fail");
                                    return;
                                }
                            },

                            error: function () {
                                alert('error')
                                return false;
                            }
                        }
                    );
                }
                else{
                    $.ajax(
                        {
                            type : "GET",
                            url : "/admin/orders/updateIsShip?id="+orderid,
                            success: function (response){
                                if(response.status === '00'){
                                    console.log("update is shipping success");
                                    window.location.href = "http://localhost:5000/admin/orders/shipping";
                                }
                                else{
                                    console.log("update is shipping fail");
                                    return;
                                }
                            },

                            error: function () {
                                alert('error')
                                return false;
                            }
                        }
                    );
                    alert(response.message_display);
                    return;
                }
            },

            error: function () {
                alert('error')
                return false;
            }
        }
    );
}