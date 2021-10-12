<section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="h4 base-color text-uppercase fw-bold mb-3">Thư viện tài liệu</h1>
          <div class="bg-white p-3 p-md-5 mb-4 shadow">
            <div class="row row-cols-2" id="libs">
            <#list docs as doc>
              <div class="col fields" >
                <div class="d-flex flex-column mb-4">
                <a src="${doc.url}">
                  <img class="img-fluid" src="${doc.image}" alt="">
                  <div class="fs-6 mt-3 mb-1 base-color">${doc.name}</div>
                </div>
                </a>
              </div>
            </#list>
            </div>
            <nav class="pagination-mf" aria-label="">
              <ul class="pagination pagi2 justify-content-center">
                <li id="previous-page2" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
    <script>
        var numberOfFieldsNews = $("#libs .fields").length;
         limitPerPage = 6;
         $("#libs .fields:gt(" + (limitPerPage -1 )+")").hide();
         
         var totalPages2 = Math.round(numberOfFieldsNews / limitPerPage );
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
                $("#libs .fields").hide();
                var total = limitPerPage * currentPage;
                for(let i = total - limitPerPage; i<total; i++){
                    $("#libs .fields:eq("+ i +")").show();
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
            $("#libs .fields").hide();
            var total = limitPerPage * currentPage; 
            for (let i = total - limitPerPage; i < total; i++) {
              $("#libs .fields:eq(" + i + ")").show(); 
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
                $("#libs .fields").hide();
                var grandTotal = limitPerPage * currentPage; 
                for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
                  $("#libs .fields:eq(" + i + ")").show();
                }
                $(".pagi2 li.current-page:eq(" + (currentPage - 1) + ")").addClass('active'); 
              }
            });
        }
    </script>