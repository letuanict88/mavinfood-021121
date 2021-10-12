    <section class="py-3 py-lg-5">
      <div class="container">
        <div class="mb-3 mb-lg-5">
          <a href="#"><img src="/static-assets/dist/images/mavin-logo-sm.jpg" alt=""></a>
        </div>
        <h1 class="h3 fw-bold base-color text-uppercase">Giỏ hàng</h1>
        <div class="row">
          <div class="col-lg-9">
                    <div class="table-responsive cartTable">
                        <table class="table table-borderless align-middle" id="CartTb">

                        </table>
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
              <h5 class="text-end fw-bold base-color">Thanh toán</h5>
              <div class="d-flex justify-content-between mb-3">
                <div>Tạm tính</div>
                <div ><span id="sumOrder">0</span>đ</div>
              </div>
              <div class="d-flex justify-content-between mb-3">
                <div>Phí vận chuyển</div>
                <div><span id="discount">50000</span>đ</div>
              </div>
              <div class="line-shadow mb-3"></div>
              <div class="total-price mb-3">
                <div class="d-flex justify-content-between">
                  <div class="fw-bold">Tổng cộng</div>
                  <div class="h5 base-color mb-0"><span id="sumOrder2">0</span></div>
                </div>
                <div class="small text-end">Đã bao gồm VAT</div>
              </div>
              <a href="/thanh-toan" onclick="myOrder()" class="btn btn-danger w-100 text-uppercase">mua hàng</a>
            </div>
          </div>
        </div>
      </div>
    </section> <!-- Shopping Cart -->