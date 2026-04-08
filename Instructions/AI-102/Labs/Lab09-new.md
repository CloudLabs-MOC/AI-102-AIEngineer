# Lab 09: Develop an AI agent with VS Code extension

### Estimated Duration: 45 Minutes

## Overview

In this lab, you'll use the Microsoft Foundry VS Code extension to create an agent that can use Model Context Protocol (MCP) server tools to access external data sources and APIs. The agent will be able to retrieve up-to-date information and interact with various services through MCP tools.

> **Note:** Some of the technologies used in this exercise are in preview or in active development. You may experience some unexpected behavior, warnings, or errors.

## Lab Objectives

- **Task 1:** Install the Microsoft Foundry VS Code extension

- **Task 2:** Sign in to Azure and create a project

- **Task 3:** Deploy a model

- **Task 4:** Create an AI agent with the designer view

- **Task 5:** Test your agent in the playground

## Task 1: Install the Microsoft Foundry VS Code extension

In this task, you’ll install and verify the Microsoft Foundry VS Code extension to enable creating and managing AI agents directly within Visual Studio Code.

1. Open the **Visual Studio Code** from the desktop.

1. In Visual Studio Code, select **Extensions (1)** from the left pane, search for **Microsoft Foundry (2)**, choose the **Microsoft Foundry (3)** extension by Microsoft, and then click **Install (4)**.

   ![](../Images/lab7-s1.png)

1. After installation is complete, verify the extension appears in the primary navigation bar on the left side of Visual Studio Code.

   ![](../Images/lab7-s2.png)

   > **Tip:** If you already have the extension installed, make sure the version is at least **v0.16.0** to follow along with the instructions in this exercise.

## Task 2: Sign in to Azure and create a project

Now you'll connect to your Azure resources and create a new AI Foundry project.

1. In the VS Code sidebar, select the **Microsoft Foundry (1)** extension icon.

1. In the Resources view, choose **Create Project (2)**, and when prompted, select **Sign in to Azure (3)** to authenticate.

   ![](../Images/lab7-s4.png)

1. In the **Azure Resources wants to sign in using Microsoft** dialog, select **Allow**.

   ![](../Images/lab7-s5.png)

1. On the **Sign in** page, provide the credentials below:
 
   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
     ![](../Images/lab7-s6.png)

   - **Password:** <inject key="AzureAdUserPassword"></inject>
    
     ![](../Images/lab7-s7.png)

1. On the **Sign in to all apps, websites, and services on this device?** page, select **Yes**.

   ![](../Images/lab7-s8.png)

1. On the **Account added to this device** page, select **Done**.

   ![](../Images/lab7-s9.png)

1. In the **Choose a resource group** dialog, select **AI-3026-RG07** from the list.

   ![](../Images/lab7-s10.png)

1. In the **Enter project name** dialog, enter **Myproject<inject key="DeploymentID" enableCopy="false"/>**, and then press **Enter** to confirm.

   ![](../Images/lab7-s11.png)

1. Wait for the project deployment to complete. A popup will appear with the message "Project deployed successfully."

    ![](../Images/lab09-ai-1.png)

## Task 3: Deploy a model

You'll need a deployed model to use with your agent.

1. In the **RESOURCES** pane, expand **Models**, and then select the **+** icon to add a new model deployment.

   ![](../Images/lab9-ai-01.png)

   > **Tip:** You can also access the Model Catalog pressing **F1** and running the command **Microsoft Foundry: Open Model Catalog**.

1. In the Model Catalog, scroll down, search for **gpt-4.1 (1)** in the search bar, and then select **Deploy (2)** under **OpenAI GPT-4.1**.

   ![](../Images/lab7-s13.png)

1. Configure the deployment settings:
   
   - **Deployment name:** Enter a name like **gpt-4.1-deployment (1)**
   - **Deployment type:** Select **Global Standard** (or **Standard** if Global Standard is not available) **(2)**
   - **Model version:** Leave as default
   - **Tokens per minute:** `50K` **(3)**

1. Select **Deploy in Microsoft Foundry (4)** in the bottom-left corner.

   ![](../Images/lab09-ai-2.png)

1. In the confirmation dialog, select **Deploy** to deploy the model.

1. Wait for the deployment to complete. Your deployed model will appear under the **Models** section in the Resources view.

   ![](../Images/lab9-ai-02.png)

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="319ca36f-8211-459e-ab1b-d5a3068745dd" />

## Task 4: Create an AI agent with the designer view

Now you'll create an AI agent using the visual designer interface. Rather than writing code, you'll configure the agent's instructions, settings, and tools through the user interface.

1. In the Microsoft Foundry extension view, find the **Resources** section.

1. Expand the **Classic (1)** subsection.

