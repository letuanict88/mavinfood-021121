<#import "/templates/system/common/cstudio-support.ftl" as studio />
<!-- Handlebar Templates -->
<#import "/templates/system/common/cstudio-support.ftl" as studio />
<!-- Handlebar Templates -->
	<script id="search-results-template" type="text/x-handlebars-template">
		<div class="p-3 bg-light mb-4">
		{{#each results}}
                <div class="mb-4">
                  <a href="{{map}}"><div class="mb-1 base-color">
                    {{name}}</strong>
                    <i class="fas fa-map-marker-alt base-color"></i>
                  </div></a>
                  <div class="mb-1">{{address}}</div>
                  <div>ĐT: {{phone}}</div>
                </div>
		{{else}}
		    <p>Không tìm được kết quả thoả mãn</p>
		{{/each}}
		</div>
</script>
    <section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="h4 base-color text-uppercase fw-bold mb-3">Hệ thống bán hàng</h1>
          <div class="row row-cols-1 row-cols-md-2">
            <div class="col mb-4">
              <div class="bg-white p-4 shadow">
                <h2 class="h5 base-color fw-bold mb-3">Hệ thống Đại lý - Nhà phân phối</h2>
                <div class="d-flex  mb-4">
                  <div class="me-4">
                    <label for="" class="form-label fw-bold" style="margin-top:10px;">Tìm kiếm theo Tỉnh - Thành phố</label>
                  </div>
                  <!--<div class="me-2 flex-fill">
                    <label for="" class="form-label fw-bold">Quận / Huyện</label>
                    <input class="form-control form-control-sm" id="txtDistrict" type="text" placeholder="" aria-label="">
                  </div> -->
                  <div style="margin-top:5px;">
                    <a href="/he-thong-ban-hang/npp"><button type="button"  class="btn btn-sm base-color"><i class="fas fa-search fa-lg"></i></button></a>
                  </div>
                </div>
                <p class="agency-pra" style="font-weight: bold;color: #90969b!important;">Hiện tại hệ thống Đại lý - NPP các sản phẩm của Công ty TNHH Liên doanh Thực phẩm Mavin đã có mặt tại các tỉnh thành miền Bắc, miền Trung (từ Nghệ An trở ra) bao gồm: Hà Giang, Cao Bằng, Lào Cai, Bắc Kạn, Lạng Sơn, Tuyên Quang, Yên Bái, Thái Nguyên, Phú Thọ, Bắc Giang, Lai Châu, Điện Biên, Sơn La, Hòa Bình, Hà Nội, Hải Phòng, Hải Dương, Bắc Ninh, Vĩnh Phúc, Hưng Yên, Thái Bình, Nam Định, Hà Nam, Ninh Bình, Quảng Ninh, Thanh Hóa, Nghệ An.</p>
                <p class="text-center agency-content">
                  <img class="img-fluid" src="/static-assets/dist/images/vietnam-map.png" alt="">
                </p>
                <div class="search-result_item row">
                </div>
                <div style="margin-top: 20px;" id="pager">
                  <ul class="float-right" id="pagination" class="pagination-sm"></ul>
                </div>
              </div>
            </div>
            <div class="col mb-4">
              <div class="bg-white p-3 shadow" style="height: 100%;">
                <h2 class="h5 base-color fw-bold mb-3">Hệ thống Siêu thị</h2>
                <div class="d-flex  mb-4">
                  <div class="me-4">
                    <label for="" class="form-label fw-bold" style="margin-top:10px;">Tìm kiếm theo Tỉnh - Thành phố</label>
                  </div>
                  <!--<div class="me-2 flex-fill">
                    <label for="" class="form-label fw-bold">Quận / Huyện</label>
                    <input class="form-control form-control-sm" id="txtDistrict" type="text" placeholder="" aria-label="">
                  </div> -->
                  <div style="margin-top:5px;">
                    <a href="/he-thong-ban-hang/sieu-thi"><button type="button"  class="btn btn-sm base-color"><i class="fas fa-search fa-lg"></i></button></a>
                  </div>
                </div>
                <p style="font-weight: bold;color: #90969b!important;">Hiện tại hệ thống Đại lý - NPP các sản phẩm của Công ty TNHH Liên doanh Thực phẩm Mavin đã có mặt tại các tỉnh thành miền Bắc, miền Trung (từ Nghệ An trở ra) bao gồm: Hà Giang, Cao Bằng, Lào Cai, Bắc Kạn, Lạng Sơn, Tuyên Quang, Yên Bái, Thái Nguyên, Phú Thọ, Bắc Giang, Lai Châu, Điện Biên, Sơn La, Hòa Bình, Hà Nội, Hải Phòng, Hải Dương, Bắc Ninh, Vĩnh Phúc, Hưng Yên, Thái Bình, Nam Định, Hà Nam, Ninh Bình, Quảng Ninh, Thanh Hóa, Nghệ An.</p>
                <p class="text-center agency-content">
                  <img class="img-fluid" src="/static-assets/dist/images/logokhachhang.png" alt="">
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
<@studio.toolSupport />  
<@studio.toolSupport />  