<#import "/templates/system/common/cstudio-support.ftl" as studio />
    <section class="slide">
        <div class="slide__bg" style="background-image: url(/static-assets/images/template/slide_bg.png)"></div>
        <div class="slide__container owl-carousel owl-theme">
            <#if (contentModel.slide_o.item)??>
                <#list contentModel.slide_o.item as element>
                    <div class="slide__item item">
                        <img class="full-size" src="${element.image_s!""}" alt="Slide image">
                    </div>
                </#list>
            </#if>
            </div>
        </div>
    </section>
<@studio.toolSupport />