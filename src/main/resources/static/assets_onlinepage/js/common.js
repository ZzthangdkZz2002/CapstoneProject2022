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