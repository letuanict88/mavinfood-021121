<#import "/templates/system/common/cstudio-support.ftl" as studio />
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Site Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Stylesheet -->
    <link rel="stylesheet" href="/static-assets/vendor/bootstrap-5-0-1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static-assets/vendor/fontawesome-free-5-15-3-web/css/all.min.css">
    <link rel="stylesheet" href="/static-assets/dist/stylesheets/main.css">
    <link rel="stylesheet" href="/static-assets/vendor/slick-1-8-1/slick/slick.css">
    <link rel="stylesheet" href="/static-assets/vendor/slick-1-8-1/slick/slick-theme.css"> 
    <link rel="apple-touch-icon" sizes="180x180" href="/static-assets/dist/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/static-assets/dist/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/static-assets/dist/favicon-16x16.png">
    <link rel="manifest" href="/static-assets/dist/site.webmanifest">
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/static-assets/js/handlebars.min-latest.js"></script>
    
    <script src="/static-assets/vendor/jquery/map/app.js"></script>
    <script src="/static-assets/vendor/jquery/map/index.js"></script>
    <link rel="stylesheet" href="/static-assets/vendor/jquery/map/style.css" />
    <script src="/static-assets/vendor/jquery/map/store-data.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYdkPWr0YS7bZxbh_h6KJJVag8RgkcrTY&callback=initMap"></script>
    <link rel="shortcut icon" href="/static-assets/vendor/jquery/map/google-maps-icon.png" type="image/x-icon"/>
    <title>Hệ thống bán hàng</title>
  </head>
  <body>
    <style>
      .mega-nav {
        position: fixed;
        top: -100%;
        z-index: 99999;
        width: 100%;
        height: 100%;
        transition: 0.3s;
      }
      .mega-nav.active {
        top: 0;
      }
      .mega-nav .mega-nav__container {
        position: absolute;
        top: 20%;
        left: 13%;
        transform: translateY(-20%);
      }
      .mega-nav .mega-nav__container .mega-nav__content#megaNavContentTop {
        border-bottom: 2.5px solid rgba(35, 31, 32, 0.26);
      }
      .mega-nav .mega-nav__container .mega-nav__content ul {
        padding: 0;
      }
      .mega-nav .mega-nav__container .mega-nav__content ul li {
        font-size: 13px;
      }

      .btn#closeMegaNavBtn {
        position: absolute;
        right: 0;
      }

      .nav-item {
        position: relative;
      }
    </style>
    <section class="bg-wave bg-crown d-none d-lg-block">
    <#list (contentModel.slide_o.item)![] as slide>
            <@renderComponent parent=contentModel component=slide />
    </#list>
    <@renderComponent component=contentModel.header_o.item />
    <section class="sp-block py-4 py-md-5">
      <div class="container">
        <div class="py-3 py-md-5">
          <h1 class="h4 base-color text-uppercase fw-bold mb-3">Hệ thống bán hàng</h1>
            <!-- <h2>Store Locator</h2> -->
          <h2 class="h5 base-color fw-bold mb-3">Hệ thống Đại lý - Nhà phân phối</h2>
          <div class="d-flex mb-4">
            <div class="me-2">
              <label for="" class="form-label fw-bold">Tỉnh / Thành phố</label>
              <input id="zip-code-input" class="form-control form-control-sm" type="text" placeholder="" aria-label="">
            </div>
            <div class="mt-auto">
              <button type="button" class="btn btn-sm base-color"><i class="fas fa-search fa-lg" onclick="searchStores()"></i></button>
            </div>
          </div>
          <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
              <div class="p-3 bg-light mb-4">
                <div class="stores-list">
                  <div class="store-container">
                  </div>
                </div>
              </div>
            </div>
            <div id="map" style="min-height: 100vh;" class="col"></div>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>
    <@renderComponent component=contentModel.footer_o.item />
      <!-- =========================
        MODAL DIALOGS
        ============================== -->
        
        <div class="modal fade" id="success-dialog" role="dialog">
            <div class="modal-dialog modal-sm modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header text-left mb-2 text-white" style="background-color: #322372">
                        <h3 id="success-dialog-header" class="modal-title" style="font-size: 20px;">Cảm ơn!</h3>
                    </div>
                    <div class="modal-body">
                        <p>
                            <span id="success-dialog-message" class="modal-main-message">Yêu cầu của bạn đã được xử lý!</span>
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="close-success" class="btn btn-sm btn-warning" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        
     <!-- =========================
        MODAL SPINNERS
        ============================== -->
        <div class="modal fade" id="modal-spinner" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered justify-content-center" role="document">
                <span class="fa fa-spinner fa-spin fa-3x"></span>
            </div>
        </div>
    <!-- Site Javascript -->
    <script src="/static-assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/static-assets/vendor/bootstrap-5-0-1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/static-assets/vendor/slick-1-8-1/slick/slick.min.js"></script>
    <script src="/static-assets/js/search_product.js"></script>
    <script type="text/javascript">
    $(window).bind('scroll', function() {
			var scrollTop = $(window).scrollTop();

			if (scrollTop > 1090) {
				$('#nav').addClass("fixed");
			} else {
				$('#nav').removeClass("fixed");
			}
		});
        $('.single-slider').slick({
        arrows: true,
        infinite: true,
        speed: 300,
        slidesToShow: 1,
        adaptiveHeight: true
      });
        $(document).ready(function() {
            $('#close-success').click(() => {
                $('#success-dialog').hide();
                $('.modal-backdrop').hide();
            });
        });
    
      $('.sp-1').slick({
        arrows: true,
        infinite: false,
        speed: 300,
        slidesToShow: 5,
        slidesToScroll: 5,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              arrows: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          }
        ]
      });
      $('.sp-2').slick({
        centerMode: true,
        centerPadding: '30px',
        slidesToShow: 5,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              arrows: true,
              centerMode: true,
              centerPadding: '20px',
              slidesToShow: 3
            }
          },
          {
            breakpoint: 480,
            settings: {
              arrows: true,
              centerMode: false,
              centerPadding: '20px',
              slidesToShow: 2
            }
          }
        ]
      });
      $('.slide-certificate').slick({
        centerMode: true,
        centerPadding: '30px',
        slidesToShow: 3,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              arrows: true,
              centerMode: true,
              centerPadding: '20px',
              slidesToShow: 3
            }
          },
          {
            breakpoint: 480,
            settings: {
              arrows: true,
              centerMode: false,
              centerPadding: '20px',
              slidesToShow: 1
            }
          }
        ]
      });
      
    $('.limit-text').each(function (f) {
      var newstr = $(this).text().substring(0,600);
      $(this).text(newstr).append("...");
    });
    $(".toggle-mega-nav-btn").click(function(){
        $(".mega-nav").toggleClass("active");
      });
    </script>
    <script src="/static-assets/js/contact.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
     <script src="/static-assets/js/search.js"></script>
  </body>
</html>
</html>
<@studio.toolSupport />