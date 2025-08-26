# Lab 01: Prepare for an AI development project

### Estimated Duration : 30 Minutes

## Overview

In this hands-on lab, you’ll work with **Azure AI Foundry** to create and explore a generative AI project. You’ll start by creating a new project and deploying the **gpt-4.1** model. Then, you’ll review the project’s endpoints and keys that client applications use to connect with deployed models and AI services. Finally, you’ll test your deployed model in the chat playground by configuring system instructions and sending queries to see the model’s responses.

## Lab Objectives

- **Task 1:** Create a Azure AI Foundry Project and deploy a model

- **Task 2:** Review project endpoints

- **Task 3:** Test a generative AI model

## Task 1: Create a Azure AI Foundry Project and deploy a model

In this task, you’ll create a new Azure AI Foundry project, deploy the **gpt-4.1** model into it, and explore the management settings at both the project and resource levels. You’ll also verify the Azure resources created to support the deployment in the Azure portal.

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, in the **Explore models and capabilities** section, search for the `gpt-4.1` **(1)** model  and select `gpt-4.1` **(2)**  which we'll use in our project.    

   ![](../Images/aii2.png) 

1. Select **Use this model**.

   ![](../Images/aii3.png) 

1. When prompted to create a project, enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

   ![](../Images/aii4.png) 

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group: Select **AI-102-RG01 (1)**
    - Region: **<inject key="Region" enableCopy="false" /> (2)**
    - Select **Create (3)**

      ![](../Images/aii5.png) 

       >**Note**: If prompted, deploy the gpt-4.1 model using the **Global standard** deployment type and customize the deployment details to set a Tokens per minute rate limit of **50K** (or the maximum available if less than 50K).   

1. Wait for your project to be created. It may take around 3-5 minutes.          

1. When your project is created, the **Chat playground** will be opened automatically so you can test your model.

   ![](../Images/aii6.png)

1. In the navigation pane on the left, select **Overview** to see the main page for your project, which looks like this:

   ![](../Images/aii7.png)

1. At the bottom of the navigation pane on the left, select **Management center**. 

   ![](../Images/aii8.png)

1. The management center is where you can configure settings at both the **resource** and **project** levels; which are both shown in the navigation pane.     

   ![](../Images/aii9.png)

   - The **resource level** relates to the Azure AI Foundry resource that was created to support your project. This resource includes connections to Azure AI Services and Azure AI Foundry models; and provides a centralplace to manage user access to AI development projects.

   - The **project level** relates to your individual project, where you can add and manage project-specific resources.

1. In the navigation pane, in the section for your Azure AI Foundry resource, select the **Overview (1)** page to view its details. Select the link to the Resource group **AI-102-RG01 (2)** associated with the resource to open a new browser tab and navigate to the Azure portal.  

   ![](../Images/aii10.png)

1. Sign in with your Azure credentials if prompted.

1. View the resource group in the Azure portal to see the Azure resources that have been created to support your **Azure AI Foundry resource** and your **project**.

   ![](../Images/aii11.png)

    >**Note**: Note that the resources have been created in the region you selected when creating the project.

1. Close the Azure portal tab and return to the **Azure AI Foundry portal**. 

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="de166ee0-49cd-4599-b2a5-9cb602ef5230" />
 
---

## Task 2: Review project endpoints

In this task, you’ll review the endpoints and authorization keys available in your Azure AI Foundry project. These endpoints are what client applications use to connect to the project, deployed models, and integrated Azure AI services.

1. In the Management center page, in the navigation pane, under your project, select **Go to project**.

    ![](../Images/aii12.png)

1. In the project **Overview (1)** page, view the Endpoints and keys section; which contains endpoints and authorization keys that you can use in your application code to access **(2)**:

    - The **Azure AI Foundry project** and any models deployed in it.
    - **Azure OpenAI** in Azure AI Foundry models.
    - **Azure AI Services**   

      ![](../Images/aii13.png)    


## Task 3: Test a generative AI model      

In this task, you’ll use the chat playground in Azure AI Foundry to test your deployed **gpt-4.1** model. You’ll configure the system message to provide context, send queries, and review the model’s generative responses.

1. In the navigation pane on the left for your project, select **Playgrounds (1)**.

    - On the Chat playground, and ensure that your `gpt-4.1` **(2)** model deployment is selected in the Deployment section.

      ![](../Images/aii14.png)    

1. In the Setup pane, in the **Give the model instructions and context** box, delete the existing content and then enter the following instructions **(1)** and then **Apply changes (2)**:      

    ```
    You are a history teacher who can answer questions about past events all around the world.
    ```

     ![](../Images/aii15.png)  

1. In the **Update system message?**, click **Continue**.

    ![](../Images/aii16.png)

1. In the chat window, enter a query such as `What are the key events in the history of Scotland?` **(1)** and then send **(2)**.    

    ![](../Images/aii17(1).png)

1. View the response:   

    ![](../Images/aii18.png)

### Summary

In this lab, you created an Azure AI Foundry project and deployed the gpt-4.1 model. You explored the project’s endpoints and keys to understand how applications connect to deployed models and Azure AI services. Finally, you tested the generative AI model in the chat playground by configuring system instructions, sending queries, and reviewing the model’s responses, gaining hands-on experience in managing and using generative AI in Azure.

### You have successfully completed the Hands-on Lab!





