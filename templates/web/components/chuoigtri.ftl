<#import "/templates/system/common/cstudio-support.ftl" as studio />
<section class="sp-block bg-cgts">
      <div class="container">
        <div class="bg-white content shadow p-3 p-md-5">
          <div class="mb-4"><img class="img-fluid" src="${contentModel.image_s}"></div>
          <h1 class="base-color h3">${contentModel.title_s}</h1>
          ${contentModel.content_html}
        </div>
        <div class="back-link my-3 my-md-5">
          <a class="d-flex align-items-center justify-content-center" href="#">
            <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg fa-flip-horizontal"></i></span>
            <span class="fw-bold text-muted ps-2 small">Quay về trang Tổng quan</span>
          </a>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/10.jpg" alt="">
    </section>
<@studio.toolSupport />