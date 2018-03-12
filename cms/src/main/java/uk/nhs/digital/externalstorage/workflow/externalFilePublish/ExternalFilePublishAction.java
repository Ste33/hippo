package uk.nhs.digital.externalstorage.workflow.externalFilePublish;

import org.apache.commons.scxml2.SCXMLExpressionException;
import org.apache.commons.scxml2.model.ModelException;
import org.hippoecm.repository.HippoStdNodeType;
import org.onehippo.cms7.services.HippoServiceRegistry;
import org.onehippo.repository.documentworkflow.action.AbstractDocumentTaskAction;

import uk.nhs.digital.externalstorage.s3.S3Connector;

public class ExternalFilePublishAction extends AbstractDocumentTaskAction<ExternalFilePublishTask> {

    @Override
    protected ExternalFilePublishTask createWorkflowTask() {
        return new ExternalFilePublishTask();
    }

    @Override
    protected void initTask(ExternalFilePublishTask task) throws ModelException, SCXMLExpressionException {
        super.initTask(task);
        task.setS3Connector(HippoServiceRegistry.getService(S3Connector.class));
        task.setVariantState(HippoStdNodeType.UNPUBLISHED);
    }
}