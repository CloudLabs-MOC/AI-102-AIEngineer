# Lab 36: Create an knowledge mining solution
In this lab, you use AI Search to index a set of documents maintained by Margie's Travel, a fictional travel agency. The indexing process involves using AI skills to extract key information to make them searchable, and generating a knowledge store containing data assets for further analysis.

### Task 1: Create an Azure AI Search resource

1. On the Azure portal, search for `Azure AI Search` **(1)**, and select **Azure AI Search (2)** from the services.

   ![](../Images/ai36l1.png)

1. Select **+ Create**.

   ![](../Images/ai36l2.png)

1. Create an **Azure AI Search** resource with the following settings:

    - Subscription: Leave your default  Azure subscription **(1)**
    - Resource group: Select **AI-102-RG24 (2)**
    - Service name: Enter **aisearch<inject key="DeploymentID" enableCopy="false"/> (3)**
    - Location: Select **<inject key="Region" enableCopy="false" /> (4)**
    - Pricing tier: If its Standard then select **Change Pricing Tier (5)**

      ![](../Images/ai36l3.png)

      - Select **Free (1)** and then **Select (2)**

        ![](../Images/ai36l4.png)   

1. Select **Review+Create**.           

   ![](../Images/ai36l5.png)

1. Select **Create**.   

1. Wait for deployment to complete, and then select **Go to resources**.

   ![](../Images/ai36l6.png)

1. Review the **Overview** page on the blade for your Azure AI Search resource in the Azure portal. Here, you can use a visual interface to create, test, manage, and monitor the various components of a search solution; including data **sources, indexes, indexers,** and **skillsets**.

### Task 2: Create a storage account

1. On the Azure portal, search for `Storage account` **(1)**, and select **Storage account (2)** from the services.

   ![](../Images/ai36l7.png)

1. Select **+ Create**.   

1. Then create a **Storage account** resource with the following settings:
    - Subscription: *Your Azure subscription* **(1)**
    - Resource group: Select **AI-102-RG24 (2)**
    - Storage account name: Enter **Storage<inject key="DeploymentID" enableCopy="false"/> (3)**
    - Region: Select **<inject key="Region" enableCopy="false" /> (4)**
    - Primary service: Select **Azure Blob Storage or Azure Data Lake Storage Gen 2 (5)**
    - Performance: **Standard (6)**
    - Redundancy: **Locally-redundant storage (LRS) (7)**
    - Then **Review+Create (8)**

      ![](../Images/ai36l8.png)    

1. Wait for deployment to complete, and then go to the deployed resource.

    >**Tip**:Keep the storage account portal page open - you will use it in the next procedure.


