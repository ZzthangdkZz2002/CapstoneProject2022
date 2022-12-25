
function convertMoney(num) {
    if(num == null){
        num = "0";
    }
    return num.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
}


let currency_common = document.getElementsByClassName('currency-text');
for(let i = 0; i < currency_common.length; i++){
    currency_common[i].textContent = convertMoney(Number(currency_common[i].textContent));
}

// currency_common.innerHTML = convertMoney(currency_common.text());



function sendOtp() {
    var phone = $('#txtPhoneNumber').val();
    console.log("phone: "+ phone);

    var data = {
        "phoneNumber" : phone
    }
    $.ajax({
        type: "POST",
        contentType: "application/json",
        data : JSON.stringify(data),
        url: "/api/sms/sendSms",
        success: function (response){
            if(response.status === "00"){
                console.log("otp: "+ response.data);
                window.location.href = "http://localhost:5000/tracking/verifyOtp?phone="+phone;
            }
            else {
                alert(response.message)
                return
            }
        },
        error: function (){
            alert("get otp error")
            return
        }


    });
}