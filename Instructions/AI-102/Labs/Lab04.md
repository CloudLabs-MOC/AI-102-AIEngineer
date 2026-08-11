# Create a generative AI app that uses your own data

### Estimated Duration: 60 Minutes

## Overview

In this lab, you will use Microsoft Foundry to build a Retrieval Augmented Generation (RAG) solution that integrates your own data with a generative AI model. You’ll set up a hub and project, deploy embedding and generative models, upload PDF data, and create a vector index in Azure AI Search for semantic retrieval. You will then test the index in the Chat Playground and run a Python-based client app that uses the Azure OpenAI SDK and Azure AI Search to generate grounded responses from your dataset.

> **Note:** The code in this exercise is based on pre-release SDK software, which may be subject to change. Where necessary, we've used specific versions of packages, which may not reflect the latest available versions. You may experience some unexpected behavior, warnings, or errors.

## Lab Objectives

- **Task 1:** Create an Microsoft Foundry hub and project

- **Task 2:** Deploy models

- **Task 3:** Add data to your project

- **Task 4:** Create an index for your data

- **Task 5:** Test the index in the playground

- **Task 6:** Create a RAG client app

## Task 1: Create an Microsoft Foundry hub and project

In this task, you'll set up the Microsoft Foundry workspace by creating a hub and project. This will be the foundation for managing your models, data, and indexes.

