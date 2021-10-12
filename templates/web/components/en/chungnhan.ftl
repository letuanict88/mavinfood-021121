<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="sp-block py-3 py-md-5">
      <h1 class="base-color text-uppercase fw-bold h3 text-center px-3 mb-4">Recognition & Awards</h1>
      <div class="bg-orange py-3 py-md-5 mb-4">
        <div class="container">
          <div class="slide-certificate slide-centerMode arrows-style">
          <#list contentModel.certi_o.item as certi>
            <div class="slide-item">
              <a class="d-block shadow" href="#">
                <img class="img-fluid mx-auto mb-3" src="${certi.image_s}" alt="">
              </a>
            </div>
          </#list>
          </div>
        </div>
      </div>
      <div class="container">
        <h3 id="image_title" class="base-color text-uppercase fw-bold h5"></h3>
        <p id="image_content"></p>
        <div class="back-link my-3 my-md-5">
          <a class="d-flex align-items-center justify-content-center" href="/en/introduction">
            <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg fa-flip-horizontal"></i></span>
            <span class=" text-muted ps-2 small">Back to <strong>Introduction</strong></span>
          </a>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/12.jpg" alt="">
    </section>
    
    <script type="text/javascript">
        $(document).ready(function() {
                var image_title = {};
                <#list contentModel.certi_o.item as certi>
                image_title['${certi.image_s}'] = '${certi.title_s}';
                </#list>
        
                var image_content = {};
                <#list contentModel.certi_o.item as certi>
                image_content['${certi.image_s}'] = '${certi.content_s}';
                </#list>
        
        
                var name = $('.slick-current').find('img').attr('src');
                document.getElementById("image_title").innerHTML = image_title[name];
                document.getElementById("image_content").innerHTML = image_content[name];
               
        
                $('.slick-prev').on('click',function(e) {
                  var name = $('.slick-current').find('img').attr('src');
                  $('#image_title').html('');
                  $('#image_content').html('');
                  document.getElementById("image_title").innerHTML = image_title[name];
                  document.getElementById("image_content").innerHTML = image_content[name];
                });
        
                $('.slick-next').click(function(e) {
                  var name = $('.slick-current').find('img').attr('src');
                  $('#image_title').html('');
                  $('#image_content').html('');
                  document.getElementById("image_title").innerHTML = image_title[name];
                  document.getElementById("image_content").innerHTML = image_content[name];
                });
              });
    </script>
<@studio.toolSupport />