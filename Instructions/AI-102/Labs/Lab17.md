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

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="ec3cf71e-8167-42bb-95ed-136627c4cccf" />
 
---     

### Task 2: Upload sample articles

Once you've created the Azure AI Language service and storage account, you'll need to upload example articles to train your model later.

1. Within the JumpVM, in a new browser tab, download sample articles from `https://aka.ms/classification-articles`.

1. Select the **folder** icon.

    ![](../Images/ai17l10.png)

1. Right click on **articles** folder **(1)** and then select **Extract (2)**.  

    ![](../Images/ai17l11.png)

1. Change the destination path to `C:\LabFiles` **(1)** and then click **Extract (2)**.

    ![](../Images/ai17l12.png)

1. In the **Azure portal**, search for **storage account (1)**and select it **(2)**.

    ![](../Images/ai17l13.png)

1. Select the storage account **storage<inject key="DeploymentID" enableCopy="false"/>** you created.

    ![](../Images/ai17l14.png)

1. In your storage account select **Configuration (1)**, located below **Settings**. In the Configuration screen enable the option to **Allow Blob anonymous access (2)** then select **Save (3)**.

    ![](../Images/ai17l15.png)

1. Select **Containers (1)** in the left menu, located below **Data storage**. On the screen that appears, select **+ Container (2)**. Give the container the name `articles` **(3)**, and set **Anonymous access level** to **Container (anonymous read access for containers and blobs) (4)** and then **Create (5)**.

    ![](../Images/ai17l16.png)

     >**NOTE**: When you configure a storage account for a real solution, be careful to assign the appropriate access level. To learn more about each access level, see the [Azure Storage documentation](https://learn.microsoft.com/azure/storage/blobs/anonymous-read-access-configure).

1. After you've created the container, select **articles** container.

    ![](../Images/ai17l17.png)

1. Select the **Upload (1)** button. Select **Browse for files (2)** to browse for the sample articles you downloaded. 

    ![](../Images/ai17l18.png)

1. Navigate to `C:\LabFiles` **(1)**, click on **Ctrl+A** to select all the files **(2)** and then **Open (3)**.  

    ![](../Images/ai17l19.png)

1. Select **Upload**.

    ![](../Images/ai17l20.png)

### Task 3: Create a custom text classification project

After configuration is complete, create a custom text classification project. This project provides a working place to build, train, and deploy your model.

> **NOTE**: This lab utilizes **Language Studio**, but you can also create, build, train, and deploy your model through the REST API.

1. In a new browser tab, open the Azure AI Language Studio portal at `https://language.cognitive.azure.com/`.

1. Selelect **Sign in**.

    ![](../Images/ai15l10.png) 

1. If prompted, provide the credentials below:

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

    - **Password:** <inject key="AzureAdUserPassword"></inject>

1. Close the pop ups.

    ![](../Images/ai17l21.png) 

1. If prompted to choose a Language resource, select the following settings:

    - **Azure Directory**: Default Azure directory containing your subscription **(1)**
    - **Azure subscription**: Your Azure subscription **(2)**
    - **Resource type**: Language **(3)**
    - **Language resource**: The Azure AI Language resource you created previously **textclassification<inject key="DeploymentID" enableCopy="false"/> (4)**
    - Select **Done (5)**

      ![](../Images/ai17l22.png)     

    If you are <u>not</u> prompted to choose a language resource, it may be because you have multiple Language resources in your subscription; in which case:

    1. On the bar at the top if the page, select the **Settings (&#9881;)** button.
    2. On the **Settings** page, view the **Resources** tab.
    3. Select the language resource you just created, and click **Switch resource**.
    4. At the top of the page, click **Language Studio** to return to the Language Studio home page

1. At the top of the portal, in the **Create new (1)** menu, select **Custom text classification (2)**.

    ![](../Images/ai17l23.png) 

1. The **Connect storage** page appears. All values will already have been filled. So select **Next**.

    ![](../Images/ai17l24.png) 

1. On the **Select project type** page, select **Single label classification (1)**. Then select **Next (2)**.

    ![](../Images/ai17l25.png) 

1. On the **Enter basic information** pane, set the following and then **Next (4)**:

    - Name: `ClassifyLab` **(1)** 
    - Text primary language: English (US) **(2)**
    - Description: `Custom text lab`

      ![](../Images/ai17l26.png)   

1. On the **Choose container** page, set the **Blob store container** dropdown to your **articles (1)** container.
    - Select the  **No, I need to label my files as part of this project (2)** option. 
    - Then select **Next (3)**.

      ![](../Images/ai17l27.png) 

1. Select **Create project**.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="eb96f194-63da-4e73-b572-5026853ad24f" />
 
---     
