<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="sp-block py-3 py-md-5">
      <h1 class="base-color text-uppercase fw-bold h3 text-center px-3 mb-4">${contentModel.title_s}</h1>
      <div class="bg-orange py-3 py-md-5 mb-4">
        <div class="container">
          <div class="row" id="products">
            <#list contentModel.cer_o.item as cer>
            <div class="col-md-6 col-lg-4 mb-5 fields">
              <div class="d-flex flex-wrap flex-column text-center">
                <a class="mb-3" href="#"><img class="img-fluid shadow" src="${cer.image_s}" alt=""></a>
                <a class="fs-5 base-color fw-bold">${cer.title_s}</a>
              </div>
            </div>
            </#list>
          <nav class="pagination-white-mf" aria-label="">
            <ul class="pagination pagi2 justify-content-center">
                <li id="previous-page2" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
            </ul>
          </nav>
        </div>
      </div>
      </div>
      <div class="container">
        <div class="back-link my-3 my-md-5">
          <a class="d-flex align-items-center justify-content-center" href="/en/introduction">
            <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg fa-flip-horizontal"></i></span>
            <span class=" text-muted ps-2 small">Back to <strong>Introduction</strong></span>
          </a>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/13.jpg" alt="">
    </section>
    <script>
        var numberOfFieldsNews = $("#products .fields").length;
        console.log("size: " + numberOfFieldsNews);
         limitPerPage = 6;
         $("#products .fields:gt(" + (limitPerPage -1 )+")").hide();
         
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
                $("#products .fields").hide();
                var total = limitPerPage * currentPage;
                for(let i = total - limitPerPage; i<total; i++){
                    $("#products .fields:eq("+ i +")").show();
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
            $("#products .fields").hide();
            var total = limitPerPage * currentPage; 
            for (let i = total - limitPerPage; i < total; i++) {
              $("#products .fields:eq(" + i + ")").show(); 
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
                $("#products .fields").hide();
                var grandTotal = limitPerPage * currentPage; 
                for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
                  $("#products .fields:eq(" + i + ")").show();
                }
                $(".pagi2 li.current-page:eq(" + (currentPage - 1) + ")").addClass('active'); 
              }
            });
        }
    </script>        
<@studio.toolSupport />