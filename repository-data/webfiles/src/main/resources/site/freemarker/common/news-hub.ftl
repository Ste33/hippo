<#ftl output_format="HTML">
<#include "../include/imports.ftl">
<#include "macro/metaTags.ftl">

<#-- Add meta tags -->
<@metaTags></@metaTags>

<section class="news-hub" aria-label="News hub">

    <@hst.include ref= "banner"/>

    <div class="grid-wrapper">
        <div class="site-main">
            <@hst.include ref="main"/>
        </div>
    </div>

</section>
