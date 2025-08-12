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

### Task 3: Create an Azure AI Foundry project   

   

