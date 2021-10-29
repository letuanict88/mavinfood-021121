 <section class="py-3 py-lg-5">
      <div class="container">
        <div class="mb-3 mb-lg-5">
          <a href="#"><img src="/static-assets/dist/images/mavin-logo-sm.jpg" alt=""></a>
        </div>
        <h1 class="h3 fw-bold base-color text-uppercase">thông tin đặt hàng</h1>
        <div class="row">
          <div class="col-lg-9">
            <div class="shadow p-3 p-lg-5 mb-4 mb-lg-0">
              <form method="POST" id="payment-form" onsubmit="return mySendEmail()">
                <div class="row mb-3">
                  <!--<label for="" class="col-sm-2 col-form-label">Họ tên</label>-->
                  <div class="col-sm-12">
                    <input type="text" class="form-control" id="name" placeholder="Họ tên" required>
                  </div>
                </div>
                <div class="row mb-3">

                  <div class="col-sm-12">
                    <input type="tel" class="form-control" id="phone" placeholder="Số điện thoại" required>
                  </div>
                </div>
                <div class="row mb-3">

                  <div class="col-sm-12">
                    <input type="address" class="form-control" id="address" placeholder="Địa chỉ giao hàng" required>
                  </div>
                </div>
                <div class="row mb-3">
                  
                  <div class="col-sm-12">
                    <input type="email" class="form-control" id="email" placeholder="Email" required>
                  </div>
                </div>  
                <div class="row mb-3">

                  <div class="col-sm-12">
                    <textarea class="form-control" id="note" placeholder="Lưu ý - Thông tin khác (nếu có)"></textarea>
                  </div>
                </div>
              </form>
            </div>
                <div class="back-link my-3 my-md-5">
                    <a class="d-flex align-items-center justify-content-center" href="/san-pham">
                    <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg fa-flip-horizontal"></i></span>
                    <span class="fw-bold text-muted ps-2 small">Tiếp tục mua hàng</span>
                    </a>
                </div>
          </div>
          <div class="col-lg-3">
            <div class="shadow p-3">
              <h5 class="text-end fw-bold base-color">Mua hàng</h5>
              <div class="d-flex justify-content-between mb-3">
                <div>Tạm tính</div>
                <div ><span id="totalOrder">0</span>đ</div>
              </div>
              <div class="d-flex justify-content-between mb-3">
                <div>Phí vận chuyển</div>
                <div><span id="discount">${contentModel.shippingFee_s}</span>đ</div>
              </div>
              <div class="line-shadow mb-3"></div>
              <div class="total-price mb-3">
                <div class="d-flex justify-content-between">
                  <div class="fw-bold">Tổng cộng</div>
                  <div class="h5 base-color mb-0"><span id="totalOrder2">0</span>đ</div>
                </div>
                <div class="small text-end">Đã bao gồm VAT</div>
              </div>
              <button type="submit" form="payment-form" class="btn btn-danger w-100 text-uppercase">mua hàng</button>
            </div>
          </div>
      </div>
    </section> <!-- Shopping Cart -->