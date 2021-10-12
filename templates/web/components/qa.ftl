<#import "/templates/system/common/cstudio-support.ftl" as studio />
<style>
    .title{
        position: relative;
        margin-bottom: 0.7rem;
        padding-bottom: 0.7rem;
    }
    .title:before{
        position: absolute;
        content: "";
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: white;
        box-shadow: 0 0 5px 0px rgb(0 0 0 / 20%);
    }

    }

</style>
<section class="sp-block py-4 py-md-5">
    <div class="container">
        <div class="py-3 py-md-5" id="qas">
            <h1 class="h4 base-color fw-bold text-uppercase mb-4">Q&A</h1>
            <#list contentModel.qA_o.item as aQa> 
                <h5 class="base-color fw-bold mb-3 fields title" id="title${aQa?index}" onclick="show(${aQa?index});">${aQa.title_s}</h5>
                <div class="bg-white shadow p-3 p-md-4 mb-4" id="content${aQa?index}" style="display: none;">
                    <div class="mb-3"><img src="/static-assets/dist/images/share.jpg"></div>
                    <p id="info${aQa?index}">${aQa.content_html}</p>
                </div>
            </#list>
            
            <nav class="pagination-mf" aria-label="">
            <ul class="pagination pagi2 justify-content-center">
              <li id="previous-page2 hidden" class="page-item"><a class="page-link" href="javacript:void(0)"><span class="fas fa-angle-left"></a></li>
            </ul>
          </nav>
        </div>
    </div>
</section>
<section class="home-block">
  <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
</section>

<script>
    var numberOfFieldsNews = $("#qas .fields").length;
         limitPerPage = 4;
         $("#qas .fields:gt(" + (limitPerPage -1 )+")").hide();
         
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
                $("#qas .fields").hide();
                var total = limitPerPage * currentPage;
                for(let i = total - limitPerPage; i<total; i++){
                    $("#qas .fields:eq("+ i +")").show();
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
            $("#qas .fields").hide();
            var total = limitPerPage * currentPage; 
            for (let i = total - limitPerPage; i < total; i++) {
              $("#qas .fields:eq(" + i + ")").show(); 
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
                $("#qas .fields").hide();
                var grandTotal = limitPerPage * currentPage; 
                for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
                  $("#qas .fields:eq(" + i + ")").show();
                }
                $(".pagi2 li.current-page:eq(" + (currentPage - 1) + ")").addClass('active'); 
              }
            });
        }
        function show(index){
            var numberOfFieldsNews = $("#qas .fields").length;
            for(var i = 0; i < numberOfFieldsNews; i++){
                if(index === i){
                    $('#title' + i).removeClass('title');
                    $('#content' + i).css('display','block');
                }else{
                    $('#title' + i).addClass('title');
                    $('#content' + i).css('display','none');
                }
            }
        }

</script
<@studio.toolSupport />