<#import "/templates/system/common/cstudio-support.ftl" as studio />
<footer class="footer bg-crown py-4 py-md-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <ul class="list-unstyled" style="font-size: .75em">
              <li class="text-uppercase fw-bold">${contentModel.name_s} </br> (MAVIN FOODS)</li>
              <li>${contentModel.address_s}</li>
              <li>Nhà máy: ${contentModel.factorysAdd_s}</li>
              <li>ĐT: ${contentModel.phone_s}  - Fax: ${contentModel.fax_s}</li>
              <li>Email: ${contentModel.email_s}  -  Website: ${contentModel.web_s}</li>
              <li>Chứng nhận Đăng ký Kinh doanh số: ${contentModel.cerId_s}</li>
              <li>Ngày cấp: ${contentModel.cerDate_s} - Nơi cấp: ${contentModel.cerPlace_s}</li>
            </ul>
          </div>
          <div class="col-lg-8">
            <div class="row">
              <div class="col-sm-4 col-lg-3">
                <div class="fw-bold mb-3">Kết nối với Mavin Foods</div>
                <div class="d-flex mb-3">
                <#list contentModel.socialMedia_o.item as social>
                  <a class="px-1" href="${social.link_s}"><img src="${social.logo_s}" alt=""></a>
                </#list>
                </div>
                <div class="fw-bold" style="padding-top: 5px;">
                  <p class="fs-7" style="font-size: 15px; margin-bottom: 2px !important">Chăm sóc Khách hàng</p>
                  <p class="fs-4">${contentModel.carephone_s}</p>
                </div>
              </div>
              <div class="col-sm-4 col-lg-5">
                <div class="fw-bold mb-2">${contentModel.desPoli_s}</div>
                <ul class="list-unstyled">
                  <#list contentModel.policies_o.item as policy>
                  <li><a class="text-white" href="${policy.link_s}" style="font-size: .85em;">${policy.content_s}</a></li>
                  </#list>
                </ul>
              </div>
              <div class="col-sm-4 col-lg-4">
                <div class="mb-3"><a href="https://www.facebook.com/mavinfood"><img class="img-fluid" src="/static-assets/dist/images/like-page.jpg"></a></div>
                <div class="d-flex justify-content-between">
                  <div class="flex-shrink-0">
                    <img class="img-fluid" src="#" width="110" alt="">
                  </div>
                  <div class="text-right" style="text-align: end; font-size: 0.85em;">
                    Bản quyền thuộc về <br>Mavin Foods 2021
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
<@studio.toolSupport />