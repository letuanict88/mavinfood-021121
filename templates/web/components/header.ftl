<#import "/templates/system/common/cstudio-support.ftl" as studio />
            <a href="/gio-hang"><button id="cartBtn" class="btn btn-danger rounded-circle">
              <i class="fas fa-shopping-cart"></i>
              <span id="cartNumber" class="btn btn-danger rounded-circle">0</span>
            </button></a>
        <div class="utilities">
            <a class="u-logo d-block" href="#"><img src="${contentModel.image_s}" alt="Logo" height="100"></a></a>
            <div class="d-flex justify-content-between align-items-center" style="padding-top: 1.5rem; padding-bottom: .5rem;">
              <a class="text-white" href="/"><i class="fas fa-home"></i></a>
              <a href="/en/home/"><img src="/static-assets/dist/images/United-Kingdom.png" alt=""></a>
              <a class="text-white" href="/"><i class="fas fa-search"></i></a>
            </div>
            <button class="toggle-mega-nav-btn btn d-block border-0 p-0 text-white w-100">
                <img src="/static-assets/dist/images/bars.png" alt="Icon">
            </button>
        </div> <!-- /Utilities -->
        </section>
    
        <section class="mega-nav bg-wave app10 d-lg-block">
      <button id="closeMegaNavBtn" class="toggle-mega-nav-btn btn border-0 text-white"><i class="fas fa-times"></i></button>

      <div class="utilities">
        <a class="u-logo d-block" href="/"><img src="/static-assets/dist/images/mavin-logo-sm.jpg" alt=""></a>
        <div class="d-flex justify-content-evenly py-2">
          <a class="text-white" href="/"><i class="fas fa-home"></i></a>
          <a href="#"><img src="/static-assets/dist/images/United-Kingdom.png" alt=""></a>
        </div>
      </div>

      <div class="mega-nav__container container">
        <!-- nav 1 -->
        <div id="megaNavContentTop" class="mega-nav__content row">
          <ul class="list-unstyled col-custom">
            <a href="/tong-quan"><p class="fw-bold text-white mb-2" >Tổng quan</p></a>
            <li class="mb-2"><a class="text-white" href="/tong-quan">Thư ngỏ từ Chủ tịch Tập đoàn</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/chuoi-gia-tri">Chuỗi giá trị Sạch từ nguồn của Mavin</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/lich-su">Lịch sử hình thành</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/quy-trinh-ss">Quy trình Sản xuất</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/chung-nhan-giai-thuong">Chứng chỉ - Giải thưởng</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/cong-bo-san-pham">Công bố Sản phẩm</a></li>
            <li class="mb-2"><a class="text-white" href="/tong-quan/tam-nhin-su-menh">Tầm nhìn - Sứ mệnh</a></li>
          </ul>

          <ul class="list-unstyled d-flex flex-column justify-content-end col-custom">
            <a href="/ban-tin"><p class="fw-bold text-white mb-2">Tin tức - Sự kiện</p></a>
            <li class="mb-2"><a class="text-white" href="/ban-tin">Tin Mavin</a></li>
          </ul>

          <ul class="list-unstyled d-flex flex-column justify-content-end col-custom">
            <a href="/tuyen-dung"><p class="fw-bold text-white mb-2">Tuyển dụng</p></a>
            <li class="mb-2"><a class="text-white" href="/tuyen-dung">Tin tuyển dụng</a></li>
            <li class="mb-2"><a class="text-white" href="#">Chính sách Nhân sự</a></li>          
          </ul>

          <ul class="list-unstyled d-flex flex-column justify-content-end col-custom">
            
            <li class="fw-bold mb-2"><a class="text-white" href="/lien-he">Liên hệ</a></li>
            <li class="fw-bold mb-2"><a class="text-white" href="/bep-mavin">Bếp Mavin</a></li>
            <li class="fw-bold mb-2"><a class="text-white" href="/san-pham">Truy xuất nguồn gốc sản phẩm</a></li>
          </ul>
        </div>
        <!-- /nav 1 -->

        <!-- nav 2 -->
        <div id="megaNavContentBottom" class="mega-nav__content row pt-3">
          <ul class="list-unstyled col-custom">
            <a href="/san-pham"><p class="fw-bold text-white mb-2">Sản phẩm</p></a>
            <li class="mb-2"><a class="text-white" href="/san-pham/xuc-xich">Xúc xích</a></li>
            <li class="mb-2"><a class="text-white" href="/san-pham/do-vien">Đồ viên</a></li>
            <li class="mb-2"><a class="text-white" href="/san-pham/gio-cha">Giò chả</a></li>
            <li class="mb-2"><a class="text-white" href="/san-pham/cat-lat">Cắt lát</a></li>
            <li class="mb-2"><a class="text-white" href="/san-pham/sp-khac">Sản phẩm khác</a></li>
            <li class="mb-2"><a class="text-white" href="/san-pham">Sản phẩm tiêu biểu</a></li>
          </ul>

          <ul class="list-unstyled d-flex flex-column col-custom">
            <a href="/cham-soc-khach-hang"><p class="fw-bold text-white mb-2">Chăm sóc khách hàng</p></a>
            <li class="mb-2"><a class="text-white" href="/he-thong-ban-hang">Thông tin Điểm bán</a></li>
            <li class="mb-2"><a class="text-white" href="/cham-soc-khach-hang/khuyen-mai">Thông tin Khuyến mại</a></li>
            <li class="mb-2"><a class="text-white" href="/cham-soc-khach-hang/qa">Q & A</a></li>
          </ul>
          
          <ul class="list-unstyled d-flex flex-column col-custom">
            <a href="/thu-vien"><p class="fw-bold text-white mb-2">Thư viện Tư liệu</p></a>
            <li class="mb-2"><a class="text-white" href="/thu-vien/hinh-anh">Thư viện Hình ảnh</a></li>
            <li class="mb-2"><a class="text-white" href="/thu-vien/video">Thư viện Video</a></li>
            <li class="mb-2"><a class="text-white" href="/thu-vien/tai-lieu">Thư viện Tài liệu</a></li>
          </ul>

          <ul class="list-unstyled d-flex flex-column col-custom">
            <a href="/chinhsach/chinh-sach-website"><p class="fw-bold text-white mb-2">Chính sách Website</p></a>
            <li class="mb-2"><a class="text-white" href="/chinhsach/chinh-sach-website">Quy ước sử dụng Website</a></li>
            <li class="mb-2"><a class="text-white" href="/chinhsach/chinh-sach-bao-mat">Chính sách bảo mật thông tin</a></li>
            <li class="mb-2"><a class="text-white" href="/chinhsach/dieu-kien-giao-dich">Điều kiện giao dịch chung</a></li>
            <li class="mb-2"><a class="text-white" href="/chinhsach/van-chuyen-va-giao-nhan">Vận chuyển và giao nhận</a></li>
            <li class="mb-2"><a class="text-white" href="/chinhsach/phuong-thuc-thanh-toan">Phương thức thanh toán</a></li>
          </ul>
        </div>
        <!-- /nav 2 -->
      </div>
    </section> 
      
    <!-- /Background Wave -->
    <nav id="nav" class="navbar navbar-mf navbar-expand-lg navbar-light bg-white">
      <div class="container">
        <a class="navbar-brand d-lg-none" href="#">
          <img src="dist/images/mavin-logo-sm.jpg" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-mf" aria-controls="navbar-mf" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbar-mf">
          <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item menu-item">
              <a class="nav-link active" aria-current="page" href="/">Trang chủ</a>
            </li>
            <li class="nav-item btn-group menu-item">
              <a id="dropdownExample" class="nav-link active" href="/tong-quan">Tổng quan</a>
              <button type="button" class="border-0 bg-transparent dropdown-toggle dropdown-toggle-split" style=" color: #505050; " id="tongquan" data-bs-toggle="dropdown" aria-expanded="false" data-bs-reference="parent">
                <span class="visually-hidden" >Toggle Dropdown</span>
              </button>            
              <ul class="dropdown-menu" aria-labelledby="tongquan">
                <li><a class="dropdown-item" href="/tong-quan/chuoi-gia-tri">Chuỗi giá trị Sạch từ Nông trại tới Bàn ăn</a></li>
                <li><a class="dropdown-item" href="/tong-quan/lich-su">Lịch sử hình thành</a></li>
                <li><a class="dropdown-item" href="/tong-quan/quy-trinh-ss">Quy trình sản xuất</a></li>
                <li><a class="dropdown-item" href="/tong-quan/chung-nhan-giai-thuong">Chứng chỉ - Giải thưởng</a></li>
                <li><a class="dropdown-item" href="/tong-quan/cong-bo-san-pham">Công bố sản phẩm</a></li>
                <li><a class="dropdown-item" href="/tong-quan/tam-nhin-su-menh">Tầm nhìn - Sứ mệnh</a></li>
              </ul>
            </li>
            <li class="nav-item menu-item btn-group">
              <a id="dropdownExample" class="nav-link active" href="/san-pham">Sản phẩm</a>
              <button type="button" class="border-0 bg-transparent dropdown-toggle dropdown-toggle-split" style=" color: #505050; " id="sanpham" data-bs-toggle="dropdown" aria-expanded="false" data-bs-reference="parent">
                <span class="visually-hidden">Toggle Dropdown</span>
              </button>   
              <ul class="dropdown-menu" aria-labelledby="sanpham">
                <li><a class="dropdown-item" href="/san-pham/xuc-xich">Xúc xích</a></li>
                <li><a class="dropdown-item" href="/san-pham/do-vien">Đồ viên</a></li>
                <li><a class="dropdown-item" href="/san-pham/gio-cha">Giò chả</a></li>
                <li><a class="dropdown-item" href="/san-pham/cat-lat">Cắt lát</a></li>
                <li><a class="dropdown-item" href="/san-pham/sp-khac">Sản phẩm khác</a></li>
              </ul>
            </li>
            <li class="nav-item menu-item">
              <a class="nav-link" href="/ban-tin">Tin tức</a>
            </li>
            <li class="nav-item menu-item btn-group">
             <a id="dropdownExample" class="nav-link active" href="/cham-soc-khach-hang">Chăm sóc khách hàng</a>
              <button type="button" class="border-0 bg-transparent dropdown-toggle dropdown-toggle-split" style=" color: #505050; " id="cskh" data-bs-toggle="dropdown" aria-expanded="false" data-bs-reference="parent">
                <span class="visually-hidden">Toggle Dropdown</span>
              </button>   
              <ul class="dropdown-menu" aria-labelledby="cskh">
                <li><a class="dropdown-item" href="/he-thong-ban-hang">Thông tin điểm bán</a></li>
                <li><a class="dropdown-item" href="/cham-soc-khach-hang/khuyen-mai">Thông tin khuyến mại</a></li>
                <li><a class="dropdown-item" href="/cham-soc-khach-hang/qa">Q&A</a></li>
              </ul>
            </li>
            <li class="nav-item menu-item">
              <a class="nav-link" href="/tuyen-dung">Tuyển dụng</a>
            </li>
            <li class="nav-item menu-item">
              <a class="nav-link" href="/lien-he">Liên hệ</a>
            </li>
          </ul>
        </div>
      </div>
    </nav> <!-- /Navbar -->
<@studio.toolSupport />