package uk.nhs.digital.apispecs;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.MockitoAnnotations.initMocks;
import static uk.nhs.digital.test.util.FileUtils.contentOfFileFromClasspath;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.mockito.Mock;
import uk.nhs.digital.apispecs.model.ApiSpecificationDocument;
import uk.nhs.digital.apispecs.swagger.SwaggerCodeGenOpenApiSpecificationJsonToHtmlConverter;

public class SwaggerCodeGenOpenApiSpecificationJsonToHtmlConverterTest {

    private static final String TEST_DATA_FILES_PATH =
        "/test-data/api-specifications/SwaggerCodeGenOpenApiSpecificationJsonToHtmlConverterTest";

    private final String specificationId = "123456";

    @Rule public ExpectedException expectedException = ExpectedException.none();

    @Mock private ApiSpecificationDocument apiSpecificationDocument;

    private SwaggerCodeGenOpenApiSpecificationJsonToHtmlConverter swaggerCodeGenApiSpecHtmlProvider;

    @Before
    public void setUp() {
        initMocks(this);

        given(apiSpecificationDocument.getId()).willReturn(specificationId);

        swaggerCodeGenApiSpecHtmlProvider = new SwaggerCodeGenOpenApiSpecificationJsonToHtmlConverter();
    }

    @Test
    public void getHtmlForSpec_convertsOpenApiJsonToHtml() {

        // given
        final String specificationJson = apigeeApiSpecificationJson();

        // when
        final String actualSpecHtml = swaggerCodeGenApiSpecHtmlProvider.htmlFrom(specificationJson);

        // then
        final String expectedSpecHtml = customisedSwaggerCodeGenGeneratedSpecificationHtml();

        assertThat(
            "Specification HTML has been generated using customised Swagger CodeGen v3",
            actualSpecHtml,
            is(expectedSpecHtml)
        );
    }

    @Test
    public void getHtmlForSpec_throwsException_onCodeGenFailure() {

        // given
        final String invalidSpecificationJson = "invalid specification JSON";

        expectedException.expect(RuntimeException.class);
        expectedException.expectMessage("Failed to generate HTML for OpenAPI specification.");
        expectedException.expectCause(isA(NullPointerException.class));

        // when
        swaggerCodeGenApiSpecHtmlProvider.htmlFrom(invalidSpecificationJson);

        // then
        // expectations set in 'given' are satisfied
    }

    @Test
    public void hideRequestHeaderWhenSectionIsEmpty() {

        // given
        final String specificationJson = apigeeApiSpecificationJsonWithEmptyReqSection();

        // when
        final String actualSpecHtml = swaggerCodeGenApiSpecHtmlProvider.htmlFrom(specificationJson);

        // then
        final String expectedSpecHtml = customisedSwaggerCodeGenGeneratedSpecificationHtmlForEmptyReqSection();

        assertThat(
            "Specification HTML has been generated using customised Swagger CodeGen v3",
            actualSpecHtml,
            is(expectedSpecHtml)
        );
    }

    @Test
    public void hideResponseHeaderWhenSectionIsEmpty() {

        // given
        final String specificationJson = apigeeApiSpecificationJsonWithEmptyResSection();

        // when
        final String actualSpecHtml = swaggerCodeGenApiSpecHtmlProvider.htmlFrom(specificationJson);

        // then
        final String expectedSpecHtml = customisedSwaggerCodeGenGeneratedSpecificationHtmlForEmptyResSection();

        assertThat(
            "Specification HTML has been generated using customised Swagger CodeGen v3",
            actualSpecHtml,
            is(expectedSpecHtml)
        );
    }

    private String apigeeApiSpecificationJsonWithEmptyReqSection() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/openapi-v3-spec-empty-req-sec.json");
    }

    private String apigeeApiSpecificationJsonWithEmptyResSection() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/openapi-v3-spec-empty-res-sec.json");
    }

    private String customisedSwaggerCodeGenGeneratedSpecificationHtmlForEmptyReqSection() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/customised-codegen-v3-generated-spec-empty-req-sec.html");
    }

    private String customisedSwaggerCodeGenGeneratedSpecificationHtmlForEmptyResSection() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/customised-codegen-v3-generated-spec-empty-res-sec.html");
    }

    private String apigeeApiSpecificationJson() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/openapi-v3-specification.json");
    }

    private String customisedSwaggerCodeGenGeneratedSpecificationHtml() {
        return contentOfFileFromClasspath(TEST_DATA_FILES_PATH + "/customised-codegen-v3-generated-spec.html");
    }
}
