# Lab 06: Apply content filters to prevent the output of harmful content

Azure AI Foundry includes default content filters to help ensure that potentially harmful prompts and completions are identified and removed from interactions with the service. Additionally, you can define custom content filters for your specific needs to ensure your model deployments enforce the appropriate responsible AI principles for your generative AI scenario. Content filtering is one element of an effective approach to responsible AI when working with generative AI models.

In this lab, you'll explore the effect of the default content filters in Azure AI Foundry.

### Task 1: Deploy a model in an Azure AI Foundry project

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, in the Explore models and capabilities section, search for the **Phi-4 (1)** model and then select **Phi-4 (2)** which we'll use in our project

   ![](../Images/ai6l1.png) 

1. Then at the top of the page for the model, select Use this model.

   ![](../Images/ai6l2.png) 

1. When prompted to create a project, enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

   ![](../Images/ai6l3.png) 

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group: Select **AI-102-RG06 (1)**
    - Region: Select **Region**: Select **<inject key="Region" enableCopy="false" /> (2)**
    - Select **Create (3)**

      ![](../Images/ai6l4.png)

1. Select **Agree and Proceed**.

   ![](../Images/ai6l5.png) 

1. On the **Deploy Phi-4** page, select Deployment type as **Global Standard (1)** and then **Create (2)**.

   ![](../Images/ai6l6.png) 

1. Wait for your project to be created.   

1. Select **Open in playground**.

   ![](../Images/ai6l7.png) 

   