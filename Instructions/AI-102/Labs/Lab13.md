# Lab 13: Connect to remote agents with A2A protocol

In this lab, you'll use Azure AI Agent Service with the A2A protocol to create simple remote agents that interact with one another. These agents will assist technical writers with preparing their developer blog posts. A title agent will generate a headline, and an outline agent will use the title to develop a concise outline for the article.

### Task 1: Create an Azure AI Foundry project

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, select **Create an agent**.   

   ![](../Images/ai13l1.png) 

1. When prompted to create a project, enter the project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

   ![](../Images/ai13l2.png) 

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group: Select **AI-102-RG13 (1)**
    - Region: Select **Region**: Select **<inject key="Region" enableCopy="false" /> (2)**
    - Select **Create (3)**

      ![](../Images/ai13l3.png)    

1. Wait for your project to be created.      

1. When prompted, search for `gpt-4.1` **(1)**, then select **gpt-4.1 (2)** model and then **Confirm (3)**.

   ![](../Images/ai13l4.png) 

1. On the **Deploy gpt-4.1** page, select **Global Standard (1)** as the Deployment type and then click on **Customize (2)**.

   ![](../Images/ai13l5.png) 

1. On the **Deploy gpt-4.1** page,

    - Tokens per Minute Rate Limit (thousands): `60K` **(1)** (or the maximum available in your subscription if less than 50K)
    - Then select **Deploy (2)**

      ![](../Images/ai13l6.png) 

1. When your project is created, the Agents **playground** will be opened.

   ![](../Images/ai13l7.png) 

1. In the navigation pane on the left, select **Overview (1)** to see the main page for your project. Copy the **Azure AI Foundry project endpoint (2)** values to a notepad, as you'll use them to connect to your project in a client application.

   ![](../Images/ai13l8.png) 


### Task 2: Create an A2A application

Now you're ready to create a client app that uses an agent. Some code has been provided for you in a GitHub repository.

### Task 2.1: Clone the repo containing the application code

1. Navigate to [Azure portal](https://portal.azure.com/).

1. If prompted, provide the credentials below:

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

    - **Password:** <inject key="AzureAdUserPassword"></inject>

1. Use the **[>_]** button to the right of the search bar at the top of the page to create a new **Cloud Shell** in the Azure portal.

    ![](../Images/ai11l4.png) 

1. Selecting a **PowerShell** environment.

    ![](../Images/ai11l5.png) 

1. On the **Getting started** page,

    - Select **No storage account required (1)** 
    - Select your subscription **(2)**
    - Click on **Apply (3)**

      ![](../Images/ai11l6.png) 

1. In the cloud shell toolbar, in the **Settings (1)** menu, select **Go to Classic version (2)** (this is required to use the code editor).

    ![](../Images/ai11l7.png)

     >**Note**: The cloud shell provides a command-line interface in a pane at the bottom of the Azure portal. You can resize or maximize this pane to make it easier to work in.

     >**Note**: Ensure you've switched to the classic version of the cloud shell before continuing.

1. In the cloud shell pane, copy and paste the following commands to clone the GitHub repo containing the code files for this exercise.

    ```
   rm -r ai-agents -f
   git clone https://github.com/MicrosoftLearning/mslearn-ai-agents ai-agents
    ```


