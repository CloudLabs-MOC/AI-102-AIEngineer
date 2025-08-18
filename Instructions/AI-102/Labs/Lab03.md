# Lab 03: Use a prompt flow to manage conversation in a chat app

In this lab, you'll use Azure AI Foundry portal's prompt flow to create a custom chat app that uses a user prompt and chat history as inputs, and uses a GPT model from Azure OpenAI to generate an output.

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

1. On the Azure portal searh bar, search for **Storage account** **(1)** and then select **Storage account (2)** from the results. 

   ![](../Images/aii95.png)

1. Then select the Storage account resource for your hub starts with **sthubxxxxxxxx**.   

   ![](../Images/aii96.png)

1. Navigate to **Access Control (IAM) (1)**, then select **Add (2)** drop down. Then select **Add role assignment (3)**.   

   ![](../Images/aii70.png)

1. Search for **Storage blob data reader (1)** then select **Storage blob data reader (2)** and then **Next (3)**.

   ![](../Images/aii71.png)

1. Select **Managed identity (1)**, click on **+ Select Members (2)**. Then choose **Azure AI Foundry (3)** then select the **ai-myhubxxxx (4)** and then **Select (5)**.

   ![](../Images/aii72.png)

1. Select **Next**.   

1. Click on **Review+assign**.

   ![](../Images/aii73.png)

1. Again click on **Review+assign**.

   ![](../Images/aii74.png)

1. When you've reviewed and assigned the role access to allow the Azure AI Foundry managed identity to read blobs in the storage account, close the Azure portal tab and return to the Azure AI Foundry portal.

### Task 3: Deploy a generative AI model

1. In the pane on the left for your project, in the My assets section, select the **Models + endpoints (1)** page.

   - In the Models + endpoints page, in the Model deployments tab, in the **+ Deploy model (2)** menu, select **Deploy base model (3)**.
 
     ![](../Images/aii75.png)   

1. Search for the **gpt-4.1 (1)** model in the list, and then select **(2)** and confirm it **(3)**.

   ![](../Images/aii76.png)

1. On the Deploy `gpt-4.1` page, select **Customize**.

   ![](../Images/aii97.png)

1. Deploy the model with the following settings by selecting Customize in the deployment details:

   - Deployment name: Leave the default name
   - Deployment type: **Global Standard**
   - Model version: Select **2025-04-14(Default) (1)**
   - Connected AI resource: Select your Azure OpenAI resource connection that starts with **ai-myhubxxxxxxx** **(2)**
   - Tokens per Minute Rate Limit (thousands): `60K` **(3)** (or the maximum available in your subscription if less than 50K)
   - Content filter: **DefaultV2 (4)**   
   - Then select **Deploy (5)**

     ![](../Images/aii98.png)

### Task 4: Create a prompt flow

A prompt flow provides a way to orchestrate prompts and other activities to define an interaction with a generative AI model. In this exercise, you'll use a template to create a basic chat flow for an AI assistant in a travel agency.

1. In the Azure AI Foundry portal navigation bar, in the **Build and customize** section, select **Prompt flow (1)**. Then select **+ Create (2)**.

   ![](../Images/aii77.png)

1. Create a new flow based on the Chat flow template, select **Create** under Chat flow.

   ![](../Images/aii78.png)
   
1. Specify the floder name as **Travel-Chat (1)** and then **Create (2)**.

   ![](../Images/aii79.png)

1. If a permissions error occurs like the below,  Specify a different flow name  as **Travel-Chat<inject key="DeploymentID" enableCopy="false"/> (1)** and **Create (2)**.

   ![](../Images/aii80.png)

1. Once the flow is created, click on **Edit (1)** icon to rename the folder. Provide the name as  **Travel-Chat (2)** and then **Save (3)**.  

   ![](../Images/aii81.png)

1. To be able to test your flow, you need compute, and it can take a while to start; so select **Start compute session** to get it started while you explore and modify the default flow.

   ![](../Images/aii82.png)

1. View the prompt flow, which consists of a series of inputs, outputs, and tools. You can expand and edit the properties of these objects in the editing panes on the left, and view the overall flow as a graph on the right.

