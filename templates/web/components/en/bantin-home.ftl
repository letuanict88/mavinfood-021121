    <section class="home-block py-4 py-md-5">
      <div class="container">
        <div class="row row-cols-1 row-cols-lg-2">
          <div class="col">
            <div class="bg-white p-3 p-md-5 mb-4 shadow">
              <h3 class="text-uppercase fw-bold fs-5 base-color">News - Event</h3>
              <#list news as news>
                <#if news?is_first>
                  <a href="${news.url}"><img  width="450" height="294" src="${news.image}" alt=""></a>
                  <div class="row g-0 mt-2 mb-3" style="height: 55px;">
                    <div class="col" style="display: grid;">
                      <a class="d-block px-3 py-2 base-bg-color fw-bold text-white" style="text-transform: uppercase;" href="${news.url}">${news.title}</a>
                    </div>
                    <div class="col-auto">
                      <a class="d-flex align-items-center h-100 px-1 py-2 bg-orange base-color" href="${news.url}">
                        <span style="font-weight: bold;font-size: small;">See more</span>
                      </a>
                    </div>
                  </div>
                </#if>
              </#list>
              <ul class="list-unstyled list-mf mb-0">
              <#list news as news>
                <#if news?is_first?c == "false">
                <li>
                  <a class="text-muted" href="${news.url}">
                    ${news.title}
                  </a>
                </li>
                </#if>
                </#list>
              </ul>
            </div>
          </div>
          <div class="col">
            <div class="bg-white p-3 p-md-5 mb-4 shadow">
              <h3 class="text-uppercase fw-bold fs-5 base-color">Library</h3>
              <div class="d-flex flex-column-reverse">
              <a href="/thu-vien" style="height: 55px;">
                <ul class="nav nav-pills nav-fill nav-tab-news mb-3 mt-2" id="pills-tab" role="tablist" >
                  <li class="nav-item" role="presentation">
                    <button class="nav-link text-uppercase fw-bold" id="pills-gallery-tab" data-bs-toggle="pill" data-bs-target="#pills-gallery" type="button" role="tab" aria-controls="pills-gallery" aria-selected="true">Images</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active text-uppercase fw-bold" id="pills-video-tab" data-bs-toggle="pill" data-bs-target="#pills-video" type="button" role="tab" aria-controls="pills-video" aria-selected="false">Videos</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link text-uppercase fw-bold" id="pills-document-tab" data-bs-toggle="pill" data-bs-target="#pills-document" type="button" role="tab" aria-controls="pills-document" aria-selected="false">Documents</button>
                  </li>
                </ul>
              </a>
                <div class="tab-content" id="pills-tabContent">
                  <div class="tab-pane fade" id="pills-gallery" role="tabpanel" aria-labelledby="pills-gallery-tab">
                      <a href="/thu-vien"><img class="w-100 h-auto" width="450" height="294" src="${contentModel.image_s}" alt=""></a>
                  </div>
                  <div class="tab-pane fade show active" id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab">
                        <a href="/thu-vien"><img class="w-100 h-auto" width="450" height="294" src="${contentModel.image_s}" alt=""></a>
                  </div>
                  <div class="tab-pane fade" id="pills-document" role="tabpanel" aria-labelledby="pills-document-tab">
                        <a href="/thu-vien"><img class="w-100 h-auto" width="450" height="294" src="${contentModel.image_s}" alt=""></a>
                  </div>
                </div>
              </div>
              <ul class="list-unstyled list-mf mb-0" style="margin-top: 22px;">
                <li>
                  <a href="/bep-mavin" class="text-muted">
                    <h3 class="text-uppercase fw-bold fs-5 base-color">MAVIN KITCHEN</h3>
                  </a>
                </li>
                <#list docs as docs>
                <li>
                  <a class="text-muted" href="${docs.url}">
                    ${docs.title}
                  </a>
                </li>
                </#list>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="home-block">
      <img class="img-fluid" src="/static-assets/dist/temp/8.jpg" alt="">
    </section>