<#ftl output_format="HTML">
<#include "../../include/imports.ftl">

<div class="nhsd-o-graphic-block-list">
    <div class="nhsd-t-grid nhsd-!t-no-gutters nhsd-t-grid--debugs">
        <div class="nhsd-t-row">
            <#if pageable?? && pageable.items?has_content>

                <#list pageable.items as item>
                    <div class="nhsd-t-col-xs-12 nhsd-t-col-s-4 nhsd-t-off-s-2 nhsd-t-col-l-3 nhsd-t-off-l-0">
                        <div class="nhsd-m-graphic-block">
                            <#if item.infographics.icon??>
                                <@hst.link hippobean=item.infographics.icon fullyQualified=true var="graphicImage" />
                                <div class="nhsd-m-graphic-block__picture">
                                    <picture class="nhsd-a-picture nhsd-a-picture--square">
                                        <img src="${graphicImage}" alt="Image for infographic ${item.infographics.heading}">
                                    </picture>
                                </div>
                            </#if>

                            <div class="nhsd-m-graphic-block__heading">
                                <#if item.infographics??>
                                    <span class="nhsd-t-heading-xl nhsd-!t-margin-bottom-0">${item.infographics.heading}</span>
                                </#if>

                                <#if item.title??>
                                    <span class="nhsd-t-heading-xs">${item.title}</span>
                                </#if>
                            </div>
                            <p class="nhsd-t-body-xs"><@hst.html hippohtml=item.infographics.qualifyingInformation contentRewriter=gaContentRewriter/></p>
                        </div>
                    </div>
                </#list>
                <div class="nhsd-col-12">
                    <hr class="nhsd-a-rule" />
                </div>
            </#if>
        </div>
    </div>
</div>
