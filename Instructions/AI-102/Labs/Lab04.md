# Create a generative AI app that uses your own data

### Estimated Duration : 45 Minutes

## Overview

Retrieval Augmented Generation (RAG) is a technique used to build applications that integrate data from custom data sources into a prompt for a generative AI model. RAG is a commonly used pattern for developing generative AI apps - chat-based applications that use a language model to interpret inputs and generate appropriate responses.

In this exercise, you'll use Azure AI Foundry to integrate custom data into a generative AI solution.

> **Note**: The code in this exercise is based on pre-release SDK software, which may be subject to change. Where necessary, we've used specific versions of packages; which may not reflect the latest available versions. You may experience some unexpected behavior, warnings, or errors.

While this exercise is based on the Azure OpenAI Python SDK, you can develop AI chat applications using multiple language-specific SDKs; including:

- [OpenAI for Python](https://pypi.org/project/openai/)
- [Azure Open AI for Microsoft .NET](https://www.nuget.org/packages/Azure.AI.OpenAI)
- [Azure OpenAI for TypeScript](https://www.npmjs.com/package/@azure/openai)

This exercise takes approximately **45** minutes.

## Lab Objectives

- **Task 1:** Create an Azure AI Foundry hub and project

- **Task 2**: Deploy models

- **Task 3:** Add data to your project

- **Task 4:** Create an index for your data

## Task 1: Create an Azure AI Foundry hub and project

The features of Azure AI Foundry we're going to use in this exercise require a project that is based on an Azure AI Foundry *hub* resource.

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.
 
    ![](../Images/l4t3l8t1p1.png)

1. If prompted, provide the credentials below:
 
   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
        ![](../Images/l4t3aifoundrysignin1.png)

   - **Password:** <inject key="AzureAdUserPassword"></inject>
    
        ![](../Images/l4t3aifoundrysignin2.png)

1. When the **Stay signed in?** window appears, select **No**.

    ![](../Images/l4t3aifoundrysignin3.png)

1. Click on **X** to close the **Chat with Foundry Agent** popup window.

    ![](../Images/l4t3l8t1p2.png)

    >**Note:** Close the **Help** pane if it's open

1. In the browser, navigate to `https://ai.azure.com/managementCenter/allResources` and select **Create new**. 

    ![](../Images/l4t3l4t1p1.png)

1. In the **Create Project** window, select the option to create a new **AI hub resource (1)**, then click **Next (2)**.

    ![](../Images/l4t3l4t1p2.png)

1. In the **Create a project** wizard, enter **Myproject<inject key="DeploymentID"></inject> (1)** in the Project name field. Under the Hub field, click **Rename hub (2)** and specify **Myhub<inject key="DeploymentID"></inject> (3)** as the hub name. Then, expand the **Advanced options (4)** drop-down.

    ![](../Images/l4t3l4t1p3.png)

1. In the Advanced options specify the following settings for your project and the  click **Create (9)**.

    * Subscription: **Choose Default Subscription (5)**
    * Resource group: **AI-102-RG04 (6)**
    * Azure AI Foundry resource: **Keep as Default (7)**
    * Region: **<inject key="Region"></inject> (8)**

        ![](../Images/l4t3l4t1p4.png)

1. Wait for your project to be created, and then navigate to your project.

    ![](../Images/l4t3l4t1p5.png)

## Task 2: Deploy models

You need two models to implement your solution:

- An *embedding* model to vectorize text data for efficient indexing and processing.
- A model that can generate natural language responses to questions based on your data.

1. In your Azure AI Foundry project, go to the navigation pane on the left, under **My assets**, open the **Models + endpoints (1)** page. Click **+ Deploy model (2)**, then choose **Deploy base model (3)**.

    ![](../Images/l4t3l4t2p1.png)

1. In the **Deploy text-embedding-ada-002** window, enter the following details, then select **Customize (3)**.

    - Deployment name: **text-embedding-ada-002 (1)**
    - Deployment type: **Global Standard (2)**
    
        ![](../Images/l4t3l4t2p3.png)

1. In the **Deployment details** section, fill in the following information, then click **Deploy (8)**.

    - Model version: **Select the default version (4)**
    - Connected AI resource: **Keep it default (5)**
    - Tokens per Minute Rate Limit (thousands): **50K (6)**
    - Content filter: **DefaultV2 (7)**

        ![](../Images/l4t3l4t2p4.png)

        > **Note**: If your current AI resource location doesn't have quota available for the model you want to deploy, you will be asked to choose a different location where a new AI resource will be created and connected to your project.

1. From the navigation pane on the left, under **My assets**, open the **Models + endpoints (1)** page, click **+ Deploy model (2)**, and select **Deploy base model (3)**.

    ![](../Images/l4t3l4t2p1(1).png) 

1. In the **Select a model** window, use the search bar to find **gpt-4.1 (1)**, select **gpt-4.1 (2)** from the results, and click **Confirm (3)**.

    ![](../Images/l4t3l4t2p5.png)

1. In the **Deploy gpt-4.1** window, type **gpt-4.1 (1)** in the **Deployment name** field, select **Global Standard (2)** under **Deployment type**, and click **Customize (3)** to modify the deployment settings.

    ![](../Images/l4t3l4t2p6.png)

1. Enter the following details, then click **Create (9)**:

    | Parameters                   | Values                                                     |
    | ---------------------------- | ---------------------------------------------------------- |
    | Model version upgrade policy | **Upgrade once new default version becomes available (4)** |
    | Model version                | **2025-04-14 (Default) (5)**                               |
    | Connected AI resource        | **Keep as Default (6)**               |
    | Tokens per Minute Rate Limit | **50K (7)**                                                |
    | Content filter               | **DefaultV2 (8)**                                          |

    ![](../Images/l4t3l4t2p7.png)

    > **Note**: Reducing the Tokens Per Minute (TPM) helps avoid over-using the quota available in the subscription you are using. 50,000 TPM is sufficient for the data used in this exercise.

## Task 3: Add data to your project

The data for your app consists of a set of travel brochures in PDF format from the fictitious travel agency *Margie's Travel*. Let's add them to the project.

1. In a new browser tab, go to [this link](https://github.com/MicrosoftLearning/mslearn-ai-studio/raw/main/data/brochures.zip) to download the zipped brochure archive from `https://github.com/MicrosoftLearning/mslearn-ai-studio/raw/main/data/brochures.zip`, then click **Open** to view it.

    ![](../Images/l4t3p1.png)

1. Press **Ctrl+A (1)** to highlight all the files, then select the **Compressed Folder Tools (2)** tab from the top menu bar.

    ![](../Images/l4t3p2.png)

1. Click **Extract all** to unpack the files. 

    ![](../Images/l4t3p3.png)

1. In the **Select a Destination and Extract Files** window, keep the default destination and click **Extract**.

    ![](../Images/l4t3p4.png)

    >**Note:** Make sure the folder name is  **brochures**.

1. In your Azure AI Foundry project, go to the navigation pane on the left, under **My assets**, open the **Data + indexes (1)** page, and click **+ New data (2)**.

    ![](../Images/l4t3p5.png)


1. In the **Add your data** wizard, open the **drop-down (1)** menu under Data source and choose **Upload files/folders (2)**.

    ![](../Images/l4t3p6.png)

1. Click **Upload files or folder (1)** and choose **Upload folder** from the drop-down menu.

    ![](../Images/l4t3p7.png)

1. In the **Select folder to upload** window, click **Downloads (1)** in the left pane, select the **brochures (2)** folder, and then click **Upload (3)**.

    ![](../Images/l4t3p8.png)

1. In the **Upload 6 files to this site?** dialog box, click **Upload**.

    ![](../Images/l4t3p9.png)

1. In the **Upload list (1)**, confirm that all files from the folder are listed, then click **Next**.

    ![](../Images/l4t3p10.png)
    
1. Set the **Data name** to **`brochures` (1)**, then click **Create (2)**.

    ![](../Images/l4t3p11.png)

1. Wait for the folder to be uploaded and note that it contains several .pdf files.

    ![](../Images/l4t3p12.png)

## Task 4: Create an index for your data

Now that you've added a data source to your project, you can use it to create an index in your Azure AI Search resource.

1. In Azure AI Foundry portal, in your project, in the navigation pane on the left, under **My assets**, select the **Data + indexes** page.
1. In the **Indexes** tab, add a new index with the following settings:
    - **Source location**:
        - **Data source**: Data in Azure AI Foundry
            - *Select the **brochures** data source*
    - **Index configuration**:
        - **Select Azure AI Search service**: *Create a new Azure AI Search resource with the following settings*:
            - **Subscription**: *You Azure subscription*
            - **Resource group**: *The same resource group as your AI hub*
            - **Service name**: *A valid name for your AI Search Resource*
            - **Location**: *The same location as your AI hub*
            - **Pricing tier**: Basic
            
            Wait for the AI Search resource to be created. Then return to the Azure AI Foundry and finish configuring the index by selecting **Connect other Azure AI Search resource** and adding a connection to the AI Search resource you just created.
 
        - **Vector index**: `brochures-index`
        - **Virtual machine**: Auto select
    - **Search settings**:
        - **Vector settings**: Add vector search to this search resource
        - **Azure OpenAI connection**: *Select the default Azure OpenAI resource for your hub.*
        - **Embedding model**: text-embedding-ada-002
        - **Embedding model deployment**: *Your deployment of the* text-embedding-ada-002 *model*

1. Create the vector index and wait for the indexing process to be completed, which can take a while depending on available compute resources in your subscription.

    The index creation operation consists of the following jobs:

    - Crack, chunk, and embed the text tokens in your brochures data.
    - Create the Azure AI Search index.
    - Register the index asset.

    > **Tip**: While you're waiting for the index to be created, why not take a look at the brochures you downloaded to get familiar with their contents?

## Task 5: Test the index in the playground

Before using your index in a RAG-based prompt flow, let's verify that it can be used to affect generative AI responses.

1. In the navigation pane on the left, select the **Playgrounds** page and open the **Chat** playground.
1. On the Chat playground page, in the Setup pane, ensure that your **gpt-4o** model deployment is selected. Then, in the main chat session panel, submit the prompt `Where can I stay in New York?`
1. Review the response, which should be a generic answer from the model without any data from the index.
1. In the Setup pane, expand the **Add your data** field, and then add the **brochures-index** project index and select the **hybrid (vector + keyword)** search type.

   > **Tip**: In some cases, newly created indexes may not be available right away. Refreshing the browser usually helps, but if you're still experiencing the issue where it can't find the index you may need to wait until the index is recognized.

1. After the index has been added and the chat session has restarted, resubmit the prompt `Where can I stay in New York?`
1. Review the response, which should be based on data in the index.

## Task 6: Create a RAG client app

Now that you have a working index, you can use the Azure OpenAI SDK to implement the RAG pattern in a client application. Let's explore the code to accomplish this in a simple example.

### Prepare the application configuration

1. Return to the browser tab containing the Azure portal (keeping the Azure AI Foundry portal open in the existing tab).
1. Use the **[\>_]** button to the right of the search bar at the top of the page to create a new Cloud Shell in the Azure portal, selecting a ***PowerShell*** environment with no storage in your subscription.

    The cloud shell provides a command-line interface in a pane at the bottom of the Azure portal. You can resize or maximize this pane to make it easier to work in.

    > **Note**: If you have previously created a cloud shell that uses a *Bash* environment, switch it to ***PowerShell***.

1. In the cloud shell toolbar, in the **Settings** menu, select **Go to Classic version** (this is required to use the code editor).

    **<font color="red">Ensure you've switched to the classic version of the cloud shell before continuing.</font>**

1. In the cloud shell pane, enter the following commands to clone the GitHub repo containing the code files for this exercise (type the command, or copy it to the clipboard and then right-click in the command line and paste as plain text):

    ```
    rm -r mslearn-ai-foundry -f
    git clone https://github.com/microsoftlearning/mslearn-ai-studio mslearn-ai-foundry
    ```

    > **Tip**: As you paste commands into the cloudshell, the output may take up a large amount of the screen buffer. You can clear the screen by entering the `cls` command to make it easier to focus on each task.

1. After the repo has been cloned, navigate to the folder containing the chat application code files:

    ```
   cd mslearn-ai-foundry/labfiles/rag-app/python
    ```

1. In the cloud shell command-line pane, enter the following command to install the OpenAI SDK library:

    ```
   python -m venv labenv
   ./labenv/bin/Activate.ps1
   pip install -r requirements.txt openai
    ```

1. Enter the following command to edit the configuration file that has been provided:

    ```
   code .env
    ```

    The file is opened in a code editor.

1. In the configuration file, replace the following placeholders: 
    - **your_openai_endpoint**: The Open AI endpoint from your project's **Overview** page in the Azure AI Foundry portal (be sure to select the **Azure OpenAI** capability tab, not the Azure AI Inference or Azure AI Services capability).
    - **your_openai_api_key** The Open AI API key from your project's **Overview** page in the Azure AI Foundry portal (be sure to select the **Azure OpenAI** capability tab, not the Azure AI Inference or Azure AI Services capability).
    - **your_chat_model**: The name you assigned to your **gpt-4o** model deployment, from the **Models + endpoints** page in the Azure AI Foundry portal (the default name is `gpt-4o`).
    - **your_embedding_model**: The name you assigned to your **text-embedding-ada-002** model deployment, from the **Models + endpoints** page in the Azure AI Foundry portal (the default name is `text-embedding-ada-002`).
    - **your_search_endpoint**: The URL for your Azure AI Search resource. You'll find this in the **Management center** in the Azure AI Foundry portal.
    - **your_search_api_key**: The API key for your Azure AI Search resource. You'll find this in the **Management center** in the Azure AI Foundry portal.
    - **your_index**: Replace with your index name from the **Data + indexes** page for your project in the Azure AI Foundry portal (it should be `brochures-index`).
1. After you've replaced the placeholders, in the code editor, use the **CTRL+S** command or **Right-click > Save** to save your changes and then use the **CTRL+Q** command or **Right-click > Quit** to close the code editor while keeping the cloud shell command line open.

### Explore code to implement the RAG pattern

1. Enter the following command to edit the code file that has been provided:

    ```
   code rag-app.py
    ```

1. Review the code in the file, noting that it:
    - Creates an Azure OpenAI client using the endpoint, key, and chat model.
    - Creates a suitable system message for a travel-related chat solution.
    - Submits a prompt (including the system and a user message based on the user input) to the Azure OpenAI client, adding:
        - Connection details for the Azure AI Search index to be queried.
        - Details of the embedding model to be used to vectorize the query\*.
    - Displays the response from the grounded prompt.
    - Adds the response to the chat history.

    \* *The query for the search index is based on the prompt, and is used to find relevant text in the indexed documents. You can use a keyword-based search that submits the query as text, but using a vector-based search can be more efficient - hence the use of an embedding model to vectorize the query text before submitting it.*

1. Use the **CTRL+Q** command to close the code editor without saving any changes, while keeping the cloud shell command line open.

### Run the chat application

1. In the cloud shell command-line pane, enter the following command to run the app:

    ```
   python rag-app.py
    ```

1. When prompted, enter a question, such as `Where should I go on vacation to see architecture?` and review the response from your generative AI model.

    Note that the response includes source references to indicate the indexed data in which the answer was found.

1. Try a follow-up question, for example `Where can I stay there?`

1. When you're finished, enter `quit` to exit the program. Then close the cloud shell pane.
