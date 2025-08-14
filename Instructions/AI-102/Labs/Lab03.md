#  Use a prompt flow to manage conversation in a chat app

### Task 1: Create an Azure AI Foundry hub and project

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the LabVM browser tab, copy and paste the following link  https://ai.azure.com/managementCenter/allResources and select **Create new**.  

   ![](../Images/aii60.png) 

1. In the Create a project wizard, select **AI hub resource**.

   ![](../Images/aii61.png)

1. Enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)**, then select **Rename hub (2)**. Then rename the hub as  **Myhub<inject key="DeploymentID" enableCopy="false"/> (3)** and then **Next (4)**.

   ![](../Images/aii62.png)

1. Expand **Advanced options (1)**, and specify the following settings for your project and leave the rest as their defaults:

    - Resuorce group: Select **AI-102-RG03 (2)**
    - Region: Select **<inject key="Region" enableCopy="false" /> (3)**
    - Select **Create (4)**

      ![](../Images/aii63.png)    

1. Wait for your project to be created. It may take around 3-5 minutes.

### Task 2: Configure resource authorization

The prompt flow tools in Azure AI Foundry create file-based assets that define the prompt flow in a folder in blob storage. Before exploring prompt flow, let's ensure that your Azure AI Foundry resource has the required access to the blob store so it can read them.

1. In a new browser tab, open the [Azure portal](https://portal.azure.com), igning in with your Azure credentials if prompted.

1. On the search bar, search for **Azure AI Foundry (1)** and select **Azure AI Foundry (2)**.

   ![](../Images/aii64.png)

1. Select the **AI Foundry (1)** resource for your hub to open it and then select AI service that start with **ai-myhubxxxxxx (2)**.

   ![](../Images/aii65.png)

1. Then expand its **Resource Management (1)** section, then select the **Identity (2)**. If the status of the system assigned identity is Off, switch it **On (3)** and **Save (4)** your changes.   

   ![](../Images/aii66.png)

1. Select **Yes** to confirm.

   ![](../Images/aii67.png)




