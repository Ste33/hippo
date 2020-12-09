<#ftl output_format="HTML">
<#include "../../include/imports.ftl">
<#include '../macro/media-item.ftl'>
<#include '../macro/feedlist-getimage.ftl'>
<#include '../macro/gridColumnGenerator.ftl'>

<div class="nhsd-o-card-list">
    <div class="nhsd-t-grid">
        <#if titleText?has_content>
            <div class="nhsd-t-row nhsd-t-text-align-center">
                <div class="nhsd-t-col">
                    <h2 class="nhsd-t-heading-xl nhsd-!t-margin-bottom-7">${titleText}</h2>
                </div>
            </div>
        </#if>

        <#if pageable.items??>
            <div class="nhsd-t-row nhsd-o-card-list__cards">
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
                                        <span class="nhsd-a-icon nhsd-a-icon--size-s nhsd-m-card__arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" aria-hidden="true" focusable="false" viewBox="0 0 16 16"  width="100%" height="100%">
                                                <path d="M8.5,15L15,8L8.5,1L7,2.5L11.2,7H1v2h10.2L7,13.5L8.5,15z"/>
                                            </svg>
                                        </span>
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
                <#if hasPrimaryButton>
                    <div class="nhsd-t-col-xs-12 nhsd-t-col-s-6 nhsd-!t-text-align-xs-center nhsd-t-text-align-right">
                        <a class="nhsd-a-button nhsd-!t-margin-bottom-3" href="${buttonDestination}" target="_blank" rel="external">
                            <span class="nhsd-a-button__label">${buttonText}</span>
                        </a>
                    </div>
                </#if>

                <#if hasSecondaryButton>
                    <div class="nhsd-t-col-xs-12 nhsd-t-col-s-6 nhsd-!t-text-align-xs-center nhsd-t-text-align-left">
                        <a class="nhsd-a-button nhsd-a-button--outline nhsd-!t-margin-bottom-0" href="${secondaryButtonDestination}" target="_blank" rel="external">
                            <span class="nhsd-a-button__label">${secondaryButtonText}</span>
                        </a>
                    </div>
                </#if>
            </div>
        </#if>
    </div>
</div>




