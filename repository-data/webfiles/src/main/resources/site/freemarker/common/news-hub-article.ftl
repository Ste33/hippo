<#ftl output_format="HTML">
<#include "../include/imports.ftl">
<#include "macro/hubBox.ftl">
<#include "macro/stickyGroupBlockHeader.ftl">
<#include "macro/documentHeader.ftl">
<#include "macro/stickyNavYears.ftl">

<@hst.setBundle basename="rb.generic.headers,rb.doctype.news-hub"/>

<#assign overridePageTitle><@fmt.message key="headers.page-title" /></#assign>
<#-- Add meta tags -->
<#include "macro/metaTags.ftl">
<@metaTags></@metaTags>

<#assign monthNames = monthsOfTheYear()?reverse />

<#--Group the news articles by earliest start month  -->
<#assign newsGroupHash = {} />
<#list pageable.items as item>
<@fmt.formatDate value=item.publisheddatetime.time type="Date" pattern="MMMM" timeZone="${getTimeZone()}" var="key" />
<#assign newsGroupHash = newsGroupHash + {  key : (newsGroupHash[key]![]) + [ item ] } />
</#list>

<#function getFilterYearLinks>
    <#assign links = [] />

    <#list years?keys?sort?reverse as key>
        <#assign typeCount = years?size />
        <#assign links += [{ "key" : key, "title": key }] />
    </#list>

    <#return links />
</#function>

<article class="article article--news-hub">
    <#assign header_title><@fmt.message key="headers.page-title" /></#assign>
    <#assign header_summary><@fmt.message key="texts.intro" /></#assign>
    <#assign header_icon = 'images/icon-article.png' />
    <#assign document = "simulating_doc" />

    <@documentHeader document 'newshub' header_icon header_title header_summary "" false></@documentHeader>

    <div class="grid-wrapper grid-wrapper--article">
        <div class="grid-row">
            <div class="column column--one-quarter page-block page-block--sidebar article-section-nav-outer-wrapper">
                <#-- Query search component -->
                <div class="article-section-nav-wrapper" data-hub-filter-type="nhsd-hub-query-filter" data-hub-filter-key="query">
                    <div class="article-section-nav">
                        <h2 class="article-section-nav__title"><@fmt.message key="headers.refine" /></h2>
                        <#assign searchLink = "" />
                        <#assign searchId = "hub-search-input" />
                        <#assign searchFormId = "hub-search-form" />
                        <#assign buttonLabel = "Filter" />
                        <#include "../include/search-strip.ftl">

                        <#assign affix = selectedTypes?has_content?then("&type=" + selectedTypes?join("&type="), "") />
                        <#assign affix = affix + query?has_content?then("&query=" + query, "") />
                        <div class="article-section-nav-wrapper" data-hub-filter-type="nhsd-hub-tag-filter" data-hub-filter-key="year">
                            <@stickyNavYears getFilterYearLinks() affix></@stickyNavYears>
                        </div>
                    </div>
                </div>
            </div>

            <#-- Restore the bundle -->
            <@hst.setBundle basename="rb.generic.headers,rb.doctype.news-hub"/>


            <div class="column column--three-quarters page-block page-block--main">
                <div class="hub-box-list" id="hub-search-results">
                <#if pageable?? && pageable.items?has_content>
                    <div class="article-section article-section--letter-group">
                        <div class="grid-row">
                            <div class="column column--reset">
                                <#list pageable.items as item>
                                <#assign newsData = { "title": item.title, "text": item.shortsummary} />

                                <@hst.link hippobean=item var="newsLink" />
                                <@fmt.formatDate value=item.publisheddatetime.time type="Date" pattern="EEEE d MMMM yyyy" timeZone="${getTimeZone()}" var="date" />

                                <#assign newsData += { "link": newsLink, "date": date } />
                                <#assign newsData += { "imagesection": item.leadimagesection?has_content?then(item.leadimagesection, "EMPTY")} />

                                <@hubBox newsData></@hubBox>
                                </#list>
                            </div>
                        </div>
                    </div>
                <#else>
                    <div class="article-section">
                        <h2 class="article-header__title"><@fmt.message key="headers.no-results" /></h2>
                        <p>Would you like to <a href="${getDocumentUrl()}" aria-label="Clear filters" title="Clear filters">clear the filters</a>?</p>
                    </div>
                </#if>
                </div>

                <div class="article-section no-border no-top-margin" id="hub-search-pagination">
                    <#if pageable.totalPages gt 1>
                        <#include "../include/pagination.ftl">
                    </#if>
                </div>
            </div>
        </div>
    </div>

    <#include "scripts/hub-filter/hub-filter-controller.js.ftl"/>
</article>
