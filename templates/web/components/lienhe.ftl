  <section class="sp-block py-4 py-md-5">
   <form action="/api/1/services/contactUs.json" method="GET">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="h4 base-color text-uppercase fw-bold mb-3">Liên hệ</h1>
          <p style="margin-top: 3rem !important;"><span class="h5 base-color fw-bold">${contentModel.name_s}</span><br><span style="color: #505050;font-size: 19px;"><br>
          ${contentModel.bank_s}<br>${contentModel.tax_s}</span><span></p>
          <div class="row row-cols-1 row-cols-md-2">
            <#list contentModel.place_o.item as place>
            <div class="col mb-4">
              <div class="bg-white p-3 shadow mb-4">
                <img class="img-fluid" src="${place.image_s}" alt="">
              </div>
              <h2 class="h5 base-color mb-3">${place.title_s}</h2>
              <span style="color: #505050;">${place.content_html}</span>
              <div class="bg-white p-3 shadow mb-4">
                <p class="img-fluid"> ${place.map_s}</p>
              </div>
            </div>
            </#list>
          </div>
          <h3 class="h5 base-color fw-bold mb-3" style="margin-top: 3rem;">Ý kiến đóng góp của bạn</h3>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for="" class="col-form-label" style="color: #505050;"><strong>Họ tên</strong></label>
            </div>
            <div class="col-sm-10">
              <input type="text" name="name" placeholder="" class="form-control" aria-describedby="">
            </div>
          </div>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for="" class="col-form-label" style="color: #505050;"><strong>Công ty</strong></label>
            </div>
            <div class="col-sm-10">
              <input type="text" placeholder="" name="company" class="form-control" aria-describedby="">
            </div>
          </div>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for=""class="col-form-label" style="color: #505050;"><strong>Email</strong></label>
            </div>
            <div class="col-sm-10">
              <input type="mail" placeholder="" name="email" class="form-control" aria-describedby="">
            </div>
          </div>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for="" class="col-form-label" style="color: #505050;"><strong>Điện thoại</strong></label>
            </div>
            <div class="col-sm-10">
              <input type="tel" placeholder="" name="phone" class="form-control" aria-describedby="">
            </div>
          </div>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for="" class="col-form-label" style="color: #6e6e6e;"><strong>Tiêu đề</strong></label>
            </div>
            <div class="col-sm-10">
              <input type="text" placeholder="" name = "title" class="form-control" aria-describedby="">
            </div>
          </div>
          <div class="row mb-3 align-items-center">
            <div class="col-sm-2 col-form-label">
              <label for="" class="col-form-label" style="color: #6e6e6e;"><strong>Nội dung</strong></label>
            </div>
            <div class="col-sm-10">
              <textarea class="form-control" name ="content"></textarea>
            </div>
          </div>
          <div class="row mb-3 align-items-center" style="margin-top: 3.5rem !important;">
            <div class="col-auto ms-auto">
              <button type="reset" class="btn bg-orange base-color fw-bold btn-circle btn-sm">Huỷ</button>
              <button type="submit" onclick="openSpinner()"  class="btn base-bg-color text-white fw-bold btn-circle btn-sm">Gửi</button>
            </div>
          </div>
        </div>
      </div>
      </form>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>