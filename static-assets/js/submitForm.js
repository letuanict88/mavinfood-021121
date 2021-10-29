function mySendEmail(){
    let name = $("#name").val();
    let email = $("#email").val();
    let address = $("#address").val();
    let phone = $("#phone").val();
    let note = $("#note").val();
    let listItems = JSON.parse(localStorage.getItem('listItems'));
    let sumPrice = JSON.parse(localStorage.getItem('sumPrice'));
    let tableItems = '<tr><th>Sản phẩm</th><th>Đơn giá</th><th>Số lượng</th><th>Thành tiền</th></tr>';
    JSON.parse(localStorage.getItem('listItems')).map(data => {
        tableItems += '<tr>'
            + '    <td>' + data.name + '</td>'
            + '    <td>' + data.price + '</td>'
            + '    <td>' + data.quantity + '    </td>'
            + '    <td>' + data.quantity * data.price + '</td>'
            + '</tr>'
        });
    console.log(name, email, address, phone, note, tableItems, sumPrice)
    sendEmail(name, email, address, phone, note, tableItems, sumPrice)
    localStorage.removeItem("listItems");
    localStorage.removeItem("sumPrice");
    localStorage.removeItem("sum");
}

function sendEmail(name, email, address, phone, note, tableItems, sumPrice){
    Email.send({
    Host : "smtp.gmail.com",
    Username : "online.mavinfood@gmail.com",
    Password : "zjqhidqutntdsyog",
    To : "huong.nguyen@mavinfood.com",
    From : "online.mavinfood@gmail.com",
    Subject : `Khách hàng: ${name} với Email: ${email} có một đơn hàng mới`,
    Body : `Tên khách hàng: ${name} <br/> `
         + `Email: ${email} <br/>`
         + `Địa chỉ: ${address} <br/>`
         + `Số điện thoại liên hệ: ${phone} <br/>`
         + `Ghi chú: ${note} <br/>`
         + `Danh sách sản phẩm:<br/>`
         + `${tableItems} <br/>`
         + `Tổng giá trị (chưa tính ship): ${sumPrice} <br/>`         
         
}).then(
    function(respond){
        if(respond){
            window.location.href = "/xu-ly-don-hang"
        }
    }
   
);
}
