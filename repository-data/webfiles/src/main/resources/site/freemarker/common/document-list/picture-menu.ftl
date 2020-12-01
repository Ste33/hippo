<#ftl output_format="HTML">
<#include "../../include/imports.ftl">

<div class="nhsd-row" style="background-color: transparent; margin: 20px 0">
    <div class="nhsd-col-xl-12 nhsd-u-text-centre">
        <h2>Products and services</h2>
    </div>
    <#if pageable?? && pageable.items?has_content>
        <#list pageable.items?chunk(2) as row>
            <#list row as item>
                <div class="nhsd-col-6">
                    <#if item.image??>
                        <@hst.link hippobean=item.image fullyQualified=true var="graphicImage" />
                        <picture class="nhsd-a-picture nhsd-a-picture--round-corners">
                            <img src="${graphicImage}" alt="2 scientists testing in a laboratory">
                        </picture>
                    </#if>

                    <#if item.internal?has_content>
                        <@hst.link var="link" hippobean=item.internal/>
                    <#else>
                        <#assign link=item.external/>
                    </#if>

                    <#if item.title??>
                        <a href="${link}" class="nhsd-a-link">
                            <p class="nhsd-u-text-centre nhsd-u-fw-bold">${item.label}
                                <span class="nhsd-a-icon nhsd-a-icon--size-m" style="display: inline-block">
                                    <svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" aria-hidden="true" focusable="false" viewBox="0 0 16 16"  width="100%" height="100%">
                                        <path d="M8.5,15L15,8L8.5,1L7,2.5L11.2,7H1v2h10.2L7,13.5L8.5,15z"/>
                                    </svg>
                                </span>
                            </p>
                        </a>
                    </#if>
                </div>
            </#list>
        </#list>
    </#if>
</div>
