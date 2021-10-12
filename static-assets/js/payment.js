let totalOrder = parseFloat(JSON.parse(localStorage.getItem('sumPrice')));
$('#totalOrder').html(totalOrder);
let discount = parseFloat($('#discount').text());
$('#totalOrder2').html(totalOrder + discount);