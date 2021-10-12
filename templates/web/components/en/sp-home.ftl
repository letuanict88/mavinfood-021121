<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="home-block py-4 py-md-5">
      <div class="container">
        <div class="slider-product mb-4 text-center">
          <h3 class="base-color fw-bold text-uppercase mb-3">Products</h3>
          <div class="sp-1 arrows-style">
                <#if (contentModel.products_o.item)??>
                    <#list contentModel.products_o.item as products>
                        <a class="d-block text-white" href="${products.link_s}">
                        <img class="img-fluid mx-auto" src="${products.image_s}" alt="">
                        <span class="d-block fs-6 mt-3">${products.name_s}</span> </a>
                    </#list>
                </#if>
            </a>
          </div>
        </div>
        <div class="slider-product mb-md-4 mt-5 pt-5 text-center">
          <h3 class="base-color fw-bold mb-3">Feature Products</h3>
          <div class="sp-2 slide-centerMode arrows-style">
            <#if (contentModel.featPro_o.item)??>
                <#list contentModel.featPro_o.item as feat>
                    <div class="slide-item">
                      <a class="d-block text-muted" href="${feat.link_s}">
                        <img class="img-fluid mx-auto mb-3" src="${feat.image_s}" alt="">
                        <span class="d-block" style="font-size: 22px !important">See more</span>
                      </a>
                    </div>
                </#list>
            </#if>
          </div>
        </div>
      </div>
    </section>
<@studio.toolSupport />