1. View the Inputs pane, and note that there are two inputs (chat history and the user's question)

1. View the **Inputs** pane, and note that there are two inputs (`chat history` and the `user's question`).

   ![](../Images/aii83.png)

1. View the **Outputs** pane and note that there's an output to reflect the model's answer.   

   ![](../Images/aii84.png)

1. View the **Chat** LLM tool pane, which contains the information needed to submit a prompt to the model.

1. In the **Chat** LLM tool pane, for Connection, **select the connection for the Azure OpenAI service resource (1)** in your AI hub. Then configure the following connection properties:

   - Api: chat
   - deployment_name: The `gpt-4.1` model you deployed **(2)**
   - response_format: `{"type":"text"}` **(3)**

     ![](../Images/aii-85.png)   

1. Delete the existing prompt. Copy and paste the following the **Prompt**.

    ```yml
    # system:
    **Objective**: Assist users with travel-related inquiries, offering tips, advice, and recommendations as a knowledgeable travel agent.

    **Capabilities**:
    - Provide up-to-date travel information, including destinations, accommodations, transportation, and local attractions.
    - Offer personalized travel suggestions based on user preferences, budget, and travel dates.
    - Share tips on packing, safety, and navigating travel disruptions.
    - Help with itinerary planning, including optimal routes and must-see landmarks.
    - Answer common travel questions and provide solutions to potential travel issues.

    **Instructions**:
    1. Engage with the user in a friendly and professional manner, as a travel agent would.
    2. Use available resources to provide accurate and relevant travel information.
    3. Tailor responses to the user's specific travel needs and interests.
    4. Ensure recommendations are practical and consider the user's safety and comfort.
    5. Encourage the user to ask follow-up questions for further assistance.

    {% for item in chat_history %}
    # user:
    {{item.inputs.question}}
    # assistant:
    {{item.outputs.answer}}
    {% endfor %}

    # user:
    {{question}}
    ```     

     ![](../Images/aii86.png)    

      >**Note**: Read the prompt you added so you are familiar with it. It consists of a system message (which includes an objective, a definition of its capabilities, and some instructions), and the chat history (ordered to show each user question input and each previous assistant answer output)

1. In the **Inputs** section for the Chat LLM tool (under the prompt), ensure the following variables are set **(1)**:

   - question (string): ${inputs.question}
   - chat_history (string): ${inputs.chat_history}

1. Save the changes to the flow **(2)**.   

   ![](../Images/aii87.png)


### Task 5: Test the flow

1. Ensure the **compute session is running (1)**. If not, wait for it to start.

   - On the toolbar, select **Chat (2)** to open the Chat pane, and wait for the chat to initialize.

     ![](../Images/aii88.png)   

1. Enter the query: `I have one day in London, what should I do?` and review the output. The Chat pane should look similar to this:     

   ![](../Images/aii89.png)

### Task 6: Deploy the flow

When you're satisfied with the behavior of the flow you created, you can deploy the flow.

1. On the toolbar, select **Deploy** and deploy the flow with the following settings:

   ![](../Images/aii90.png)

1. Deploy the flow with the following settings and then **Review+Create (6)**:

   - Basic settings:
      - Endpoint: **New (1)**
      - Endpoint name: **myendpoint<inject key="DeploymentID" enableCopy="false"/> (2)**
      - Deployment name: Leave the default one
      - Virtual machine: **Standard_DS3_v2 (3)**
      - Instance count: `1` **(4)**
      - Inferencing data collection: **Disabled (5)**

        ![](../Images/aii91.png)

1. Select **Create**.

   ![](../Images/aii92.png)

1. Deployment may take aroud 12-15 minutes. Please wait until it completes. You can track the progress in the Notifications panel.

   ![](../Images/aii93.png)

1. Once the deployemnt is completed, In Azure AI Foundry portal, in the navigation pane, in the My assets section, click on the **Models + endpoints (1)** twice. Refresh the page. Make sure the **myendpointxxxxx** endopint is listed and in the **Succeeded (2)** state. Then select it **(3)**.

   ![](../Images/aii94.png)

1. Navigate to the `Test` page.

   ![](../Images/aii99.png)

1. Enter the prompt `What is there to do in San Francisco?` and review the response.

   ![](../Images/aii100.png)

1. Enter the prompt `Tell me something about the history of the city.` and review the response.

   ![](../Images/aii101.png)

1. View the **Consume** page for the endpoint, and note that it contains connection information and sample code that you can use to build a client application for your endpoint - enabling you to integrate the prompt flow solution into an application as a generative AI application.

   ![](../Images/aii102.png)
