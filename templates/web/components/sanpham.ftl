<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="home-block py-4 py-md-5">
      <div class="container">
        <div class="slider-product mb-4 text-center">
          <h2 class="base-color fw-bold text-uppercase mb-3">sản phẩm</h2>
          <div class="sp-1 arrows-style">
            <#list contentModel.groupProduct_o.item as group>
            <a class="d-block text-white" href="${group.url_s}">
              <img class="img-fluid mx-auto" src="${group.image_s}" alt="">
              <span class="d-block fs-6 mt-3">${group.name_s}</span>
            </a>
            </#list>
          </div>
        </div>
        <div class="slider-product mb-md-4 mt-5 pt-5 text-center">
          <h2 class="base-color fw-bold text-uppercase mb-3">sản phẩm tiêu biểu</h2>
          <div class="sp-2 slide-centerMode arrows-style">
            <#list products as product>
            <div class="slide-item">
              <a class="d-block text-muted" href="${product.url}">
                <img class="img-fluid mx-auto mb-3" src="${product.image1}" alt="">
                <span class="d-block" style="font-size: 22px !important">Xem chi tiết</span>
              </a>
            </div>
            
            </#list>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block py-4 py-md-5">
      <div class="container">
        <div class="d-flex flex-column flex-md-row align-items-center">
          <div class="flex-shrink-0 me-3 mb-3 mb-md-0"><img class="img-fluid" src="${contentModel.image_s}" alt=""></div>
          <div class="flex-grow-1" style="text-align: justify;padding: 1.8rem!important;margin-right: 3.5rem;font-weight: 530;">
            ${contentModel.content_html}
          </div>
        </div>
        <div class="d-flex flex-column flex-md-row align-items-center justify-content-evenly p-4 base-bg-color text-white">
          <div class="fw-bold text-uppercase fs-5 text-center text-md-start mb-3 mb-md-0">
            TRUY XUẤT <br>NGUỒN GỐC <br>SẢN PHẨM
          </div>
          <div class="mb-3 mb-md-0">
            <img src="/static-assets/dist/images/logo-circle2.png" alt="" width="155" height="155">
          </div>
          <div class="fs-7">
            <p>Cách 1: <strong>Dùng điện thoại quét mã QR in trên bao bì</strong></p>
            <p>Cách 2: <strong>Nhập mã số mã vạch in trên bao bì vào ô bên dưới để tra cứu thông tin</strong></p>
            <form action="/api/1/services/searchProductSku.json" method="GET">
            <div class="row g-3 align-items-center">
              <div class="col-auto">
                <input type="text" id="skuVal" class="form-control form-control-sm" aria-describedby="" placeholder="Nhập mã số mã vạch...">
              </div>
              <div class="col-auto">
                <button onclick="searchSku()" class="btn btn-sm btn-light rounded-circle base-color" type="submit" style="width: 31px; height: 31px;"><i class="fas fa-caret-right fa-lg"></i></button>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
<@studio.toolSupport />