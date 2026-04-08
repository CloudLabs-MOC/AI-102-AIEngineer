# Lab 2a: Create a generative AI chat app

### Estimated Duration : 45 Minutes

## Overview

In this lab, you will build a generative AI chat application using Microsoft Foundry. You’ll start by deploying the gpt-4.1 model in a new project, then set up a client application in Cloud Shell to interact with the deployed model. Next, you’ll configure environment variables and update Python code to connect to your project and maintain chat history. Finally, you’ll run the application to test real-time conversations with the model, gaining hands-on experience in integrating Azure AI into custom apps.

## Lab Objectives

- **Task 1:** Deploy a model in an Foundry project

- **Task 2:** Create a client application to chat with the model

- **Task 3:** Write code to connect to your project and chat with your model

## Task 1: Deploy a model in an Foundry project

In this task, you’ll sign in to the Microsoft Foundry portal, locate the **gpt-4.1** model, and create a new project using it. You’ll configure the subscription, resource group, AI Foundry resource, and region, then verify the project and model deployment in the portal.

1. Open a new tab in the browser, right-click on the following link [Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Microsoft Foundry portal**.

1. Click on **Sign in**.
 
    ![](../Images/lab1-03-0.png) 

1. If prompted, provide the credentials below:
 
   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
        ![](../Images/lab2a-03-11.png)

   - **Password:** <inject key="AzureAdUserPassword"></inject>
    
        ![](../Images/aifoundrysignin2.png)

1. In the home page, in the **Explore models and capabilities** section, search for the **`gpt-4.1`** model **(1)** and select **`gpt-4.1`** **(2)**  which we'll use in our project.    

   ![](../Images/lab2-03-1.png) 

1. At the top of the page for the model, select **Use this model**.

    ![](../Images/lab2-03-20.png)

 1. In the **Select your project** dialog, click **Create a new project (2)** to start a new Microsoft Foundry project.

    ![](../Images/lab2-03-21.png)

1. In the **Create a new project** window, enter **Myproject<inject key="DeploymentID"></inject> (1)** as the project name. Open the **Advanced options (2)** drop-down, fill in the following details, and then click **Create and continue (6)**:

    * Subscription: **Choose Default Subscription (3)**
    * Resource group: **AI-102-RG2a (4)**
    * Region: **<inject key="Region"></inject> (5)**

        ![](../Images/lab2a-03-1.png)
        
        >**Note:** Some Azure AI resources are constrained by regional model quotas. In the event of a quota limit being exceeded later in the exercise, there's a possibility you may need to create another resource in a different region.
        
        >**Note:** The creation of project can take few minutes to complete.

1. On the **Deploy gpt-4.1** page, select Deployment type as **Global Standard (1)** and then **Deploy (2)**.

    ![](../Images/lab2a-03-2.png)

1. When your project is created, the chat playground will be opened automatically so you can test your model (if not, in the task pane on the left, select **Playgrounds (1)** and then open the **Chat playground (2)**).

    ![](../Images/lab2a-03-3.png)

1. In the **Setup** pane, check the name of your model deployment, it should be **gpt-4.1**.

    ![](../Images/l2at1p9.png)

1. You can verify the model deployment by opening the **Models + endpoints (1)** page from the left navigation pane.

    ![](../Images/lab2a-03-4.png)

1. On the **Overview (1)** page in the Microsoft Foundry portal, locate the **Endpoints and keys** section. Select the **Azure OpenAI (2)** library, then **Copy Azure OpenAI endpoint (3)**. This endpoint will be used to connect your client application to your project and model.

    ![](../Images/lab2a-03-10.png)

    > **Note:** Save this endpoint in a notepad for future reference.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="c63cb22f-4418-42b9-99d1-b8e2e77ffa79" />

## Task 2: Create a client application to chat with the model

In this task, you’ll connect your deployed Azure OpenAI model to a Python-based chat application by retrieving the project endpoint, cloning the sample code repository, configuring environment variables, and installing the required SDKs. This will allow you to interact with the model directly from your client application.

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

    >**Note:** Ensure you've switched to the classic version of the cloud shell before continuing.

1. In the Cloud Shell pane, run the following commands to clone the GitHub repository with the code files for this exercise. You can type the command directly, or copy it to the clipboard, then right-click in the command line and paste it as plain text.

    ```
    rm -r mslearn-ai-foundry -f
    git clone https://github.com/microsoftlearning/mslearn-ai-studio mslearn-ai-foundry
    ```

    ![](../Images/lab2a-03-6.png)

1. Once the repository is cloned, go to the folder with the chat application code files and open them to view their contents.

    ```
    cd mslearn-ai-foundry/labfiles/chat-app/python
    ls -a -l
    ```

    ![](../Images/l2at2p7.png)

1. The folder contains a code file as well as a configuration file for application settings and a file defining the project runtime and package requrirements.

1. In the Cloud Shell command-line pane, run the following command to install the required libraries.

    ```
    python -m venv labenv
    ./labenv/bin/Activate.ps1
    pip install -r requirements.txt azure-identity azure-ai-projects openai
    ```

1. Run the following command to open the provided configuration file in a code editor for editing.

    ```
    code .env
    ```

    ![](../Images/l2at2p8.png)

1. In the code file, replace the placeholder values with the correct details for your project:

    * your\_project\_endpoint: **Azure OpenAI endpoint (1)**
    * your\_model\_deployment: **gpt-4.1 (2)**

        ![](../Images/lab2a-03-07.png)

        > **Note:** Paste the Azure OpenAI endpoint you copied in the previous task.

1. After replacing the placeholders, save your changes in the code editor using **CTRL+S** or **Right-click > Save**. Then close the editor with **CTRL+Q** or **Right-click > Quit**, leaving the Cloud Shell command line open.

## Task 3: Write code to connect to your project and chat with your model

In this task, you’ll modify the provided Python chat application to connect to your deployed Azure OpenAI model. You’ll add the necessary SDK imports, initialize the Microsoft Foundry client, set up a system prompt, handle user input in a loop, and return model responses while maintaining conversation history. Finally, you’ll run and test the application by chatting with your model from the Cloud Shell environment.

1. Run the following command to open the provided code file for editing.

    ![](../Images/l2at3p1.png)

    ```
    code chat-app.py
    ```

1. In the code file, review the existing import statements at the top that bring in the required SDK namespaces. Then, locate the comment **Add references** and insert the following code to include the namespaces from the libraries you installed earlier:

    ![](../Images/l2at3p2.png)

    ```python
    # Add references
    from azure.identity import DefaultAzureCredential
    from azure.ai.projects import AIProjectClient
    from openai import AzureOpenAI
    ```

1. In the **main** function, under the comment **Get configuration settings**, observe that the code retrieves the project connection string and model deployment name values from the configuration file.

    ![](../Images/l2at3p3.png)

1. Find the comment **Initialize the project client**, and add the following code to connect to your Foundry project:

    ![](../Images/l2at3p4.png)

    ```python
   # Initialize the project client
   project_client = AIProjectClient(            
        credential=DefaultAzureCredential(
            exclude_environment_credential=True,
            exclude_managed_identity_credential=True
        ),
        endpoint=project_endpoint,
    )
    ```

    > **Note:** Be careful to maintain the correct indentation level for your code.

1. Find the comment **Get a chat client**, and add the following code to create a client object for chatting with a model:

    ![](../Images/lab2a-03-12.png)

    ```python
   # Get a chat client
   openai_client = project_client.get_openai_client()
    ```

1. Locate the comment **Initialize prompt with system message** and insert the following code to set up a message collection starting with a system prompt.

    ![](../Images/l2at3p6.png)

    ```python
   # Initialize prompt with system message
   prompt = [
            {"role": "system", "content": "You are a helpful AI assistant that answers questions."}
        ]
    ```

1. Note that the code includes a loop to allow a user to input a prompt until they enter "quit". Then in the loop section, find the comment **Get a chat completion** and add the following code to add the user input to the prompt, retrieve the completion from your model, and add the completion to the prompt (so that you retain chat history for future iterations):

    ![](../Images/l2at3p7.png)

    ```python
   # Get a chat completion
   prompt.append({"role": "user", "content": input_text})
   response = openai_client.chat.completions.create(
        model=model_deployment,
        messages=prompt
        )
   completion = response.choices[0].message.content
   print(completion)
   prompt.append({"role": "assistant", "content": completion})
    ```
    > **Note:** As you add code, be sure to maintain the correct indentation.

1. Press **CTRL+S** to save the changes you made to the code file.

1. In the cloud shell command-line pane, enter the following command to sign into Azure. Click on the **Link (1)** and copy the **code (2)** provided.

    ![](../Images/l2at3p8.png)

    ```
    az login
    ```
    
1. In the new browser tab, when the **Enter code to allow access** window appears, paste the copied code and select **Next**.

    ![](../Images/l2at3p9.png)

1. In the **Pick an account** dialog box, choose **ODL_User<inject key="DeploymentID"></inject>**. 

    ![](../Images/l2at3p10.png)

1. In the **Are you trying to sign in to Microsoft Azure CLI?** dialog box, click **Continue**.

    ![](../Images/l2at3p11.png)

1. When the **Microsoft Azure Cross-platform Command Line Interface** window pops up, return to the browser tab with Cloud Shell open. 

    ![](../Images/l2at3p12.png)

1. In the Cloud Shell console, press **Enter** to select the only available subscription.

    ![](../Images/l2at3p13.png)

1. After you have signed in, enter the following command to run the application:

    ```
   python chat-app.py
    ```

1. When prompted, enter a question, such as `What is the fastest animal on Earth?` and review the response from your generative AI model.

    ![](../Images/lab2a-03-7.png)

1. Try some follow-up questions, like `Where can I see one?` or `Are they endangered?`. The conversation should continue, using the chat history as context for each iteration.

    ![](../Images/lab2a-03-8.png)

    ![](../Images/lab2a-03-9.png)

1. When you're finished, enter `quit` to exit the program.

    >**Note:** If the app fails because the rate limit is exceeded. Wait a few seconds and try again. If there is insufficient quota available in your subscription, the model may not be able to respond.

## Summary

In this lab, you deployed the gpt-4.1 model in Microsoft Foundry and created a project to manage it. You then set up a Python-based chat application in Cloud Shell, configured environment variables, and installed the required SDKs. After updating the code to connect with your project, you tested the app by sending queries and reviewing responses. By the end, you gained hands-on experience in deploying models, integrating them into applications, and building a working generative AI chat solution.

## You have successfully completed the Hands-on Lab!
