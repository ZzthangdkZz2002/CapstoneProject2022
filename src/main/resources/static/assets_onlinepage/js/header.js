const count = document.querySelector('.count');
const countQuantity=()=>{
    return  countCart = JSON.parse(localStorage.getItem('cart'))?.reduce(
        (previousValue, currentValue) => previousValue + currentValue.quantity,
        0
    );
}
count.textContent=countQuantity();


let productLists = [];

$.ajax({
    type: "GET",
    async: false,
    contentType: false,
    url: "/homepage/products",
    success: function (response){
        if(response.status === "00"){
            productLists = response.data;
        }
        else {
            productLists = [];
        }
    },
    error: function (){
        return false;
    }


});

function autocomplete(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
        var a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) { return false;}
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);
        /*for each item in the array...*/
        for (i = 0; i < arr.length; i++) {
            if (arr[i].name.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                b = document.createElement("DIV");
                b.style.display='flex'
                b.className = arr[i].id;
                b.addEventListener('click', (e)=>{
                    localStorage.setItem('idDetald',e.target.className);
                });
                b.innerHTML = `<img src="${contextPath}/img/${arr[i].image}" alt="img-produc" width="50" height="50">`;
                b.innerHTML +=`<div class="infor-search" style="display:flex;flex-direction: column;margin-left:80px">
              <strong >${arr[i].name}</strong>
              <span >${arr[i].price}</span>

              </div>`


                b.innerHTML += `<input type='hidden' value=${arr[i].name}>`;

                b.addEventListener("click", function(e) {
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
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}

autocomplete(document.getElementById("btnProductSearch"), productLists);