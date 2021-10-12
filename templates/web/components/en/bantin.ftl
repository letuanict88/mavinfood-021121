<#import "/templates/system/common/cstudio-support.ftl" as studio />

    <section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="p-3 h4 base-bg-color text-white fw-bold text-uppercase shadow mb-4">Mavin News</h1>
          <div class="bg-white shadow p-3" style="height: 400px;">
            <#list news as news>
            <#if news?is_first>
            <div class="row row-cols-1 row-cols-md-2">
              <div class="col">
                <div class="mb-3 p-2 mb-md-0"><img width="550" height="330" style="width: -webkit-fill-available;" src="${news.image}" alt=""></div>
              </div>
              <div class="col" style="display: flex;flex-direction: column;justify-content: space-between;">
                <div>
                    <h3 class="fw-bold base-color">${news.title}</h3>
                    <div class="limit-text">${news.content}</div>
                </div>
                <div class="view-more">
                  <a class="d-flex align-items-center" href="${news.url}">
                    <span class="fw-bold text-muted pe-2 small">See more</span>
                    <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg"></i></span>
                  </a>
                </div>
              </div>
            </div>
            </#if>
            </#list>
          </div>
          <div class="row row-cols-1 row-cols-md-3" id="field-news" style="margin-top: 2rem!important;height: 390px;">
            <#list news as news>
            <#if news?is_first?c == "false">
            <div class="col fields">
              <div class="bg-white shadow p-4 p-md-4 mb-4" style="position: relative;height:100%">
                <div class="d-flex flex-column">
                  <a href="${news.url}"><img width="308" height="214" src="${news.image}" alt=""></a>
                  <h4 class="fs-6 my-3"><a class="fw-bold base-color" href="${news.url}">${news.title}</a></h4>
                  <div class="view-more">
                    <a class="d-flex align-items-center" href="${news.url}" style="position: absolute;bottom: 20px;">
                      <span class="fw-bold text-muted pe-2 small">See more</span>
                      <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg"></i></span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            </#if>
            </#list>
          </div>
          <nav class="pagination-mf" aria-label="" style="margin-top: 3.5rem!important;" >
            <ul class="pagination pagi2 justify-content-center">
              <li id="previous-page2" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
              
              
              
              
            </ul>
          </nav>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
    <script>
        var numberOfFieldsNews = $("#field-news .fields").length;
         limitPerPage = 3;
         $("#field-news .fields:gt(" + (limitPerPage -1 )+")").hide();
         
         var totalPages2 = Math.ceil(numberOfFieldsNews / limitPerPage );
         $('.pagi2').append("<li class='page-item current-page active'><a class='page-link' href='javacript:void(0)'>"+ 1+"</a></li>");
         for (let i=2; i<= totalPages2;i++){
         $(".pagi2").append("<li class='page-item current-page'><a class='page-link' href='javascript:void(0)'>"+ i +"</a></li>");
         if(i == totalPages2){
            $('.pagi2').append("<li id='next-page2' class='page-item'><a class='page-link' href='javascript:void(0)'><span class='fas fa-angle-right'></a></li>");
         }
         
         $('.pagi2 li.current-page').on("click", function(){
            if($(this).hasClass("active")){
                return false;
            } else{
                var currentPage = $(this).index();
                $('.pagi2 li').removeClass("active");
                $(this).addClass("active");
                $("#field-news .fields").hide();
                var total = limitPerPage * currentPage;
                for(let i = total - limitPerPage; i<total; i++){
                    $("#field-news .fields:eq("+ i +")").show();
                }
            }
        });
        
        $("#next-page2").on("click", function() {
          var currentPage = $(".pagi2 li.active").index(); 
          if (currentPage === totalPages2) {
            return false; 
          } else {
            currentPage++; 
            $(".pagi2 li").removeClass('active'); 
            $("#field-news .fields").hide();
            var total = limitPerPage * currentPage; 
            for (let i = total - limitPerPage; i < total; i++) {
              $("#field-news .fields:eq(" + i + ")").show(); 
            }
        
            $(".pagi2 li.current-page:eq(" + (currentPage -1) + ")").addClass('active'); 
          }
        });
    
    
        $("#previous-page2").on("click", function() {
              var currentPage = $(".pagi2 li.active").index(); 
              if (currentPage === 1) {
                return false; 
              } else {
                currentPage--; 
                $(".pagi2 li").removeClass('active'); 
                $("#field-news .fields").hide();
                var grandTotal = limitPerPage * currentPage; 
                for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
                  $("#field-news .fields:eq(" + i + ")").show();
                }
                $(".pagi2 li.current-page:eq(" + (currentPage - 1) + ")").addClass('active'); 
              }
            });
        }
    </script>
<@studio.toolSupport />