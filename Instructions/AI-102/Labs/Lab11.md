# Lab 11: Develop an Azure AI agent with the Semantic Kernel SDK


## Overview

In this lab, you'll use Azure AI Agent Service and Semantic Kernel to create an AI agent that processes expense claims.

### Task 1: Deploy a model in an Azure AI Foundry project

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, in the **Explore models and capabilities** section, search for the **gpt-4.1 (1)** model and then select **gpt-4.1 (2)** which we'll use in our project

    ![](../Images/aii2.png) 

1. Then at the top of the page for the model, select **Use this model**.

    ![](../Images/ai6l2.png) 

1. When prompted to create a project, enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

    ![](../Images/ai6l3.png) 

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group: Select **AI-102-RG11 (1)**
    - Region: Select **Region**: Select **<inject key="Region" enableCopy="false" /> (2)**
    - Select **Create (3)**

      ![](../Images/ai6l4.png)