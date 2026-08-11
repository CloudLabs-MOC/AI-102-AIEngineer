# Use Azure Speech in an agent

### Estimated Duration: 45 Minutes

## Lab Overview

In this lab, you will create and configure an AI agent in Microsoft Foundry integrated with Azure Speech capabilities. You will enable the agent to generate speech from text and transcribe audio using the Azure Speech MCP tool. Finally, you will build and test a Python client application to interact with the agent and perform speech-based tasks.

## Lab Objectives

- **Task 1:** Create an Azure storage account

- **Task 2:** Create a Microsoft Foundry project

- **Task 3:** Create an agent

- **Task 4:** Create an Azure Speech in Foundry Tools connection

- **Task 5:** Test the Azure Speech tool in the playground

- **Task 6:** Create a client application

- **Task 7:** Test the client application

> **Note:** Some of the technologies used in this exercise are in preview or in active development. You may experience some unexpected behavior, warnings, or errors.

## Task 1: Create an Azure storage account

In this task, you will create an Azure Storage account and configure a blob container to store generated audio files. You will also generate a SAS token and URL for secure access.

1. Open the [Azure portal](https://portal.azure.com) at `https://portal.azure.com`, and sign in using your Azure credentials.

1. In the Azure Portal tab, in the top search bar, search for **Storage accounts (1)** and select **Storage accounts (2)** from the services section.

    ![](../Images/lab9-s29.png)

1. In the **Storage center | Blob Storage** page, select **+ Create** to start creating a new storage account.

    ![](../Images/lab9-s13.png)

1. Create a storage account with the following settings and click **Review + create (9)**
    - **Subscription:** Select default subscription **(1)**
    - **Resource group:** Select **AI-102-RG22 (2)**
    - **Storage account name:** **stg<inject key="DeploymentID" enableCopy="false"/> (3)**
    - **Region:** Select **<inject key="Region" enableCopy="false" /> (4)**
    - **Preferred storage type:** Azure Blob Storage or Azure Data Lake Storage Gen 2 **(5)**
    - **Performance:** Standard **(7)**
    - **Redundancy:** Locally-redundant storage (LRS) **(8)**

      ![](../Images/lab22-01.png) 

1. On the **Review + create** tab, select **Create**.

    ![](../Images/lab22-02.png)

1. When the deployment is complete and the **Your deployment is complete** message appears, select **Go to resource**.

    ![](../Images/lab22-03-04.png)

1. In the storage account page, expand **Data storage (1)**, select **Containers (2)**, and then click **+ Add container (3)**.

    ![](../Images/lab22-03-05.png)

1. In the **New container** pane, enter `files` in the **Name (1)** field, and then select **Ok (2)**.

    ![](../Images/lab22-03-06.png)

1. In the **files** container, select the **ellipsis (…) (1)**, and then click **Generate SAS (2)**.

    ![](../Images/lab22-03-07.png)

1. In the **Generate SAS** pane, create a SAS token with the following details and then click **Generate SAS token and URL (7)**.

    - **Signing method:** Account key **(1)**
    - **Signing key:** Key1 **(2)**
    - **Stored access policy**: None **(3)**
    
    - **Permissions (4)**:
        - Read
        - Add
        - Create
        - Write
        - List
    - **Start and expiry date/time**:
        - **Start**: The current date and time
        - **Expiry**: 11:59pm tomorrow **(5)**
    
    - **Allowed IP addresses**: Leave blank
    - **Allowed protocols**: HTTPS only **(6)**

      ![](../Images/lab22-03-08.png)

1. In the **Generate SAS** pane, copy the **Blob SAS URL**, and store them in a notepad for later use.

    ![](../Images/lab22-03-new.png)

    > **IMPORTANT:** Copy the generated SAS token and URL, and store them in a text file for now - you'll need them later!

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="a3baa332-f98b-419d-8e04-a73f92beb805" />

## Task 2: Create a Microsoft Foundry project

In this task, you will create a new project in the Microsoft Foundry portal and configure its basic settings for AI development.

1. Open a new tab in the browser, right-click on the following link [Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Microsoft Foundry portal**.

1. Click on **Sign in**.
 
    ![](../Images/lab1-s2.png)

1. If prompted, provide the credentials below:
 
    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
      ![](../Images/lab2a-03-11.png)

    - **Password:** <inject key="AzureAdUserPassword"></inject>
    
      ![](../Images/lab1-s4.png)

1. When the **Stay signed in?** window appears, select **No**.

    ![](../Images/lab1-s5.png)
    
    >**Note:** Close any tips or quick start panes that are opened the first time you sign in, and if necessary use the **Foundry** logo at the top left to navigate to the home page, which looks similar to the following image (close the **Help** pane if it's open):

1. At the top of the **Microsoft Foundry** portal, enable the **New Foundry toggle (1)** to switch to the latest Foundry user interface.

1. From the **Select a project to continue** dialog, click the drop-down under **Select or search for a project**, and then select **Create a new project (2)**.

     ![](../Images/lab1-s6.png)

1. In the **Create a project** window, enter **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** as the project name. Open the **Advanced options (2)** drop-down, fill in the following details, and then click **Create (6)**:

    * Subscription: **Choose Default Subscription (3)**
    * Resource group: **AI-102-RG22 (4)**
    * Microsoft Foundry resource: **Keep as Default**
    * Region: **<inject key="Region" enableCopy="false" /> (5)**

      ![](../Images/lab22-03-10.png)

      >**Note:** Some Azure AI resources are constrained by regional model quotas. In the event of a quota limit being exceeded later in the exercise, there's a possibility you may need to create another resource in a different region.

1. Wait for your project created. It may take a few minutes.

1. On the home page for your project, note that the **API key** and **project endpoint**, are displayed here.

    ![](../Images/lab19dev-p2t1p3.png)

    > **TIP:** Copy the project key to the clipboard - you're going to need it later!

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="9ff1f50a-1fb6-4172-b300-894e2d3bae77" />

## Task 3: Create an agent

In this task, you will create and configure an AI agent in Foundry, define its instructions, and test its basic functionality.

1. In the **Start building (1)** menu, select **Create agents (2)**.

    ![](../Images/lab19dev-p2t2p1.png)

1. When prompted, name the agent `speech-agent` **(1)** and then click **Create (2)**. 

    ![](../Images/lab22-03-11.png)

1. When ready, your agent opens in the agent playground.

1. In the model drop-down list, ensure that a **gpt-4.1 (1)** model has been deployed and selected for your agent.

1. Assign your agent the following **Instructions (2)**:

    ```
   You are an AI agent that uses the Azure AI Speech tool to transcribe and generates speech.
    ```

1. Use the **Save (3)** button to save the changes.

    ![](../Images/lab22-03-12.png)

1. Test the agent by entering the following prompt in the **Chat** pane:

    ```
   What can you help me with?
    ```

    ![](../Images/lab22-03-13.png)

1. The agent should respond with an appropriate answer based on its instructions.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="e9f2981c-8264-4b9d-a334-574ef989e384" />

## Task 4: Create an Azure Speech in Foundry Tools connection

In this task, you will connect the Azure Speech MCP server tool to your Foundry project and associate it with your agent.

1. In the left navigation pane, select **Tools (1)**, and then click **Connect a tool (2)**.

    ![](../Images/lab22-03-14.png)

1. In the **Select a tool** pane, search for **Azure Speech (1)**, scroll down and select **Azure Speech MCP Server (2)**, and then click **Create (3)**.

    ![](../Images/lab22-03-31.png)

1. In the **Connect the Azure Speech MCP Server tool** pane, specify the following configuration and click on **Connect (4)**
    
    - **Foundry resource name**: **Myproject<inject key="DeploymentID" enableCopy="false"/>-resource (1)**
    - **Authentication**: Key-based
    - **Bearer** (**Ocp-Apim-Subscription-Key**): The key for your Foundry project **(2)**
    - **X-Blob-Container-Url**: The SAS URL for your storage container **(3)**

      ![](../Images/lab22-03-17.png)

    > **Note:** If key-based authentication is disabled by a policy in your Azure subscription, you can use Entra ID authentication to connect the agent to the Azure Language service.

1. Wait for the MCP tool connection to be created, and then view its details page.

1. On the details page for the Azure Speech MCP Server connection, select **Use in an agent (1)**, and then select the **Speech-Agent (2)** agent.

    ![](../Images/lab22-03-19.png)

    The agent should open in the playground, with the Azure Speech in Foundry Tools tool connected.

## Task 5: Test the Azure Speech tool in the playground

In this task, you will test the agent’s ability to generate speech from text and transcribe audio using the Azure Speech tool.

1. In the agent playground for the **speech-agent** agent, enter the following prompt:

    ```
    Generate "To be or not to be, that is the question." as speech
    ```

    ![](../Images/lab22-03-20.png)

1. When prompted, select **Approve (1)**, and then choose **Always approve all Azure Speech MCP Server tools (2)**.

    ![](../Images/lab22-03-21.png)

1. Review the response, which should include a link to the generated audio file. Then click the link to hear the synthesized speech.

    ![](../Images/lab22-03-32.png)

    ![](../Images/lab22-03-33.png)

1. Enter the following prompt:

    ```
    Transcribe the file at https://microsoftlearning.github.io/mslearn-ai-language/Labfiles/05-speech-tool/speech_1.wav
    ```

1. If prompted, approve use of the Azure Speech tool by selecting **Always approve all Azure Speech MCP Server tools**.

1. Review the output, which should be a transcription of the audio file.

    ![](../Images/lab22-03-34.png)

## Task 6: Create a client application

Now that you have a working agent, you can create a client application that uses it.

### Task 6.1 Get the application files from GitHub

In this task, you will clone the required repository and access the application files in Visual Studio Code.

1. Open the **Visual Studio Code** from the desktop.

    ![](../Images/lab9-p2t1p1.png)

1. In Visual Studio Code, select **Extensions (1)** from the left pane, search for **Python (2)**, choose the **Python (3)** extension by Microsoft, and then click **Install (4)**.

    ![](../Images/lab18-03-2.png)

1. Navigate to the **Welcome** page in VS Code by selecting the ellipsis **(...) (1)** from the top bar, then **Help (2)**, and finally **Welcome (3)**.

    ![](../Images/lab18-03-3.png)

1. On the **Get Started** page, select **Mark Done** to complete this step and proceed.

    ![](../Images/lab9-p2t4p2.png)

1. Select **Clone Git Repository... (1)**, paste the repository URL **(2)** `https://github.com/microsoftlearning/mslearn-ai-language`, and then choose **Clone from URL (3)** to proceed.

    ![](../Images/lab18-03-4.png)

1. Select the destination folder **C:\LabFiles (1)** and click **Select as Repository Destination (2)** to proceed.

    ![](../Images/lab9-p2t4p4.png)

1. When prompted, select **Open** to open the cloned repository.

    ![](../Images/lab9-p2t4p5.png)

1. In the trust prompt, select **Yes, I trust the authors (1)** to continue.

    ![](../Images/lab18-03-5.png)

1. After the repo has been cloned, in the Explorer pane, expand the folder **Labfiles** → **05-speech-tool/Python** select **speech-client**. The application files include: 

    - **.env** (the application configuration file)
    - **requirements.txt** (the Python package dependencies that need to be installed)
    - **speech-client.py** (the code file for the application)

        ![](../Images/lab22-03-22.png)

### Task 6.2: Configure the application

In this task, you will set up the Python environment, install dependencies, and update configuration settings.

1. Right-click on the **requirements.txt (1)** file under **speech-client** folder and select **Open in Integrated Terminal (2)**.

    ![](../Images/lab22-03-23.png)

1. In the terminal, enter the following command to install the required Python packages in a virtual environment:

    ```
    python -m venv labenv
    .\labenv\Scripts\Activate.ps1
    pip install -r requirements.txt
    ```

1. In the **Explorer** pane, in the **speech-client** folder, select the **.env (1)** file to open it. Then update the configuration values to include your project **endpoint (2)** (from the project home page in Foundry Portal)and the name of your agent (which should be **Speech-Agent (3)** - note that this name is case-sensitive).

    ![](../Images/lab22-03-24.png)

1. Once done, press **Ctrl+S** to save the changes.

### Task 6.3: Implement application code

In this task, you will add the required code to connect to your Foundry agent and handle user prompts.

1. In the **Explorer** pane, in the **speech-client** folder,  open the **speech-client.py** file.

    ![](../Images/lab22-03-25.png)

1. Review the existing code. You will add code to submit prompts to your agent.

    > **Tip**: As you add code to the code file, be sure to maintain the correct indentation.

1. At the top of the code file, under the existing namespace references, find the comment **Import namespaces** and add the following code to import the namespaces you will need:

    ```python
   # import namespaces
   from azure.identity import DefaultAzureCredential
   from azure.ai.projects import AIProjectClient
    ```

    ![](../Images/lab22-03-26.png)

1. In the **main** function, note that code to load the endpoint and key from the configuration file has already been provided. Then find the comment **Get project client**, and add the following code to create a client for your Foundry project:

    ```python
   # Get project client
   project_client = AIProjectClient(
        endpoint=foundry_endpoint,
        credential=DefaultAzureCredential(),
   )
    ```

    ![](../Images/lab22-03-27.png)

1. Find the comment **Get an OpenAI client**, and add the following code to get an OpenAI client with which to call your agent.

    ```python
   # Get an OpenAI client
   openai_client = project_client.get_openai_client()
    ```

    ![](../Images/lab22-03-28.png)

1. Find the comment **Use the agent to get a response**, and add the following code to submit a user prompt to your agent, and display the response.

    ```python
    # Use the agent to get a response
    response = openai_client.responses.create(
         input=[{"role": "user", "content": prompt}],
         extra_body={"agent_reference": {"name": agent_name, "type": "agent_reference"}},
    )

    print(f"{agent_name}: {response.output_text}")
    ```

     ![](../Images/lab22-03-30.png)

1. Save the changes to the code file by pressing **Ctrl+S**. 

## Task 7: Test the client application

In this task, you will run the Python application, authenticate with Azure, and test speech generation and transcription through the agent.

1. In the Visual Studio Code terminal, enter the following command to sign into Azure

    ```powershell
     az login
     ```
     > **Note:** Minimize the VS Code to see the **Sign in** window.

1. In the **Sign in** window, select **Work or school account** **(1)**, and then select **Continue** **(2)**.

    ![](../Images/lab19dev-p2t6p17.png)

1. On the **Sign in** page, provide the credentials below:
 
    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
      ![](../Images/lab7-s6.png)

    - **Password:** <inject key="AzureAdUserPassword"></inject>
    
      ![](../Images/lab7-s7.png)

1. When prompted, select **Yes** to sign in to all apps and websites on this device.

    ![](../Images/lab19dev-p2t6p18.png)

1. On the **Account added to this device** window, select **Done** to complete the sign-in process.

    ![](../Images/lab19dev-p2t6p19.png)

1. In the Visual Studio Code terminal, press **Enter** to select the default subscription.

1. After you have signed in, enter the following command to run the application:

    ```powershell
    python speech-client.py
    ```

1. When prompted, enter the following prompt:

    ```
    Synthesize "Better a witty fool, than a foolish wit!" as speech using the voice "en-GB-SoniaNeural".
    ```

    ![](../Images/lab22-03-35.png)

1. Review the response, which should include a clickable link to the generated audio file, and then press **Ctrl + Click** on the link to open and play it.

    ![](../Images/lab22-03-36.png)

1. In the prompt dialog, select **Open** to open the generated audio file in the browser.

    ![](../Images/lab22-03-37.png)

    ![](../Images/lab22-03-38.png)

1. After checking out the generated audio file, enter the following prompt:

     ```
     Transcribe https://microsoftlearning.github.io/mslearn-ai-language/Labfiles/05-speech-tool/speech_2.wav
     ```

1. Review the response.

    ![](../Images/lab22-03-39.png)

## Summary

In this lab, you created an Azure Storage account and a Microsoft Foundry project to support speech-enabled AI scenarios. You built and configured an agent, and connected it to the Azure Speech MCP tool to enable speech synthesis and transcription. You tested these capabilities in the Foundry playground. Finally, you developed and ran a Python client application to interact with the agent and perform speech-based tasks.

## You have successfully completed the Hands-on Lab!
