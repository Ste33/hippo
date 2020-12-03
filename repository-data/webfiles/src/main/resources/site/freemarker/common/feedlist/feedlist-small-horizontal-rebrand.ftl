<#ftl output_format="HTML">
<#include "../../include/imports.ftl">
<#include '../macro/media-item.ftl'>
<#include '../macro/feedlist-getimage.ftl'>

<#if titleText?has_content>
    <div class="nhsd-t-row">
        <div class="nhsd-t-col-12 nhsd-!t-text-align-center">
            <h2 class="nhsd-t-heading-xl nhsd-!t-margin-bottom-7">${titleText}</h2>
        </div>
    </div>
</#if>

<div class="nhsd-o-card-list">
    <div class="nhsd-t-grid nhsd-!t-no-gutters">
        <div class="nhsd-t-row">
            <#list pageable.items as item>
                <#assign imageData = getImageData(item) />
                <#assign hasImageData = imageData?has_content />
                <#assign hasTitle = item.title?has_content />
                <#assign hasSummary = item.shortsummary?has_content />
                <#assign hasPublishedDate = item.publisheddatetime?has_content />

                <#assign class = "" />
                <#if pageable.items?size = 2>
                    <#assign class = "nhsd-t-col-s-3 nhsd-t-col-m-6" />
                <#elseif pageable.items?size = 3>
                    <#assign class = "nhsd-t-col-s-2 nhsd-t-col-m-4" />
                <#elseif pageable.items?size = 4>
                    <#assign class = "nhsd-t-col-s-3 nhsd-t-col-m-6 nhsd-t-col-l-3" />
                </#if>

                <div class="nhsd-t-col-xs-2 ${class}">
                    <article class="nhsd-m-card" id="homepage-news-article-${item?index}">
                        <@hst.link hippobean=item var="linkDestination"/>
                        <a href="${linkDestination}" class="nhsd-m-card__link" aria-label="${item.title}">
                            <div class="nhsd-a-box nhsd-a-box--bg-light-grey">

                                <#if hasImageData>
                                    <@hst.link hippobean=imageData[0].original fullyQualified=true var="leadImage" />
                                    <picture class="nhsd-a-picture">
                                        <img src="${leadImage}" alt="${imageData[1]}">
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
                                        <p class="nhsd-t-body">${item.shortsummary}</p>
                                    </#if>
                                </div>
                                <span class="nhsd-a-icon nhsd-a-icon--size-s nhsd-m-card__arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" aria-hidden="true" focusable="false" viewBox="0 0 16 16" width="100%" height="100%">
                                        <path d="M8.5,15L15,8L8.5,1L7,2.5L11.2,7H1v2h10.2L7,13.5L8.5,15z"></path>
                                    </svg>
                                </span>
                            </div>
                        </a>
                    </article>
                </div>
            </#list>
        </div>
    </div>
</div>

<div class="nhsd-t-row">
    <div class="nhsd-t-col-6 nhsd-!t-text-align-right">
        <a class="nhsd-a-button" href="#" target="_blank" rel="external">
            <span class="nhsd-a-button__label">View all news</span>
            <span class="nhsd-t-sr-only"> (external link, opens in a new tab)</span>
        </a>
    </div>
    <div class="nhsd-t-col-6 nhsd-!t-text-align-left">
        <a class="nhsd-a-button nhsd-a-button--outline" href="#" target="_blank" rel="external">
            <span class="nhsd-a-button__label">View all events</span>
            <span class="nhsd-t-sr-only"> (external link, opens in a new tab)</span>
        </a>
    </div>
</div>



<#--
<#list pageable.items>
    <div class="nhsd-row">
        <div class="nhsd-col-12">
        <#if (titleText)?has_content >
            <h2 class="section-title feedlist__title">${titleText}</h2>
        </#if>
        </div>

            <#items as feedItem>
                <#assign imageData = getImageData(feedItem) />
                <#assign feedItemTitle = feedItem.title />
                <#assign feedItemShortSummary = feedItem.shortsummary />

                <#assign date = '' />
                <#assign dateTo = '' />
                <#if feedItem.dateOfPublication?has_content>
                    <#assign date = feedItem.dateOfPublication.time />
                <#elseif feedItem.publisheddatetime?has_content>
                    <#assign date = feedItem.publisheddatetime.time />
                <#elseif (feedItem.events)??>
                <#-- event start and end dates
                    <#assign dateRangeData = getEventDateRangeData(feedItem.events) />
                    <#if dateRangeData?size gt 0>
                        <#assign date = dateRangeData.minStartTime />
                        <#if dateRangeData.comparableStartDate != dateRangeData.comparableEndDate>
                            <#assign dateTo = dateRangeData.maxEndTime />
                        </#if>
                    </#if>
                </#if>
        <div class="nhsd-col-m-6 nhsd-col-l-2 nhsd-col-xl-2">

                <@hst.link hippobean=feedItem var="linkDestination"/>

                <@mediaItem
                image=imageData[0]
                alttext=imageData[1]
                feedItemTitle=feedItemTitle
                feedItemShortSummary=feedItemShortSummary
                linkDestination=linkDestination
                date=date
                dateTo=dateTo
                className="feedlist__item"
                />
            </div>
            </#items>
        <#if (buttonDestination)?has_content && (buttonText)?has_content >
            <div class="feedlist__button-container">
                <a class="nhsd-a-button feedlist__button" href="${buttonDestination}">
                    <span class="nhsd-a-button__label">${buttonText}</span>
                </a>
            </div>
        </#if>
    </section>
</#list>
        -->
