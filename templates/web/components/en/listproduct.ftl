<#import "/templates/system/common/cstudio-support.ftl" as studio />
        <div class="row row-cols-2 row-cols-lg-5 justify-content-center" id="products" >
        <#if (products)??>
        <#list products as product>
          <div class="col mb-4 fields">
            <div class="bg-white shadow p-3 p-md-4" style="height: 358px;display: flex;align-items: center;">
              <div class="position-relative">
                <div class="d-flex align-items-center justify-content-center">
                  <a href="${product.url}"><img class="img-fluid" src="${product.image1}" alt=""></a>
                </div>
                <div class="position-absolute top-50 start-100 translate-middle">
                  <a href="${product.url}"><i class="fas fa-search-plus fa-lg text-muted"></i></a>
                </div>
              </div>
            </div>
            <div class="base-bg-color shadow p-2 text-center">
              <a class="d-block text-white fw-bold" href="${product.url}">${product.name}</a>
              <div class="text-white">${product.kl}</div>
              <div class="text-orange"><span class="currency">${product.price}</span>VND</div></a>
            </div>
          </div>
        </#list>
        </#if>
        </div>
        <nav class="pagination-mf" aria-label="">
          <ul class="pagination pagi2 justify-content-center">
            <li id="previous-page2" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
          </ul>
        </nav>
<script>
        var numberOfFieldsNews = $("#products .fields").length;
        console.log("size: " + numberOfFieldsNews);
         limitPerPage = 5;
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