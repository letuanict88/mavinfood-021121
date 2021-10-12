<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="h4 base-color fw-bold text-uppercase mb-4">Customer Service</h1>
          <div class="row">
            <div class="d-flex flex-column justify-content-between col-lg-6 col-sm-12">
            <#if (contentModel.cskh_o.item)??>
                <#list contentModel.cskh_o.item as cskh>
                <#if cskh?is_last>
                <div class="col">
                  <a href="${cskh.link_s}" class="d-block text-start btn w-100 h-100 base-bg-color rounded-0 text-white fw-bold" style="padding-left:12.5rem">${cskh.name_s}</a>
                </div>
                <#else>
                <div class="col mb-4">
                  <a href="${cskh.link_s}" class="d-block text-start btn w-100 h-100 base-bg-color rounded-0 text-white fw-bold" style="padding-left:12.5rem">${cskh.name_s}</a>
                </div>
                </#if>
                </#list>
            </#if>
            </div>
            <div class="col-lg-6 col-sm-12" style="background-image: url(/static-assets/dist/images/cskh.png);background-repeat: cover;">
            
            </div>
         </div>    
          <div class="row mt-4">
            <div class="col base-color" style="font-weight: 600; font-size: 17.5px; text-align: justify;">
              <p>Mavin Foods is committed to bringing customers the best products and services. We always support, advise and share our information, knowledge and experience. Call us to receive timely advice and support with the best quality.</p>
            </div>
          </div>
        </div>
      </div>
      
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
<@studio.toolSupport />  