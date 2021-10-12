function getContextPath() {
   return  window.location.protocol + "//" + window.location.host
}
function searchSku() {
    var url = window.location;
    var prevUrl = document.referrer;
    
    let userTerm = $('#skuVal').val();
    if (userTerm === "") {
            alert("Bạn cần nhập mã sản phẩm!");
    
        $('#skuVal').focus();
    }
    else {
        var urlService = "";
        var urlRoot = this.getContextPath();
        urlService += urlRoot + "/api/searchProductSku.json?q="+ userTerm;
        $.ajax({
            type: "GET",
            url:urlService,
            success: function(resp){
              if(resp) {
                  if (resp[0]) {
                      let rs = resp[0];
                      if (rs.length === 0) {
                          alert('Không tìm thấy kết quả nào!');
                          return;
                      }
                      
                      if (userTerm !== rs[0].sku) {
                          alert('Không tìm thấy kết quả nào!');
                          return;
                      }
                      window.location.href = urlRoot + rs[0].url;
                  } else {
                      alert('Không tìm thấy kết quả nào!');
                      return;
                  }
              } else {
                  alert('Không tìm thấy kết quả nào!');
                  return;
              }
                
            },error: function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX call failed.');
                console.log(textStatus + ': ' + errorThrown);
            }
        });

    }
}