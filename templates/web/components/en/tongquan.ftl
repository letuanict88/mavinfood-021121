<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="letters bg-orange py-4 py-md-5">
      <div class="container">
        <div class="content position-relative p-3 p-md-5 my-5 bg-white shadow">
          <h1 class="base-color mb-4"><strong>${contentModel.title1_s} </strong>${contentModel.title_s}</h1>
          <div class="d-flex flex-column flex-md-row">
            <div class="flex-shrink-0 text-center text-md-start mb-3 mb-md-0">
              <img src="${contentModel.image_s}" alt="">
            </div>
            <div class="flex-grow-1" style="text-align: justify;margin-left:3rem!important;color: #6c757d!important;">
              ${contentModel.content_html}
            </div>
          </div>
          <div class="position-absolute bottom-0 end-0 d-none d-md-block">
            <img src="/static-assets/dist/images/crown.png" width="140" height="140">
          </div>
        </div>
      </div>
    </section>
    <section class="py-5">
      <div class="container">
        <div class="base-bg-color px-3 px-md-0 py-3 py-md-5 text-white">
          <div class="row justify-content-center">
            <div class="col-md-11">
              <div class="d-flex flex-column fw-bold mb-4" style="margin-left: 3rem;">
                <div class="fs-5">The supply chain</div>
                <div class="fs-1"><h1 style="font-size: 3rem;">“From Farm to Table”<span class="fs-3">of Mavin</span> </h1></div>
              </div>
              <div class="row row-cols-2 row-cols-md-auto gx-0 justify-content-center">
                <div class="col text-center">
                  <a href="/en/introduction/valuechain"> <img class="img-b10w" src="/static-assets/dist/temp/1-1.png" alt=""> </a>
                </div>
                <div class="col text-center">
                  <a href="/en/introduction/valuechain"> <img class="img-b10w" src="/static-assets/dist/temp/1-2.png" alt=""> </a>
                </div>
                <div class="col text-center">
                  <a href="/en/introduction/valuechain"> <img class="img-b10w" src="/static-assets/dist/temp/1-4.png" alt=""> </a>
                </div>
                <div class="col text-center">
                  <a href="/en/introduction/valuechain"> <img class="img-b10w" src="/static-assets/dist/temp/1-3.png" alt=""> </a>
                </div>
                <div class="col text-center">
                  <a href="/en/introduction/valuechain"> <img class="img-b10w" src="/static-assets/dist/temp/1-5.png" alt=""> </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="hof-mf py-3 pt-md-5">
          <h3 class="fw-bold text-uppercase base-color h4">History</h3>
          <div class="row mb-5">
            <div class="col-md-6">
              <img src="/static-assets/dist/temp/company.jpg" alt="" class="img-thumbnail shadow-sm mb-3 mb-md-0">
            </div>
            <div class="col-md-6" style="text-align: justify;display: flex;flex-direction: column;justify-content: space-between; font-size: 15px;">
              <p>Mavin foods joint venture Company is one of few Vietnamese corporations applying “From Farm to Table” production model, with enclosed value chain, from breeding, veterinary medicine, raising and food processing; ensuring the hygiene and safety to the hand of end customers.
              <br><br>The current Mavin plant has a capacity of 10.000 tons per year, is located at Dong Van II Industrial Zone, Duy Tien district, Ha Nam province with 10 000 m2 area. Mavin has been synchronously and modernly invested by a new production system made in Federal Republic of Germany. The modern production line of the company ensures producing high quality products and absolute safety and hygiene of food...</p>
              <div class="view-more">
                <a class="d-flex align-items-center" href="/en/introduction/history">
                  <span class="fw-bold text-muted pe-2 small">See more</span>
                  <span class="icon-vm d-flex justify-content-center align-items-center bg-white rounded-circle base-color"><i class="fas fa-caret-right fa-lg"></i></span>
                </a>
              </div>
            </div>
          </div>
          <div class="row" style="margin-top: 6.5rem!important;">
            <div class="col-md-4 h4">
              <a class="btn btn-lg w-100 text-white rounded-0 base-bg-color text-uppercase fw-bold mb-4 mb-md-0 p-3" href="/en/introduction/production">Production Technology</a>
            </div>
            <div class="col-md-4">
              <a class="btn btn-lg w-100 text-white rounded-0 base-bg-color text-uppercase fw-bold mb-4 mb-md-0 p-3" href="/en/introduction/award">Recognition & Awards</a>
            </div>
            <div class="col-md-4">
              <a class="btn btn-lg w-100 text-white rounded-0 base-bg-color text-uppercase fw-bold mb-4 mb-md-0 p-3" href="/en/introduction/production-announcement">Production Announcement</a>
            </div>
          </div>
        </div>
        <div class="py-3 pt-md-5">
          <div class="row">
            <div class="col-md-6 mb-4 mb-md-0">
              <h3 class="h4"><a class="text-uppercase fw-bold base-color" href="/en/introduction/missionvision">Vission</a></h3>
              <a href="/en/introduction/missionvision"><img src="/static-assets/dist/temp/tam-nhin.jpg" alt="" class="img-thumbnail shadow-sm"></a>
            </div>
            <div class="col-md-6 mb-4 mb-md-0">
              <h3 class="h4"><a class="text-uppercase fw-bold base-color" href="/en/introduction/missionvision">Mission</a></h3>
              <a href="//en/introduction/missionvision"><img src="/static-assets/dist/temp/su-menh.jpg" alt="" class="img-thumbnail shadow-sm"></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/9.jpg" alt="">
    </section>
<@studio.toolSupport />