# Lab 17: Custom text classification

Azure AI Language provides several NLP capabilities, including the key phrase identification, text summarization, and sentiment analysis. The Language service also provides custom features like custom question answering and custom text classification.

To test the custom text classification of the Azure AI Language service, you'll configure the model using Language Studio then use a Python application to test it.

### Task 1: Provision an Azure AI Language resource

If you don't already have one in your subscription, you'll need to provision an Azure AI Language service resource. Additionally, use custom text classification, you need to enable the Custom text classification & extraction feature.

1. On the Azure portal, search for **Language service (1)** and then select **Language(2)** from the services.

   ![](../Images/ai15l1.png) 

1. Select **+ Create**.

   ![](../Images/ai15l2.png)

1. Select the box that includes **Custom text classification (1)**. Then select **Continue to create your resource (2)**.

   ![](../Images/ai17l1.png)

1. Create a resource with the following settings:

    - Subscription: *Your Azure subscription* **(1)**
    - Resource group: Select **AI-102-RG17 (2)**
    - Region: Select **<inject key="Region" enableCopy="false" /> (3)**
    - Name: Enter **textclassification<inject key="DeploymentID" enableCopy="false"/> (4)**
    - Pricing tier: Select **F0 (5)** (*free*), or **S** (*standard*) if F is not available.
    - Storage account: Select **New storage account** **(6)**
      - Storage account name: Enter **storage<inject key="DeploymentID" enableCopy="false"/> (7)**
      - Storage account type: Select **Standard LRS (8)**
    - Responsible AI notice: Selected **(9)**
    - Select **Review+Create (10)**

      ![](../Images/ai17l2.png)   
      ![](../Images/ai17l3.png) 

1. Then select **Create** to provision the resource.  

1. Wait for deployment to complete, and select **Go to resource group** to go to the resource group.

   ![](../Images/ai17l4.png)

1. Find the storage account **storage<inject key="DeploymentID" enableCopy="false"/>** you created, select it.

   ![](../Images/ai17l6.png)

1. Verify the `_Account kind_` is **StorageV2**.

    - If it's **v1**, upgrade your storage account kind on that resource page by following the steps

        - Select **Change**.
   
          ![](../Images/ai17l7.png)  

        - Select the checkbox to confirm that you have understood the implications of upgrading storage account **(1)** and then select **Upgrade (2)**.

          ![](../Images/ai17l8.png)      

        - Make sure that  `_Account kind_` is **StorageV2** now. 

          ![](../Images/ai17l9.png)  

1. Navigate back to the **AI-102-RG17** Resource group and the select **textclassification<inject key="DeploymentID" enableCopy="false"/>** language service.

   ![](../Images/ai17l5.png)

1. Navigate to the **Keys and Endpoint (1)** page in the **Resource Management** section. Copy and paste the **KEY 1 (2)** and **Endpoint (3)**. You will need the information on this page later in the lab. 
