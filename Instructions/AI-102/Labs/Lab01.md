# Lab 01: Prepare for an AI development project

In this lab, you use Azure AI Foundry portal to create a project, ready to build an AI solution.

### Task 1: Create a Azure AI Foundry Project

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, in the **Explore models and capabilities** section, search for the `gpt-4.1` model **(1)** and select e `gpt-4.1` **(2)**  which we'll use in our project.    

1. Select **Use this model**.

1. When prompted to create a project, enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group name: Ai102
