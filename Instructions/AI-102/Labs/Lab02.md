# Choose and deploy a language model

The Azure AI Foundry model catalog serves as a central repository where you can explore and use a variety of models, facilitating the creation of your generative AI scenario.

In this lab, you'll explore the model catalog in Azure AI Foundry portal, and compare potential models for a generative AI application that assists in solving problems.

### Task 1: Explore models

1. Open a new tab in the browser, right-click on the following link [Azure AI Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Azure AI Foundry portal**.

1. Click on **Sign in**.

   ![](../Images/aii1.png) 

1. If prompted, provide the credentials below:

   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

   - **Password:** <inject key="AzureAdUserPassword"></inject>

1. In the home page, in the **Explore models and capabilities** section, search for the `gpt-4.1` model **(1)** and select `gpt-4.1` **(2)**  which we'll use in our project.    

   ![](../Images/aii2.png) 

1. Read the description and review the other information available on the **Details** tab.   

   ![](../Images/aii19.png)

1. On the `gpt-4.1` page, view the Benchmarks tab to see how the model compares across some standard performance benchmarks with other models that are used in similar scenarios.   

   ![](../Images/aii20.png)

1. Use the back arrow **(←)** next to the gpt-4.1 page title to return to the model catalog.   

   ![](../Images/aii21.png)

1. Search for **Phi-4-mini-instruct (1)** and select **Phi-4-mini-instruct (2)**.

   ![](../Images/aii22.png)

1. View the **details** for the Phi-4-mini-instruct model.

   ![](../Images/aii23.png)

1. Navigate to **benchmarks** tab and view the information.

   ![](../Images/aii24.png)

### Task 2: Compare models

You've reviewed two different models, both of which could be used to implement a generative AI chat application. Now let's compare the metrics for these two models visually.

1. Use the back arrow **(←)** to return to the model catalog.

   ![](../Images/aii25.png)

1. Select **Compare models**. 

   ![](../Images/aii26.png)

1. A visual chart for model comparison is displayed with a selection of common models.

1. In the **Models to compare** pane, note that you can select popular tasks, such as **question answering (1)** to automatically select commonly used models for specific tasks.

   - Use the **Clear all models (🗑) (2)** icon to remove all of the pre-selected models.

     ![](../Images/aii27.png)   

1. Use the **+ Model to compare** button to add the gpt-4.1 model to the list. 

   ![](../Images/aii28.png)

1. Search for `gpt-4.1` **(1)** then select `gpt-4.1` **(2)** and then **Confirm (3)**.  

   ![](../Images/aii29.png)   

1. Then use the same button to add the Phi-4-mini-instruct model to the list.

   ![](../Images/aii30.png) 

1. Seach for `Phi-4-mini-instruct` **(1)** model then select `Phi-4-mini-instruct` **(2)** and then **Confirm (3)**. 

   ![](../Images/aii31.png)

1. Set the models X axis to **Quality Index (1)** and Y axis to **Cost (2)**.  Review the chart, which compares the models based on **Quality Index** (a standardized score indicating model quality) and **Cost**. 

   ![](../Images/aii32.png)

1. You can see the specific values for a model by holding the mouse over the point that represents it in the chart.   

   ![](../Images/aii33.png)

1. In the `X-axis` dropdown menu, under **Quality**, select the **Accuracy** metrics and observe each resulting chart **(2)(3)**.   

   ![](../Images/aii34.png)

1. Based on the benchmarks, the `gpt-4.1` model looks like offering the best overall performance, but at a higher cost.

1. In the list of models to compare, select the `gpt-4.1` model to re-open its benchmarks page.

   ![](../Images/aii35.png)

1. In the page for the `gpt-4.1` model page, select the **Details** tab to view the model details.   

   ![](../Images/aii36.png)

### Task 3: Create an Azure AI Foundry project and deploy a model

To use a model, you need to create an Azure AI Foundry project.

1. At the top of the `gpt-4.1` model overview page, select **Use this model**.

   ![](../Images/aii37.png)

1. When prompted to create a project, enter a project name as **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** and expand **Advanced options (2)**.

   ![](../Images/aii38.png)

1. Under **Advanced options**, provide the below details and leave the rest to deafult:

    - Resource group: Select **AI-102-RG02 (1)**
    - Region: Select **Region**: Select **<inject key="Region" enableCopy="false" /> (2)**
    - Select **Create (3)**

      ![](../Images/aii39.png) 

       >**Note**: If prompted, deploy the gpt-4.1 model using the **Global standard** deployment type and customize the deployment details to set a Tokens per minute rate limit of **50K** (or the maximum available if less than 50K).    

1. When your project is created, the chat playground will be opened automatically so you can test your model.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="efe4377d-c93c-4d0d-a5bd-e7f53085f5ed" />
 
---

### Task 4: Chat with the gpt-4.1 model

Now that you have a model deployment, you can use the playground to test it.

1. In the chat playground, in the Setup pane, ensure that your `gpt-4.1` model is selected

   ![](../Images/aii40.png)

1. In the Give the model instructions and context field, set the system prompt to `You are an AI assistant that helps solve problems` **(1)**.

   - Select **Apply changes (2)** to update the system prompt.  

     ![](../Images/aii41.png)    

1. Select **Continue**.

   ![](../Images/aii42.png)

1. In the chat window, enter the following query **(1)** and then **Send (2)**.

   ```
   I have a fox, a chicken, and a bag of grain that I need to take over a river in a boat. I can only take one thing at a time. If I leave the chicken and the grain unattended, the chicken will eat the grain. If I leave the fox and the chicken unattended, the fox will eat the chicken. How can I get all three things across the river without anything being eaten?
   ```

    ![](../Images/aii43.png)   

1. View the response.

   ![](../Images/aii44.png)

1. Then, enter the following follow-up query:

   ```
   Explain your reasoning.
   ```

    ![](../Images/aii45.png)   


### Task 5: Deploy another model

When you created your project, the gpt-4.1 model you selected was automatically deployed. Let's deploy the Phi-4-mini-instruct model you also considered.

1. In the navigation bar on the left, in the **My assets** section, select **Models + endpoints**.

   - In the Model deployments tab, in the **+ Deploy model (2)** drop-down list, select **Deploy base model (3)**.

     ![](../Images/aii46.png)

1. Then search for **Phi-4-mini-instruct (1)**, then select **Phi-4-mini-instruct (2)** and **Confirm (3)** you selection.    

   ![](../Images/aii47.png)

1. Click on **Agree and Proceed** to agree to the model license.

   ![](../Images/aii48.png)

1. Deploy a Phi-4-mini-instruct model with the following settings and then select **Deploy (2)**:

   - Deployment name: Leave the default name
   - Deployment type: **Global Standard (1)**
   - Deployment details: Use the default settings

     ![](../Images/aii49.png)

1. Wait for the deployment to complete.

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="c84cf65d-2739-4748-bdea-7233a75b480b" />
 
---

### Task 6: Chat with the Phi-4 model

1. In the navigation bar, select **Playgrounds (1)**. Under the Chat playground, select the **Try the  Chat playground (2)**.

   ![](../Images/aii50.png)

1. In the chat playground, in the Setup pane, ensure that your **Phi-4-mini-instruct** model is selected.    

   ![](../Images/aii51.png)

1. In the chat box, provide the first line as `System message: You are an AI assistant that helps solve problems` **(1)** and then **Send (2)**.   

   ![](../Images/aii52.png)

    >**Note**: The same system prompt you used to test the gpt-4.1 model, but since there is no system message setup, we're providing it in the first chat for context.

1. On a new line in the chat window (below your system message), enter the following query and then **Send**:

   ```
   I have a fox, a chicken, and a bag of grain that I need to take over a river in a boat. I can only take one thing at a time. If I leave the chicken and the grain unattended, the chicken will eat the grain. If I leave the fox and the chicken unattended, the fox will eat the chicken. How can I get all three things across the river without anything being eaten?
   ```

1. View the response.

   ![](../Images/aii53.png) 

1. Then, enter the following follow-up query:

   ```
   Explain your reasoning.
   ```    

    ![](../Images/aii54.png)    

#### Perform a further comparison    

1. Use the drop-down list in the **Setup** pane to switch between your models, testing both models with the following puzzle (the correct answer is `40!`):

1. Provide the following puzzle in the **Phi-4 model** chat:

   ```
   I have 53 socks in my drawer: 21 identical blue, 15 identical black and 17 identical red. The lights are out, and it is completely dark. How many socks must I take out to make 100 percent certain I have at least one pair of black socks?
   ```   

    ![](../Images/aii57.png)    

1. Select the `gpt 4.1` model from the drop-down list in the **Setup** pane:

   ![](../Images/aii55.png) 

1. Provide the following puzzle in chat:

   ```
   I have 53 socks in my drawer: 21 identical blue, 15 identical black and 17 identical red. The lights are out, and it is completely dark. How many socks must I take out to make 100 percent certain I have at least one pair of black socks?
   ```   

1. View the result:

   ![](../Images/aii56.png)    

#### Reflect on the models

You've compared two models, which may vary in terms of both their ability to generate appropriate responses and in their cost. In any generative scenario, you need to find a model with the right balance of suitability for the task you need it to perform and the cost of using the model for the number of requests you expect it to have to handle.

The details and benchmarks provided in the model catalog, along with the ability to visually compare models provides a useful starting point when identifying candidate models for a generative AI solution. You can then test candidate models with a variety of system and user prompts in the chat playground.







   