1. Open a new tab in the browser, right-click on the following link [Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Microsoft Foundry portal**.

1. Click on **Sign in**.
 
    ![](../Images/lab1-03-0.png) 

1. If prompted, provide the credentials below:
 
   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
        ![](../Images/lab2a-03-11.png)

   - **Password:** <inject key="AzureAdUserPassword"></inject>
    
        ![](../Images/aifoundrysignin2.png)

1. In the browser, navigate to `https://ai.azure.com/managementCenter/allResources` and select **Create new**. 

    ![](../Images/lab3-03-1.png)

1. In the **Create Project** window, select the option to create a new **AI hub resource (1)**, then click **Next (2)**.

    ![](../Images/lab3-03-2.png)

1. In the **Create a project** wizard, enter **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** in the Project name field. Under the Hub field, click **Rename hub (2)** and specify **Myhub<inject key="DeploymentID" enableCopy="false"/> (3)** as the hub name. Then, and then click **Next (4)**.

    ![](../Images/lab3-03-3.png)

1. Expand the **Advanced options (1)** drop-down, specify the following settings for your project and click **Create (5)**.

    * Subscription: **Choose Default Subscription (2)**
    * Resource group: **AI-102-RG04 (3)**
    * Region: **<inject key="Region"></inject> (4)**

        ![](../Images/lab4-03-1.png)

1. Wait for your project to be created, and then navigate to your project.

    ![](../Images/lab4-03-2.png)

## Task 2: Deploy models

In this task, you'll deploy two models: an embedding model to convert text into vector format for searching, and a generative model to produce responses based on retrieved data.

You need two models to implement your solution:
    
- An **embedding** model to vectorize text data for efficient indexing and processing.
    
- A model that can generate natural language responses to questions based on your data.

1. In the **Foundry** portal, select **Model catalog (1)**, then open **Collections (2)**, enter **OpenAI (3)**, and select **Azure OpenAI (4)**.

    ![](../Images/lab4-03-3.png)

1. In the search box, enter **text-embedding-ada-002 (1)**, and then select **text-embedding-ada-002 (2)** from the results.

    ![](../Images/lab4-03-4.png)

1. On the **text-embedding-ada-002** model page, select **Use this model**.

    ![](../Images/lab4-03-5.png)

1. In the **Purchase options** pane, select **Direct from Azure models**.

    ![](../Images/lab4-03-6.png)

1. In the **Deploy text-embedding-ada-002** window, enter the following details, then select **Customize (3)**.

    - Deployment name: **text-embedding-ada-002 (1)**
    - Deployment type: **Global Standard (2)**

      ![](../Images/l4t2p3.png)

1. In the **Deployment details** section, fill in the following information, then click **Deploy (8)**.

    - Model version: **Select the default version (4)**
    - Connected AI resource: **Keep it default (5)**
    - Tokens per Minute Rate Limit (thousands): **50K (6)**
    - Content filter: **DefaultV2 (7)**

        ![](../Images/l4t2p4.png)

        > **Note:** If your current AI resource location doesn't have quota available for the model you want to deploy, you will be asked to choose a different location where a new AI resource will be created and connected to your project.

1. Return to the **Model catalog (1)**, search for **gpt-4.1 (2)** and select **gpt-4.1 (3)** from the results.

    ![](../Images/lab4-03-9.png)

1. On the **gpt-4.1** model page, select **Use this model**.

    ![](../Images/lab4-03-10.png)

1. In the **Deploy gpt-4.1** window, type **gpt-4.1 (1)** in the **Deployment name** field, select **Global Standard (2)** under **Deployment type**, and click **Customize (3)** to modify the deployment settings.

    ![](../Images/lab4-03-11.png)

1. Enter the following details, then click **Create (9):**

    | Parameters                   | Values                                                     |
    | ---------------------------- | ---------------------------------------------------------- |
    | Model version upgrade policy | **Upgrade once new default version becomes available (4)** |
    | Model version                | **2025-04-14 (Default) (5)**                               |
    | Connected AI resource        | **Keep as Default (6)**               |
    | Tokens per Minute Rate Limit | **50K (7)**                                                |
    | Content filter               | **DefaultV2 (8)**                                          |

    ![](../Images/l4t2p7.png)

    > **Note:** Reducing the Tokens Per Minute (TPM) helps avoid overusing the quota available in the subscription you are using. 50,000 TPM is sufficient for the data used in this exercise.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="c2ea45e9-f613-4bb8-afc5-ad28823e291d" />

## Task 3: Add data to your project

In this task, you'll upload a set of travel brochures in PDF format to your Microsoft Foundry project so they can be used as a knowledge source.

The data for your app consists of a set of travel brochures in PDF format from the fictitious travel agency **Margie's Travel**. Let's add them to the project.

1. In a new browser tab, go to [this link](https://github.com/MicrosoftLearning/mslearn-ai-studio/raw/main/data/brochures.zip) to download the zipped brochure archive from `https://github.com/MicrosoftLearning/mslearn-ai-studio/raw/main/data/brochures.zip`, then click **Open** to view it.

    ![](../Images/l4t3p1.png)

1. Press **Ctrl+A (1)** to highlight all the files, then select the **Compressed Folder Tools (2)** tab from the top menu bar.

    ![](../Images/l4t3p2.png)

1. Click **Extract all** to unpack the files. 

    ![](../Images/l4t3p3.png)

1. In the **Select a Destination and Extract Files** window, keep the default destination and click **Extract**.

    ![](../Images/l4t3p4.png)

    >**Note:** Make sure the folder name is  **brochures**.

1. In your Microsoft Foundry project, go to the navigation pane on the left, under **My assets**, open the **Data + indexes (1)** page, and click **+ New data (2)**.

    ![](../Images/lab4-03-12.png)

1. In the **Add your data** wizard, open the **drop-down (1)** menu under Data source and choose **Upload files/folders (2)**.

    ![](../Images/l4t3p6.png)

1. Click **Upload files or folder (1)** and choose **Upload folder (2)** from the drop-down menu.

    ![](../Images/l4t3p7.png)

1. In the **Select folder to upload** window, click **Downloads (1)** in the left pane, select the **brochures (2)** folder, and then click **Upload (3)**.

    ![](../Images/l4t3p8.png)

1. In the **Upload 6 files to this site?** dialog box, click **Upload**.

    ![](../Images/l4t3p9.png)

1. In the **Upload list (1)**, confirm that all files from the folder are listed, then click **Next (2)**.

    ![](../Images/l4t3p10.png)
    
1. Set the **Data name** to **`brochures` (1)**, then click **Create (2)**.

    ![](../Images/l4t3p11.png)

1. Wait for the folder to be uploaded and note that it contains several .pdf files.

    ![](../Images/lab4-03-13.png)

## Task 4: Create an index for your data

In this task, you'll create a vector index in Azure AI Search from the uploaded brochures. This index will enable efficient retrieval of relevant content during a query.

1. In the Microsoft Foundry portal, in your project, in the navigation pane on the left, under **My assets**, select the **Data + indexes (1)** page and in the **Indexes (2)** tab, click on **+ New index (3)**.

    ![](../Images/lab4-03-14.png)

1. In the **Create a vector index** window, under the **Source location** section, open the Data source dropdown, select **Data in Microsoft Foundry (1)**, choose the **brochures (2)** data source, and click **Next (3)**.

    ![](../Images/l4t4p2.png)

1. In the **Index configuration** section, under **Select Azure AI Search service** click on **Create a new Azure AI Search resource (1)** link.

    ![](../Images/l4t4p3.png)

1. A new browser tab will open, taking you to the **Create a search service** page in the Azure portal. Enter the following details, then click **Review + create (6):**

    * Subscription: **Default (1)**
    * Resource group: **AI-102-RG04 (2)**
    * Service name: **mysearchservice<inject key="DeploymentID"></inject> (3)**
    * Location: **<inject key="Region"></inject> (4)**
    * Pricing tier: **Basic (5)**

        ![](../Images/l4t4p4.png)

        > **Note:** You can change the pricing tier by clicking the **Change Pricing Tier** link in the Pricing tier section.
    
1. On the **Create a search service** page, click on **Create**.

    ![](../Images/l4t4p5.png)

1. Wait for the AI Search resource to be created, then go back to Microsoft Foundry. To finish configuring the index, open the **dropdown (1)** and select **Connect other Azure AI Search resource (2)**.

    ![](../Images/l4t4p6.png)

1. In the **Connect an existing resource** section, confirm that the displayed resource is the one you created, then click **Add connection**.

    ![](../Images/l4t4p7.png)

1. In the **Index configuration** section, under **Select Azure AI Search service**, choose **mysearchservice (1)**, then enter the following details and click **Next (4)**.
 
    - Vector index: **`brochures-index` (2)**
    - Virtual machine: **Auto select (3)**

        ![](../Images/l4t4p8.png)

1. In the **Search settings** section, review the settings, keep them as the default, and click **Next**.

    ![](../Images/l4t4p9.png)

1. In the **Review and finish** section, click **Create vector index**.

    ![](../Images/l4t4p10.png)

1. Create the vector index and wait for the indexing process to be completed, which can take a while depending on available compute resources in your subscription.

    ![](../Images/lab4-03-16.png)

    > **Note:** The indexing process may take 4-5 minutes to complete.

## Task 5: Test the index in the playground

In this task, you'll verify that your index is working by running queries in the Chat Playground, both with and without the index, to compare responses.

1. In the navigation pane on the left, select the **Playgrounds (1)** page and click **Try the Chat playground (2)**.

    ![](../Images/lab4-03-17.png)

1. On the Chat playground page, in the **Setup** pane, make sure your **gpt-4.1 (1)** model deployment is selected. In the main chat panel, enter the prompt **`Where can I stay in New York?` (2)**, then press **Enter** or click the **> icon (3)** to send it.

    ![](../Images/lab4-03-18.png)

1. Review the response, which should be a generic answer from the model without any data from the index.

     ![](../Images/l4t5p2.1.png)

1. In the Setup pane, expand the **Add your data** field, open the **drop-down (1)**, and select the **brochures-index (2)** project index.

    ![](../Images/l4t5p3.png)

1. In the Search type: select the **Hybrid (vector + keyword)**.

    ![](../Images/l4t5p4.png)

    > **Note:** In some cases, newly created indexes may not be available right away. Refreshing the browser usually helps, but if you're still experiencing the issue where it can't find the index, you may need to wait until the index is recognized.

1. After the index has been added and the chat session has restarted, resubmit the prompt `Where can I stay in New York?`

1. Review the response, which should be based on data in the index.

    ![](../Images/lab4-03-19.png)

## Task 6: Create a RAG client app

In this task, you'll configure and run a Python-based client application that uses the Azure OpenAI SDK and Azure AI Search to provide grounded responses from your dataset.

### Task 6.1 Prepare the application configuration

1. Open a new browser tab (keeping the Microsoft Foundry portal open in the existing tab). Then in the new tab, browse to the [Azure portal](https://portal.azure.com) at `https://portal.azure.com`.

1. If prompted, provide the credentials below:

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

    - **Password:** <inject key="AzureAdUserPassword"></inject> 

1. On the **Azure portal** homepage, click the **\[>\_] Cloud Shell (1)** button located to the right of the **Copilot** tab at the top. This opens a new Cloud Shell session. In the **Welcome to Azure Cloud Shell** window, choose **PowerShell (2)**.

    ![](../Images/l2at2p3.png)

    >**Note:** The cloud shell provides a command-line interface in a pane at the bottom of the Azure portal. You can resize or maximize this pane to make it easier to work in.

    > **Note:** If you have previously created a cloud shell that uses a **Bash** environment, switch it to **PowerShell**.

1. In the **Getting started** window, ensure **No storage account required (1)** is selected. From the **Subscription** drop-down, choose **Default subscription (2)**, then click **Apply (3)**.

    ![](../Images/l2at2p4.png)

1. In the Cloud Shell toolbar, open the **Settings (1)** menu and choose **Go to Classic version (2)** from the drop-down.

    ![](../Images/l2at2p5.png)

1. In the cloud shell pane, enter the following commands to clone the GitHub repo containing the code files for this exercise (type the command, or copy it to the clipboard and then right-click in the command line and paste as plain text):

    ![](../Images/lab4-03-20.png)

    ```
    rm -r mslearn-ai-foundry -f
    git clone https://github.com/microsoftlearning/mslearn-ai-studio mslearn-ai-foundry
    ```

    > **Note:** As you paste commands into the cloudshell, the output may take up a large amount of the screen buffer. You can clear the screen by entering the `cls` command to make it easier to focus on each task.

1. After the repo has been cloned, navigate to the folder containing the chat application code files:

    ![](../Images/l4t6p2.png)

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

    ![](../Images/l4t6p3.png)

    ```
    code .env
    ```

    >**Note:** The file is opened in a code editor.

1. In the configuration file, replace the following placeholders: 

    - **your_openai_endpoint:** From your project's **Overview (1)** page in the Microsoft Foundry portal, open the **Azure OpenAI (2)** capability tab and click the **Copy Azure OpenAI endpoint (3)** icon.

    - **your_openai_api_key:** From your project's **Overview** page in the Microsoft Foundry portal, go to the **Azure OpenAI** capability tab and click the **Copy API Key (4)** icon.

        ![](../Images/lab4-03-21.png)

    - **your_chat_model:** From the **Models + endpoints (1)** page in the Microsoft Foundry portal, copy the name **`gpt-4.1` (2)** of your **gpt-4.1** model deployment.

    - **your_embedding_model:** From the **Models + endpoints** page in the Microsoft Foundry portal, copy the name **`text-embedding-ada-002` (3)** of your **text-embedding-ada-002** model deployment.

        ![](../Images/lab4-03-22.png)

    - **your_search_endpoint:** To get the URL for your Azure AI Search resource, go to the **Management center**, select **Connected resources (1)** click on the service name (for example, **mysearchservice (2)**) to open its details pane, copy the **Target** URL..

        ![](../Images/l4t6p8.png)

        ![](../Images/lab4-03-23.png)

        ![](../Images/lab4-03-24.png)

        > **Note:** If the endpoint URL is not visible in the list of connected resources, click on the service name (for example, **mysearchservice**) to open its details pane. From there, copy the **Target** URL.

    - **your_search_api_key:** To get the API key for your Azure AI Search resource, go to the **Management center**, select **Connected resources (1)** under Project, and click **Copy API keys (2)** for the **Azure AI Search**.
    
        ![](../Images/l4t6p8.png)

        ![](../Images/lab4-03-25.png)

    - **your_index:** Replace with your index name from **Data + indexes (1)**, and copy **`brochures-index` (2)** from the **Names** column.

        ![](../Images/lab4-03-26.png)

1. After entering all these values, your `.env` file should look like this.

    ![](../Images/l4t6p11.png)

1. After you've replaced the placeholders, in the code editor, use the **CTRL+S** command or **Right-click > Save** to save your changes and then use the **CTRL+Q** command or **Right-click > Quit** to close the code editor while keeping the cloud shell command line open.

### Task 6.2 Explore code to implement the RAG pattern

1. Enter the following command to edit the code file that has been provided:

    ![](../Images/l4t6p12.png)

    ```
    code rag-app.py
    ```

1. Review the code in the file, noting that it:
    - Creates an Azure OpenAI client using the endpoint, key, and chat model.
    - Creates a suitable system message for a travel-related chat solution.
    - Submits a prompt (including the system and a user message based on the user input) to the Azure OpenAI client, adding:
        - Connection details for the Azure AI Search index to be queried.
        - Details of the embedding model to be used to vectorize the query.
    - Displays the response from the grounded prompt.
    - Adds the response to the chat history.

     The query for the search index is based on the prompt, and is used to find relevant text in the indexed documents. You can use a keyword-based search that submits the query as text, but using a vector-based search can be more efficient - hence the use of an embedding model to vectorize the query text before submitting it.

1. Use the **CTRL+Q** command to close the code editor without saving any changes, while keeping the cloud shell command line open.

### Task 6.3 Run the chat application

1. In the cloud shell command-line pane, enter the following command to run the app:

    ```
   python rag-app.py
    ```

1. When prompted, enter a question, such as `Where should I go on vacation to see architecture?` and review the response from your generative AI model.

    ![](../Images/lab4-03-27.png)

    >**Note:** The response includes source references to indicate the indexed data in which the answer was found.

1. Try a follow-up question, for example, `Where can I stay there?`

    ![](../Images/lab4-03-28.png)

1. When you're finished, enter `quit` to exit the program. Then close the cloud shell pane.

## Summary

By completing this lab, you learned how to:

* Create an Microsoft Foundry hub and project to organize AI resources.
* Deploy an embedding model and a generative model in Microsoft Foundry.
* Upload custom PDF data to your project for use in AI applications.
* Create a vector index in Azure AI Search to enable semantic and keyword-based retrieval.
* Test the index in the Chat Playground to compare responses with and without data grounding.
* Configure and run a Python-based RAG client application using the Azure OpenAI SDK and Azure AI Search.

## You have successfully completed the Hands-on Lab!


