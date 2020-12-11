<#ftl output_format="HTML">
<#include "../../include/imports.ftl">
<#include "../macro/sections/statistic.ftl">
<#include "../macro/iconGenerator.ftl">
<#include "../macro/gridColumnGenerator.ftl">

<@hst.setBundle basename="rb.generic.texts"/>
<@fmt.message key="text.sr-only-link" var="srOnlyLinkText" />

<div class="nhsd-o-graphic-block-list">
    <div class="nhsd-t-grid nhsd-!t-no-gutters">
        <div class="nhsd-t-row nhsd-t-row--centred nhsd-o-graphic-block-list__items">
            <#if pageable?? && pageable.items?has_content>
                <#list pageable.items as item>
                    <#assign hasLinks = item.items?has_content />
                    <#assign hasStats = item.modules?has_content />
                    <#assign hasImage = item.image?has_content />

                    <div class="nhsd-t-col-xs-12 ${getGridCol(pageable.items?size, "s")}">
                        <div class="nhsd-m-graphic-block">
                            <#if hasImage>
                                <#assign altText = item.altText?has_content?then(item.altText, "Image for graphic block ${item?index}") />
                                <@hst.link hippobean=item.image fullyQualified=true var="graphicImage" />

                                <div class="nhsd-m-graphic-block__picture">
                                    <picture class="nhsd-a-picture nhsd-a-picture--square">
                                        <img src="${graphicImage}" alt="${altText}">
                                    </picture>
                                </div>
                            </#if>

                            <#if hasStats>
                                <#assign stats = item.modules[0] />

                                <#if hasLinks>
                                    <#assign link = item.items[0] />

                                    <#if link.linkType == "internal">
                                        <a href="<@hst.link hippobean=link.link/>" class="nhsd-a-link nhsd-m-graphic-block__heading">
                                    <#else>
                                        <a href="${link.link}" class="nhsd-a-link nhsd-m-graphic-block__heading" target="_blank" rel="external">
                                    </#if>
                                <#else>
                                <div class="nhsd-m-graphic-block__heading">
                                </#if>
                                    <span class="nhsd-t-heading-xl nhsd-!t-margin-bottom-0">${getPrefix(stats.prefix)}${stats.number}${getSuffix(stats.suffix)}
                                        <#if stats.trend != "none">
                                            <@buildInlineSvg stats.trend />
                                        </#if>
                                    </span>

                                    <@hst.html hippohtml=stats.headlineDescription var="headlineDesc"/>
                                    <span class="nhsd-t-heading-xs">
                                        ${headlineDesc?replace('<[^>]+>','','r')}
                                    </span>

                                    <#if hasLinks>
                                        <#if item.items[0].linkType == "external">
                                            <#--screen reader use-->
                                            <span class="nhsd-t-sr-only">${srOnlyLinkText}</span>
                                        </#if>
                                    </#if>
                                <#if hasLinks>
                                    </a>
                                <#else>
                                    </div>
                                </#if>

                                <@hst.html hippohtml=stats.furtherQualifyingInformation var="furtherQualInfo"/>
                                <p class="nhsd-t-body-s">
                                    ${furtherQualInfo?replace('<[^>]+>','','r')}
                                </p>
                            </#if>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
    </div>
</div>
