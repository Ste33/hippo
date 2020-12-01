<#ftl output_format="HTML">
<#include "../include/imports.ftl">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NHSD - Frontend</title>

    <!--[if IE]><link rel="shortcut icon" href="<@hst.webfile path="icons/favicon.ico"/>"><![endif]-->
    <link rel="icon" type="image/png" sizes="32x32" href="<@hst.webfile path="icons/favicon-32x32.png"/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<@hst.webfile path="icons/favicon-16x16.png"/>">

    <link rel="stylesheet" href="<@hst.webfile path="/dist/nhsd-frontend.css"/>" media="screen" type="text/css"/>

    <link href="https://s3.eu-west-2.amazonaws.com/ui-toolkit.digital.nhs.uk/" rel="preconnect" crossorigin>
    <link type="font/woff2" href="https://s3.eu-west-2.amazonaws.com/ui-toolkit.digital.nhs.uk/fonts/FrutigerLTW01-55Roman.woff2" rel="preload" as="font" crossorigin>
    <link type="font/woff2" href="https://s3.eu-west-2.amazonaws.com/ui-toolkit.digital.nhs.uk/fonts/FrutigerLTW01-65Bold.woff2" rel="preload" as="font" crossorigin>
    <link type="font/woff2" href="https://s3.eu-west-2.amazonaws.com/ui-toolkit.digital.nhs.uk/fonts/FrutigerLTW01-45Light.woff2" rel="preload" as="font" crossorigin>
</head>
<body>
    <div class="nhsd-grid nhsd-grid--full-width">
        <header style="height: 100px;display: block;width: 100%;padding: 1.222rem;">
            <div class="nhsd-row" style="background-color: transparent">
                <div class="nhsd-col-3">
                    <a href="" class="nhsd-m-logo-link" aria-label="Home page">
                        <svg class="nhsd-a-logo"
                             xmlns="http://www.w3.org/2000/svg"
                             viewBox="0 0 80 60"
                             width="80"
                             height="60"
                             aria-hidden="true"
                             focusable="false">
                            <rect fill="#005BBB" x="0" width="80" height="32.1"/>
                            <path fill="#FFFFFF" d="M76.9,3.8L75.2,9c-1.3-0.6-3.2-1.2-5.7-1.2c-2.8,0-5,0.4-5,2.5c0,3.7,10.1,2.3,10.1,10.2c0,7.1-6.7,9-12.7,9c-2.7,0-5.8-0.6-8-1.3l1.6-5.3c1.4,0.9,4.1,1.5,6.4,1.5c2.2,0,5.5-0.4,5.5-3.1c0-4.2-10.1-2.6-10.1-9.9c0-6.7,5.9-8.7,11.6-8.7C72.1,2.7,75.1,3,76.9,3.8"/>
                            <polygon fill="#FFFFFF" points="56.9,3.1 51.5,29 44.5,29 46.8,17.9 38.6,17.9 36.3,29 29.3,29 34.7,3.1 41.7,3.1 39.6,13 47.8,13 49.9,3.1   "/>
                            <polygon fill="#FFFFFF" points="32.1,3.1 26.6,29 18,29 12.5,11.1 12.5,11.1 8.8,29 2.3,29 7.8,3.1 16.5,3.1 21.8,21 21.9,21 25.6,3.1  "/>
                            <rect x="63.5" y="38.5" fill="#231F20" width="3.1" height="16"/>
                            <path fill="#231F20" d="M51.6,43.1c1.3-0.6,2.7-0.9,4.1-0.9c3.6,0,5.1,1.5,5.1,5v1.7c0,1.2,0,2.1,0,3c0,0.9,0.1,1.7,0.1,2.6h-2.7c-0.1-0.6-0.1-1.2-0.1-1.8h0c-0.7,1.3-2.2,2-3.6,2c-2.1,0-4.1-1.3-4.1-3.5c0-1.8,0.8-3,2-3.6c1.2-0.6,2.7-0.7,4-0.7H58c0-1.9-0.8-2.5-2.7-2.5c-1.3,0-2.7,0.5-3.7,1.3V43.1z M55.2,52.3c0.8,0,1.7-0.4,2.2-1.1c0.5-0.7,0.6-1.5,0.6-2.4h-1.3c-1.4,0-3.4,0.2-3.4,2C53.3,51.9,54.1,52.3,55.2,52.3"/>
                            <path fill="#231F20" d="M42.7,45.2h-2.3v-2.2h2.3v-2.7l3.1-1v3.6h2.7v2.2h-2.7v5.3c0,1,0.3,1.9,1.4,1.9c0.5,0,1.1-0.1,1.4-0.3l0.1,2.4c-0.7,0.2-1.5,0.3-2.3,0.3c-2.4,0-3.7-1.5-3.7-3.8L42.7,45.2z"/>
                            <path fill="#231F20" d="M35.2,38.5h3.1v2.7h-3.1V38.5z M35.2,42.9h3.1v11.6h-3.1V42.9z"/>
                            <path fill="#231F20" d="M32.6,42.9v10.7c0,3.2-1.3,6-6.2,6c-1.4,0-2.8-0.3-4.1-0.8l0.3-2.6c0.9,0.5,2.5,1,3.4,1c3.4,0,3.6-2.3,3.6-4.3h0c-0.6,1-1.9,1.9-3.7,1.9c-3.5,0-4.8-2.8-4.8-6c0-2.8,1.5-6.1,5-6.1
                                c1.6,0,2.8,0.5,3.6,1.9h0v-1.6L32.6,42.9z M29.5,48.7c0-2-0.8-3.7-2.6-3.7c-2.1,0-2.8,1.9-2.8,3.7c0,1.6,0.8,3.6,2.6,3.6C28.7,52.3,29.5,50.7,29.5,48.7"/>
                            <path fill="#231F20" d="M15.9,38.5H19v2.7h-3.1V38.5z M15.9,42.9H19v11.6h-3.1V42.9z"/>
                            <path fill="#231F20" d="M0,38.5h4.4c4.9,0,9.2,1.7,9.2,8s-4.3,8-9.2,8H0V38.5z M3.2,52H5c2.7,0,5.3-2,5.3-5.5C10.3,43,7.7,41,5,41H3.2V52z"/>
                        </svg>
                    </a>
                </div>
                <div class="nhsd-col-6">
                    <@hst.include ref="main-nav"/>
                </div>
                <div class="nhsd-col-3 nhsd-u-text-right">
                    <button class="nhsd-a-button" id=""  type="button">
                        <span class="nhsd-a-button__label">Search</span>
                    </button>
                </div>
            </div>
        </header>

        <main id="main-content">
            <@hst.include ref= "main"/>
        </main>
    </div>
</body>
</html>