1. Select the **+** (plus) **(2)** icon next to the **Classic Agents** subsection to create a new AI Agent.

    ![](../Images/lab9-ai-03.png)

1. Choose a location to save your agent files if prompted.

1. A **New Agent** tab will open to an "Agent Preferences" editor, along with a `.yaml` configuration file.

    ![](../Images/lab7-s17.png)

### Task 4.1 Configure your agent in the designer

1. In the agent preferences, configure the following fields:
    - **Name:** Enter a descriptive name for your agent **data-research-agent (1)**
   
    - **Model:** Select your GPT-4.1-deployment **(2)** from the dropdown
    - **Instructions:** Enter system instructions such as **(3)**:
      ```
      You are an AI agent that helps users research information from various sources. Use the available tools to access up-to-date information and provide comprehensive responses based on external data sources.
      ```

       ![](../Images/lab7-s18.png)

1. Save the configuration by selecting **File > Save** from the VS Code menu bar.

    ![](../Images/lab7-s19.png)

### Task 4.2: Add an MCP Server tool to your agent

You'll now add a Model Context Protocol (MCP) server tool that allows your agent to access external APIs and data sources.

1. In the **TOOL** section of the designer, select the **Add tool (1)** button in the top-right corner.

1. From the dropdown menu, choose **MCP Server (2)**.

    ![](../Images/lab7-s20.png)

1. Configure the MCP Server tool with the following information:
    
    - **Server URL:** Enter the URL of an MCP server `https://gitmcp.io/Azure/azure-rest-api-specs` **(1)**
    
    - **Server Label:** Enter a unique identifier **github_docs_server (2)**

1. Leave the **Allowed tools** dropdown empty to allow all tools from the MCP server.

1. Select the **Create tool (3)** button to add the tool to your agent.

    ![](../Images/lab7-s21.png)

### Task 4.3: Deploy your agent to Microsoft Foundry

1. In the agent designer view, select the **Create Agent on Microsoft Foundry** button in the bottom-left corner.

    ![](../Images/lab7-s22.png)

1. Wait for the deployment to complete.

1. In the VS Code navbar, refresh **(1)** the **Resources** view.  **data-research-agent (2)** should now appear under the **Classic Agents** subsection.

    ![](../Images/lab9-ai-04.png)

## Task 5: Test your agent in the playground

1. Right-click on **data-research-agent (1)** in the **Classic Agents** subsection.

1. Select **Open Playground (2)** from the context menu.

    ![](../Images/lab9-ai-05.png)

1. The Agents Playground will open in a new tab within VS Code.

1. In the **Agent Playground**, enter the following prompt in the chat box **(1)**, and then select **Send (2)**:

      ```output
      Can you help me find documentation about Azure Container Apps and provide an example of how to create one?
      ```

      ![](../Images/lab9-ai-06.png)

1. Send the message and observe the authentication and approval prompts for the MCP Server tool:
    
    - In the **MCP Tools Authentication Setup** dialog, select **No Authentication**.
    
      ![](../Images/lab7-s26.png)

    - In the **MCP Tools Approval Preference** dialog, select **Always approve**.

      ![](../Images/lab7-s27.png)

1. Review the agent's response and note how it uses the MCP server tool to retrieve external information.

    ![](../Images/lab09-ai-3.png)

1. Check the **Agent Annotations** section to see the sources of information used by the agent.

### Task 5.1: Generate sample code for your agent

1. Right-click on **data-research-agent (1)** and select **View Code** button in the Agent Preferences page.

    ![](../Images/lab09-ai-4.png)

1. In the **Choose your preferred SDK** dropdown, select **Microsoft Foundry Projects client library**.

    ![](../Images/lab09-ai-5.png)

1. Select your preferred programming language (eg. Python).

    ![](../Images/lab09-ai-6.png)

1. In the **Choose an auth method** dropdown, select **EntraID (default)**.

    ![](../Images/lab09-ai-7.png)

1. Review the generated sample code that demonstrates how to interact with your agent programmatically.

    ![](../Images/lab09-ai-8.png)

    - You can use this code as a starting point for building applications that leverage your AI agent.

### Task 5.2: View conversation history and threads

1. In the **Azure Resources** view, expand the **Threads (1)** subsection to see conversations created during your agent interactions.

1. Select a thread to view the **Thread Details (2)** page, which shows:
   
    - Individual messages in the conversation
    - Run information and execution details
    - Agent responses and tool usage

      ![](../Images/lab09-ai-9.png)

1. Select **View run info** to see detailed JSON information about each run.

## Summary

In this Lab, you used the Foundry VS Code extension to create an AI agent with MCP server tools. The agent can access external data sources and APIs through the Model Context Protocol, enabling it to provide up-to-date information and interact with various services. You also learned how to test the agent in the playground and generate sample code for programmatic interaction.

## You have successfully completed the Hands-on Lab!