<#ftl output_format="HTML">
<#include "../../include/imports.ftl">
<#include '../macro/feedlist-getimage.ftl'>
<#include '../macro/gridColumnGenerator.ftl'>
<#include '../macro/iconGenerator.ftl'>

<@hst.setBundle basename="rb.generic.texts"/>
<@fmt.message key="text.sr-only-link" var="srOnlyLinkText" />

<div class="nhsd-t-grid nhsd-!t-no-gutters">
    <div class="nhsd-t-row">

        <div class="nhsd-o-card-list">
            <div class="nhsd-t-grid nhsd-t-grid--full-width">
                <#if titleText?has_content>
                    <div class="nhsd-t-row">
                        <div class="nhsd-t-col">
                            <h2 class="nhsd-t-heading-xl nhsd-t-text-align-center nhsd-!t-margin-bottom-7">${titleText}</h2>
                        </div>
                    </div>
                </#if>

                <#if pageable.items??>
                    <div class="nhsd-t-row nhsd-o-card-list__items">
                        <#list pageable.items as item>
                            <#assign imageData = getImageData(item) />
                            <#assign imageDataAlt = (imageData[1]?has_content)?then(imageData[1], 'homepage-news-article-img-${item?index}') />
                            <#assign hasImageData = imageData[0]?has_content />
                            <#assign hasTitle = item.title?has_content />
                            <#assign hasSummary = item.shortsummary?has_content />
                            <#assign hasPublishedDate = item.publisheddatetime?has_content />

                            <#assign class = getGridCol(pageable.items?size) />

                            <div class="nhsd-t-col-xs-12 ${class}">
                                <article class="nhsd-m-card" id="homepage-news-article-${item?index}">

                                    <@hst.link hippobean=item var="linkDestination"/>
                                    <a href="${linkDestination}" class="nhsd-m-card__link" aria-label="${item.title}">
                                        <div class="nhsd-a-box nhsd-a-box--bg-light-grey">
                                            <#if hasImageData>
                                                <@hst.link hippobean=imageData[0].original fullyQualified=true var="leadImage" />
                                                <picture class="nhsd-a-picture">
                                                    <img src="${leadImage}" alt="${imageDataAlt}">
                                                </picture>
                                            </#if>

                                            <div class="nhsd-m-card__content-box">
                                                <#if hasPublishedDate>
                                                    <@fmt.formatDate value=item.publisheddatetime.time type="Date" pattern="d MMMM yyyy" var="publishedDateTimeString" timeZone="${getTimeZone()}" />
                                                    <span class="nhsd-m-card__date">${publishedDateTimeString}</span>
                                                </#if>

                                                <#if hasTitle>
                                                    <h1 class="nhsd-t-heading-s" id="homepage-news-article-title-${item?index}">${item.title}</h1>
                                                </#if>

                                                <#if hasSummary>
                                                    <p class="nhsd-t-body-s">${item.shortsummary}</p>
                                                </#if>
                                            </div>

                                            <div class="nhsd-m-card__button-box">
                                                <@buildInlineSvg "right" "s" "nhsd-m-card__arrow"/>
                                            </div>
                                        </div>
                                    </a>
                                </article>
                            </div>
                        </#list>
                    </div>
                </#if>

                <#assign hasPrimaryButton = (buttonText?has_content && buttonDestination?has_content) />
                <#assign hasSecondaryButton = (secondaryButtonText?has_content && secondaryButtonDestination?has_content) />

                <#if hasPrimaryButton || hasSecondaryButton>
                    <div class="nhsd-t-row">
                        <div class="nhsd-t-col">
                            <nav class="nhsd-m-button-nav">
                                <#if hasPrimaryButton>
                                    <a class="nhsd-a-button" href="${buttonDestination}" target="_blank" rel="external">
                                        <span class="nhsd-a-button__label">${buttonText}</span>
                                        <span class="nhsd-t-sr-only">${srOnlyLinkText}</span>
                                    </a>
                                </#if>
                                <#if hasSecondaryButton>
                                    <a class="nhsd-a-button nhsd-a-button--outline" href="${secondaryButtonDestination}" target="_blank" rel="external">
                                        <span class="nhsd-a-button__label">${secondaryButtonText}</span>
                                        <span class="nhsd-t-sr-only">(external link, opens in a new tab)</span>
                                    </a>
                                </#if>
                            </nav>
                        </div>
                    </div>
                </#if>
            </div>
        </div>

    </div>
</div>




