

function getContextPath() {
   return  window.location.protocol + "//" + window.location.host
}

function search() {
    var url = window.location;
    var prevUrl = document.referrer;
    
    let userTerm = $('#txtCity').val();
    if (userTerm === "") {
            alert("Bạn cần nhập từ khóa tìm kiếm!");
        
        $('#txtSearch').focus();
    }
    else {
        var urlService = "";
        urlService += this.getContextPath() + "/api/searchAgency.json?q="+ userTerm;
        $.ajax({
            type: "GET",
            url:urlService,
            success: function(resp){
              console.log('Data: ', resp);
              var $pagination = $('#pagination'), 
                totalRecords = 0,
                records = [],
                displayRecords = [],
                recPerPage = 10,
                page = 1,
                totalPages = 0;
                var storedLstSearch = resp[0];
                records = storedLstSearch;
                totalRecords = records.length;
                if (totalRecords == 0 || totalRecords == undefined) {
                    $('.agency-content').show();
                    $('.agency-pra').show();
                    $('.search-result_item').hide();
                    $('#pagination').hide();
                    alert('Không có kết quả nào được tìm thấy!');
                    return;
                } else {
                    $('.agency-content').hide();
                    $('.agency-pra').hide();
                    $('.search-result_item').show();
                    $('#pagination').show();
                    totalPages = Math.ceil(totalRecords / recPerPage);
                    apply_pagination();
                    $('.totalSearch').text(totalRecords);
                    $('.keywordSearch').text(localStorage.getItem("userTerm"))
                    $('.content').css("background-color", "#FFF");
                    var lent = $(".limit-text-250");
                    for (let i = 0; i < lent.length; i++) {
                         var txtDesc = $(lent[i]).html();
                         console.log(txtDesc);
                        if(txtDesc.length > 150) {
                           let txt = txtDesc.substr(0, 150);
                           $(lent[i]).html(txt)
                        }
                    }
                }

                function apply_pagination() {
                      $pagination.twbsPagination({
                            totalPages: totalPages,
                            visiblePages: 6,
                            onPageClick: function (event, page) {
                                  displayRecordsIndex = Math.max(page - 1, 0) * recPerPage;
                                  endRec = (displayRecordsIndex) + recPerPage;
                                 
                                  displayRecords = records.slice(displayRecordsIndex, endRec);
                                  generateContent();
                            }
                      });
                }
                
                // generate content search result
                function generateContent() {
                     var source = $("#search-results-template").html();
                     var template = Handlebars.compile(source);
                     var context = { results: displayRecords };
                     var html = template(context);
                    $('.search-result_item').html(html);
                }
                $(".limit-text-250 em").css("font-weight", "bold");
                
            },error: function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX call failed.');
                console.log(textStatus + ': ' + errorThrown);
            }
        });

    }
}









