const cartTable = document.querySelector('.cartTable');
const checkTable = cartTable.querySelector('table');
let tableData = '';
tableData += '<thead class="table-light"><tr><th scope="col">Hình ảnh</th><th scope="col">Sản phẩm</th><th scope="col">Đơn giá</th><th scope="col" style="padding-left:30px;">Số lượng</th><th scope="col">Thành tiền</th><th scope="col">&nbsp;</th></tr></thead>';
if (JSON.parse(localStorage.getItem('listItems')) === null) {
    tableData += '<tr><td colspan="5">Chưa có sản phẩm nào trong Giỏ hàng</td></tr>'
} else {
    let count = 0;
    JSON.parse(localStorage.getItem('listItems')).map(data => {
        tableData += '<tbody><tr>'
            + ' <td>'
            + '   <div class="d-flex align-items-center flex-wrap flex-lg-nowrap">'
            + '     <a  href="' + data.img + '"><img id="img'+count+'" src="' + data.img + '" alt="" width="100" height="100"></a>'
            + '        </div>'
            + '    </td>'
            + '    <td>'
            + '            <div class="fw-bold" id="name'+count+'">' + data.name + '</div>'
            + '    </td>'
            + '    <td id="price'+count+'" class="item-price">' + data.price + '</td>'
            + '    <td>'
            + '        <div class="d-flex justify-content-between shadow-sm border" style="width: 115px;">'
            + '            <button onclick="addNum('+count+')" type="button" class="btn btn-link text-muted"><i'
            + '                    class="fas fa-plus fa-xs"></i></button>'
            + '            <input id="quan'+count+'" type="text" class="form-control form-control-sm border-0 text-center item-quantity"' 
            + '                value="' + data.quantity + '">'
            + '            <button onclick="minusNum('+count+')" type="button"  class="btn btn-link text-muted"><i'
            + '                    class="fas fa-minus fa-xs"></i></button>'
            + '        </div>'
            + '    </td>'
            + '    <td id="sum'+count+'" class="sumItem base-color">' + data.quantity * data.price + '</td>'
            + '    <td><a href="#" onclick=deleteI(this); class="text-dark">Xoá</a>'
            + '</tr></tbody>'
        count++;
    });
    checkTable.innerHTML = tableData;
    orderSum();
}    
    function deleteI(e) {
        let listItems = [];
        JSON.parse(localStorage.getItem('listItems')).map(data => {
            if (data.name != e.parentElement.parentElement.children[1].children[0].textContent) {
                listItems.push(data);
            }
        })
        localStorage.setItem('listItems', JSON.stringify(listItems));
        window.location.reload();
    };
    
    function addNum(count){
        
        var quan = parseFloat($('#quan'+count).val()) + 1;
        var total = parseFloat($('#price'+count).text()) * (parseFloat(quan));
        $('#quan'+count).val(quan);
        $('#sum'+count).html(total);
        orderSum();
        myOrder();
    }
    function minusNum(count){
        if(parseFloat($('#quan'+count).val()) > 0){
        var quan = parseFloat($('#quan'+count).val()) - 1;
        var total = parseFloat($('#price'+count).text()) * (parseFloat(quan));
        $('#quan'+count).val(quan);
        $('#sum'+count).html(total)
        }
    orderSum();
    myOrder();
    }
    
    function orderSum(){
        var hiddenElements = $("#CartTb").find(".sumItem");
        let s = 0;
			if (hiddenElements.length > 0) {
				$.each(hiddenElements, function (i, obj) {
					s += parseFloat(obj.innerHTML);
				});
			}

		$('#sumOrder').html(s);
		let discount = parseFloat($('#discount').text());
		$('#sumOrder2').html(s + discount);
    }

    function myOrder(){
        var size = $('#CartTb tbody tr').length;
            let listItems = []; 
            let sum = $("#sumOrder").text();
			if(size > 0){
				for (var i = 0; i < size; i++) {
				    var index = i;
			        let item = {
			            img: $('#img'+index).attr('src'),
                        name: $("#name"+index).text(),
                        price: parseFloat($("#price"+index).text()),
                        quantity: parseInt($("#quan"+index).val())
                    }
                    listItems.push(item);
		    	}
		    	localStorage.setItem("listItems", JSON.stringify(listItems));
		        localStorage.setItem("sumPrice", JSON.stringify(sum));
			} else {
			}
    }

