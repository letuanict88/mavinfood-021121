<#import "/templates/system/common/cstudio-support.ftl" as studio />

    <section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="p-3 h4 base-bg-color text-white fw-bold text-uppercase shadow mb-4">bếp mavin</h1>
          <div class="img-featured position-relative mb-4">
            <div class="position-absolute top-50 start-50 translate-middle title w-100 p-3">
              <h3 class="fw-bold text-white mb-0">Xúc xích chiên bơ cho ngày mưa lạnh</h3>
            </div>
            <img class="img-fluid" src="/static-assets/dist/temp/bep-mavin-1.jpg" alt="">
            <div class="position-absolute top-100 start-50 translate-middle d-none d-md-block">
              <img src="/static-assets/dist/images/logo-circle2.png" alt="">
            </div>
          </div>
          <div class="row row-cols-1 row-cols-md-2" id="kitchen-news">
            <#list recipes as arecipe>
            <div class="col mb-4 fields">
              <div class="d-flex flex-column">
                <a href="${arecipe.url}"><img width="546" height="330" src="${arecipe.image}" alt=""></a>
                <div class="row g-0">
                  <div class="col">
                    <a class="d-block px-3 py-2 base-bg-color fw-bold text-white" href="${arecipe.url}">${arecipe.title}</a>
                  </div>
                  <div class="col-auto">
                    <a class="d-flex align-items-center h-100 px-3 py-2 bg-orange base-color" href="${arecipe.url}">
                      <span>Xem tiếp</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            </#list>
          </div>
          <nav class="pagination-mf" aria-label="">
            <ul class="pagination pagi justify-content-center">
              <li id="previous-page" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
              
            </ul>
          </nav>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
    <script>
        var numberOfFieldsNews = $("#kitchen-news .fields").length;
         limitPerPage = 2;
         $("#kitchen-news .fields:gt(" + (limitPerPage -1 )+")").hide();
         
         var totalPages2 = Math.round(numberOfFieldsNews / limitPerPage );
         $('.pagi').append("<li class='page-item current-page active'><a class='page-link' href='javacript:void(0)'>"+ 1+"</a></li>");
         for (let i=2; i<= totalPages2;i++){
         $(".pagi").append("<li class='page-item current-page'><a class='page-link' href='javascript:void(0)'>"+ i +"</a></li>");
         if(i == totalPages2){
            $('.pagi').append("<li id='next-page' class='page-item'><a class='page-link' href='javascript:void(0)'><span class='fas fa-angle-right'></a></li>");
         }
         $('.pagi li.current-page').on("click", function(){
            if($(this).hasClass("active")){
                return false;
            } else{
                var currentPage = $(this).index();
                $('.pagi li').removeClass("active");
                $(this).addClass("active");
                $("#kitchen-news .fields").hide();
                var total = limitPerPage * currentPage;
                for(let i = total - limitPerPage; i<total; i++){
                    $("#kitchen-news .fields:eq("+ i +")").show();
                }
            }
        });
        
        $("#next-page").on("click", function() {
          var currentPage = $(".pagi li.active").index(); 
          if (currentPage === totalPages2) {
            return false; 
          } else {
            currentPage++; 
            $(".pagi li").removeClass('active'); 
            $("#kitchen-news .fields").hide();
            var total = limitPerPage * currentPage; 
            for (let i = total - limitPerPage; i < total; i++) {
              $("#kitchen-news .fields:eq(" + i + ")").show(); 
            }
        
            $(".pagi li.current-page:eq(" + (currentPage -1) + ")").addClass('active'); 
          }
        });
    
    
        $("#previous-page").on("click", function() {
              var currentPage = $(".pagi li.active").index(); 
              if (currentPage === 1) {
                return false; 
              } else {
                currentPage--; 
                $(".pagi li").removeClass('active'); 
                $("#kitchen-news .fields").hide();
                var grandTotal = limitPerPage * currentPage; 
                for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
                  $("#kitchen-news .fields:eq(" + i + ")").show();
                }
                $(".pagi li.current-page:eq(" + (currentPage - 1) + ")").addClass('active'); 
              }
            });
        }
    </script>
<@studio.toolSupport />