

//increase-decrease button
function increaseValue() {
  var value = parseInt(document.getElementById('item-quantity').value, 10);
  value = isNaN(value) ? 0 : value;
  value++;
  document.getElementById('item-quantity').value = value;
}

function decreaseValue() {
  var value = parseInt(document.getElementById('item-quantity').value, 10);
  value = isNaN(value) ? 0 : value;
  value < 1 ? value = 1 : '';
  value--;
  document.getElementById('item-quantity').value = value;
}

//Save into localStorage
var addToCart = document.getElementById("addToCart");
console.log(addToCart);
let listItems = [];
let sum;
if (JSON.parse(localStorage.getItem("sum")) !== null){
    sum = JSON.parse(localStorage.getItem("sum"));
    $("#cartNumber").text(sum);
}
let image = document.getElementById("item-img").src;

addToCart.addEventListener("click", function (e) {
    formatNumberComponent.disableAutoNumeric();
    console.log($("#item-price").text());
    let item = {
        img: "/static-assets/images/san-pham/" + image.slice(image.lastIndexOf("/") + 1),
        name: document.getElementsByClassName("item-name")[0].textContent,
        price: parseFloat($("#item-price").text())*1000,
        quantity: parseInt($("#item-quantity").val())
    };
    console.log(item);
    if (JSON.parse(localStorage.getItem('listItems')) === null) {
        listItems.push(item);
        $("#cartNumber").text(item.quantity);
        sum = $("#cartNumber").text();
        localStorage.setItem("sum", JSON.stringify(sum));
        localStorage.setItem("listItems", JSON.stringify(listItems));
        window.location = "/gio-hang";
    } else {
        let localItem = [];
        let localQuan = parseInt(JSON.parse(localStorage.getItem("sum")));
        localItem = JSON.parse(localStorage.getItem("listItems"));
        for (let i = 0; i < localItem.length; i++) {
            if (item.name == localItem[i].name) {
                item.quantity += localItem[i].quantity;
            }
            else {
                listItems.push(localItem[i]);
            }

        }
        listItems.push(item);
        localQuan += item.quantity;
        localStorage.setItem("sum", JSON.stringify(localQuan));
        localStorage.setItem("listItems", JSON.stringify(listItems));
        window.location = "/gio-hang";
    };
})