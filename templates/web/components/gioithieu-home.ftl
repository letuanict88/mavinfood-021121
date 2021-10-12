<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="home-block about-us py-4 py-md-5">
      <div class="container">
        <div class="row content">
          <div class="col-lg-4">
            <h1 class="base-color fst-italic">
              <span class="fw-light d-block" style="font-size: 2.2rem!important;">Chuỗi giá trị</span>
              <span style="font-size: 3.1rem!important;">"Sạch từ nguồn"</span>
              <span class="fw-light d-block mb-4" style="font-size: 2.2rem!important;">của Mavin</span>
            </h1>
            <p class="fst-italic text-muted text-recommend">
              ${contentModel.content_html}
              <a href="/tong-quan/chuoi-gia-tri"><span class="fw-bold text-muted pe-2" style="padding-left: 3rem; color: red;">Xem tiếp  <i class="fas fa-caret-right fa-lg" style="color: red;"></i></span></a>
            </p>
          </div>
          <div class="col-lg-8" style="padding-left:15px;">
            <div class="text-center">
              <img class="img-fluid" src="/static-assets/dist/temp/1.png" alt="">
              <p class="text-uppercase fw-bold fs-5 base-color">${contentModel.subtitle_s}</p>
            </div>
            <div class="row px-lg-4 mx-lg-4">
                 <#if (contentModel.product_o.item)??>
                        <#list contentModel.product_o.item as product>
              <div class="col-4 col-lg-4">
                <div class="text-center">
                    <img class="img-fluid" src="${product.image_s}" alt="" style="border: .5rem solid white;border-radius:7rem;">
                    <p class="text-uppercase text-muted fw-bold mt-3" id="food">${product.name_s}<br><span>${product.name2_s}</span></p>
                    
                </div>
              </div>
              </#list>
                    </#if>
            </div>
          </div>
        </div>
      </div>
    </section>
<@studio.toolSupport />