<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign bgStyle="" />
<#if contentModel.backgroundImage_s?? && !contentModel.backgroundVideo_s??>
  <#assign bgStyle="style='background-image: url(${contentModel.backgroundImage_s});'" />
</#if>

<#assign bgVideoClass="" />
<#assign bgVideoPoster="" />
<#if contentModel.backgroundVideo_s?? && (contentModel.backgroundVideo_s?length>0)>
  <#assign bgVideoClass="fullscreen-bg" />
  <#assign bgVideoPoster="poster='${contentModel.backgroundImage_s}'" />
</#if>

<!--Cover Section-->
<section id="home" class="home bg-black fix ${bgVideoClass}">
  <#if contentModel.sectionTitle?? >
    <@crafter.span $field="sectionTitle" class="scrollIndicatorTitle">
      ${contentModel.sectionTitle}
    </@crafter.span>
  </#if>

  <#if contentModel.backgroundVideo_s?? && (contentModel.backgroundVideo_s?length>0) >

    <video
      loop muted autoplay id="cover_video_spbb" ${bgVideoPoster} preload="metadata"  height="925" playsinline
    >
      <source src="${contentModel.backgroundVideo_s}" type="video/mp4">
    </video>

  </#if>

  <div class="overlay"></div>
  <!-- Edit Video -->

  <div class="container">
    <div class="row">
      <div class="main_home">
        <div class="col-md-12">
          <div class="hello_slid">
            <div class="slid_item xs-text-center">
              <#if contentModel.frontImage_s??>
                <div class="col-sm-4">
                  <@crafter.img $field="frontImage_s" src=(contentModel.frontImage_s!"") alt=""/>
                </div>
              </#if>
              <div class="col-sm-8">
                <@crafter.div $field="introductoryText_html" class="home_text xs-m-top-30">
                  ${contentModel.introductoryText_html!""}
                </@crafter.div>

                <@crafter.div $field="coverButtons_o" class="home_btns m-top-40">
                  <#if contentModel.coverButtons_o?? && contentModel.coverButtons_o.item??>
                    <#list contentModel.coverButtons_o.item as item>
                      <#assign index = item?index>
                      <a href="${item.buttonURL_s!"#"}" class="btn ${item.buttonType_s!""} m-top-20">
                        <@crafter.span $field="coverButtons_o.label_t" $index=index>
                            ${item.label_t!""}
                        </@crafter.span>
                      </a>
                    </#list>
                  </#if>
                </@crafter.div>
              </div>
            </div><!-- End off slid item -->
          </div>
        </div>
      </div>
    </div><!--End off row-->
  </div><!--End off container -->
</section>
<!--End off Cover Section-->