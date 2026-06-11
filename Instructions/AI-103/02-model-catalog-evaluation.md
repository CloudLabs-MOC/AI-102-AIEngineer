# Explore and compare models

### Estimated Duration: 60 Minutes

## Lab overview

In this lab, you will use Microsoft Foundry to explore and compare AI models available in the model catalog. You will review model details and benchmark results, use the model leaderboard to compare performance, cost, throughput, and safety metrics, and deploy multiple model variants for side-by-side testing in the model playground. You will then evaluate a deployed model using a synthetically generated dataset and analyze the evaluation results to better understand model quality, safety, and overall performance.

## Lab objectives

In this exercise, you will perform:

* Task 1: Create a Microsoft Foundry project
* Task 2: Explore models in the catalog
* Task 3: Compare models using the model leaderboard
* Task 4: Deploy models
* Task 5: Compare models in the model playground
* Task 6: Evaluate a model with a synthetic dataset

## Task 1: Create a Microsoft Foundry project

In this task, you'll create a Microsoft Foundry project, configure the required Azure resources, and obtain the project endpoint needed for application development.

1. Copy the **Microsoft Foundry** link and paste it into a new browser tab to access the portal: `https://ai.azure.com/`

1. On the **Microsoft Foundry** home page, click on **Start building**.

     ![](./media/ai103-lab2-t1p1.png)

1. If prompted to sign in, enter your credentials:
 
   - **Email/Username:** Enter <inject key="AzureAdUserEmail"></inject> **(1)** and click on **Next (2)**.
 
        ![Enter Your Username](./media/ai103-lab2-t1p2.png)
 
   - **Password:** Enter <inject key="AzureAdUserPassword"></inject> **(1)** and click on **Sign in (2)**.
 
      ![Enter Your Password](./media/ai103-lab2-t1p3.png)

1. If prompted to **Stay signed in?**, you can click **No**.

    ![](./media/ai103-lab2-t1p4.png)

1. If prompted with, the **Get started with Microsoft Foundry** page, click on **Create project**.

   ![](./media/ai103-lab2-t1p5.png)

1. In the **Create a project** wizard, enter project name **Myproject<inject key="DeploymentID" enableCopy="false" /> (1)**, and **Expand Advanced options (2)** to specify the following settings for your project: 

    - Foundry resource: **Leave default (3)**
    - Subscription : **Leave default subscription (4)** 
    - Region : Select **<inject key="location" enableCopy="false"/> (5)**
    - Resource group : Select **AI-103 (6)** 
    - Click on **Create** **(7)**

      ![](./media/ai103-lab2-t1p6.png)

      > **Note:** If project creation gives an authorization error related to Application Insights or Log Analytics resources (for example, errors containing `Microsoft.OperationalInsights/workspaces/write` or `Microsoft.Insights/components/write`), **Toggle off** the *Set up recommended resources so I can explore everything Foundry has to offer* option before creating the project.

      ![](./media/ai901-l5-1(2).png)

1. Wait for your project to be created. It may take a few minutes. 

1. In the **All set, Let's build your agents** window, click **Let's go**.

    ![](./media/ai103-lab2-t1p7.png)

1. Once the setup is complete, you are automatically redirected to the **Microsoft Foundry home page** for the newly created project.

   ![](./media/ai103-lab2-t1p8.png)

   > **Note:** The Microsoft Foundry landing page may vary depending on the version of the portal, your account configuration, or recent UI updates. If your home page looks different, continue with the lab by locating the required menu options using the navigation menu. The appearance of the portal may differ, but the functionality and lab steps remain the same.

    ![](./media/ai103-lab2-t1p9.png)

## Task 2: Explore models in the catalog

In this task, you'll browse the Microsoft Foundry model catalog, review model details, and examine benchmark information to identify models suitable for different AI scenarios.

1. Now you're ready to explore models.

1. From the **Microsoft Foundry** homepage, select **Discover (1)** from the top menu. Then select the **Models (2)** tab to view the Microsoft Foundry model catalog.

    The model catalog lists all models available in Foundry. Some are provided directly from Azure (and billed through your Azure subscription) while others are provided by partners and the community.

    ![](./media/ai103-lab2-t1p10.png)

    >**Note:** You can search and filter the catalog, based on model names, capabilities, and other factors.

1. Search for `gpt-4.1` **(1)**. Then, in the search results, select the **gpt-4.1** model to view its **model card**.

    ![](./media/ai103-lab2-t1p11.png)

1. Model cards provide information about models to help you determine if they are suitable for your needs.

1. Read the description and review the other information available on the **Details** page.

    ![](./media/ai103-lab2-t1p12.png)

1. Select the **Benchmarks** tab on the **gpt-4.1** model page to view how the model performs on various standard benchmarks compared to other models commonly used for similar scenarios.

    ![](./media/ai103-lab2-t1p13.png)

1. Use the back arrow (**&larr;**) next to the **gpt-4.1** page title to return to the model catalog.

    ![](./media/ai103-lab2-t1p14.png)

## Task 3: Compare models using the model leaderboard

In this task, you'll use the model leaderboard and comparison tools to evaluate models based on quality, cost, throughput, safety, and other benchmark metrics.

1. In the model catalog page, select **View leaderboard**.

    ![](./media/ai103-lab2-t1p15.png)

1. In the **Model leaderboard** page, review the top models ranked by quality, safety, cost, and performance. Note which models score highest for AI quality metrics.

    ![](./media/ai103-lab2-t1p16.png)

1. Scroll down to use the **Trade-off chart** section to compare models on multiple dimensions.

    ![](./media/ai103-lab2-t1p17.png)

1. Select the **Benchmark Cost (1)** from the dropdown to see how model quality relates to cost, and then use the model list to compare **gpt-4.1** and **gpt-4.1-mini** **(2)**. If you want to explore further, you can add other models to the comparison.

    ![](./media/ai103-lab2-t1p18.png)

1. Select the **Throughput** metric from the dropdown to see how the quality of these models relates to throughput scores.

    ![](./media/ai103-lab2-t1p19.png)

1. Select the **Safety** metric from the dropdown to see how the quality of these models relates to safety scores.

    ![](./media/ai103-lab2-t1p20.png)

1. In the table just above the trade-off charts, you can compare benchmarks. Select **gpt-4.1** and **gpt-4.1-mini (1)**, and optionally any other models **(2)** you want to explore, and then use the **Compare models (3)** button to view their benchmarks side-by-side.

    ![](./media/ai103-lab2-t1p21.png)

1. Review the comparison across the following data:
    - **Performance benchmarks**: Quality, safety, and throughput scores.
    - **Input** and **output**: The formats supported for prompts and responses.
    - **Context**: The number of tokens that can be maintained in a conversation and produced as output, and when the model was trained.
    - **Endpoints**: The API endpoints through which the model can be consumed by client applications, and whether it can be used by an agent.
    - **Supported features**: Specific capabilities that you may require in your application scenario.

        ![](./media/ai103-lab2-t1p22.png)

1. Select **Models** from my left pane to to return to the model catalog.

    ![](./media/ai103-lab2-t1p24.png)

## Task 4: Deploy models

In this task, you'll deploy the gpt-4.1 and gpt-4.1-mini models to your project, making them available for testing and evaluation in the model playground.

### Task 4.1: Deploy the gpt-4.1 model

1. In the model catalog, search for `gpt-4.1` **(1)** and select it **(2)** from the results.

    ![](./media/ai103-lab2-t1p25.png)

1. On the model page, select **Deploy (1)** drop-down and deploy the model using the ***Default settings (2)**.

    ![](./media/ai103-lab2-t1p26.png)

1. The deployed model will open in the model playground, where it will be selected in the **Model** drop-down list.

    ![](./media/ai103-lab2-t1p27.png)

1. Note the deployment name that is assigned to the **gpt-4.1** model. You'll need to identify this deployment later.

    ![](./media/ai103-lab2-t1p28.png)

### Task 4.2: Deploy the gpt-4.1-mini model

1. In the model playground, click the **Model (1)** drop-down list, select **Browse more models (2)**.

    ![](./media/ai103-lab2-t1p29.png)

1. Search for `gpt-4.1-mini` **(1)**, and then select it **(2)** and then click on **Deploy (3)**. 

    ![](./media/ai103-lab2-t1p30.png)

    >**Note:** If you cannot find the model, use the **Next** button at the bottom of the page to move to the next page.

    ![](./media/ai103-lab2-t1p31.png)

1. Once the model deployment is complete, it will automatically be selected in the Model Playground.

    ![](./media/ai103-lab2-t1p32.png)

1. Note the deployment name that is assigned to the **gpt-4.1-mini** model.

    ![](./media/ai103-lab2-t1p33.png)

## Task 5: Compare models in the model playground

In this task, you'll interact with multiple deployed models in the model playground, compare their responses to the same prompts, and evaluate differences in reasoning, accuracy, and response style.

1. In the playground, ensure the deployment for the **gpt-4.1-mini (1)** model is selected in the **Models** list, and then on the right side of the page, in the **Compare models (2)** list, select the deployment for the **gpt-4.1 (3)** model.

    ![](./media/ai103-lab2-t1p33.png)

1. The side-by-side comparison view opens directly into separate chat panes for each model. 

    ![](./media/ai103-lab2-t1p34.png)

1. Select the **Chat** tab for both models, and enter the following prompt:

    ```
   I have a fox, a chicken, and a bag of grain that I need to take over a river in a boat. I can only take one thing at a time. If I leave the chicken and the grain unattended, the chicken will eat the grain. If I leave the fox and the chicken unattended, the fox will eat the chicken. How can I get all three things across the river without anything being eaten?
    ```

    ![](./media/ai103-lab2-t1p36.png)

1. Submit the prompt and view the responses from both models. 

    ![](./media/ai103-lab2-t1p37.png)

1. Then, enter the following follow-up prompt:

    ```
   Explain your reasoning.
    ```

1. Compare the responses from each model. Note any differences in accuracy, reasoning quality, and response style.

    ![](./media/ai103-lab2-t1p38.png)

## Task 6: Evaluate a model with a synthetic dataset

In this task, you'll generate a synthetic dataset, configure an evaluation, and assess the performance of a deployed model using automated evaluation criteria and analysis tools.

### Step 1: Target

1. In the playground, select the **Evaluations** tab.

    ![](./media/ai103-lab2-t1p39.png)

1. Select **Create** to open the **Create new evaluation** wizard.

    ![](./media/ai103-lab2-t1p40.png)

1. For the evaluation target, select **Model (1)**.

1. In the table of models, deselect any preselected deployments so that only the checkbox for **gpt-4.1 (2)** is selected, and then select **Next (3)**.

    ![](./media/ai103-lab2-t1p41.png)

### Step 2: Data

Instead of uploading a test dataset, you'll use Foundry's synthetic data generation feature to create one automatically.

1. In the **Data** step, under **Dataset source**, select **Synthetic generation (1)** and select **Generate (2)**.

    ![](./media/ai103-lab2-t1p42.png)

    With synthetic generation, a deployment is used to automatically generate questions for each target when you submit the evaluation.

1. Now set and confirm the following:

    - **Name of the new dataset**: *Leave as default* **(1)**
    - **Model**: `gpt-4.1` **(2)**
    - **Number of rows**: `45` **(3)**
    - **Prompt**: `Create various travel related questions, and include some content safety and security tests` **(4)**
    - **Seed data**: *Leave blank*
    - Select **Confirm (5)** to proceed.

        ![](./media/ai103-lab2-t1p43.png)

1. Now click on **Next**.

    ![](./media/ai103-lab2-t1p44.png)

### Step 3: Configure models

1. In the **Configure models** step, select **Configure (1)** and set the **Developer (2)** prompt for the model being evaluated and leave the rest of the values at their default, then click on **Save (3)**:

    ```
    You are a helpful travel assistant that provides accurate, detailed, and practical travel advice to help users plan their trips.
    ```

    ![](./media/ai103-lab2-t1p46.png)

1. Now select **Next**.

    ![](./media/ai103-lab2-t1p47.png)

### Step 4: Criteria

1. In the **Criteria** step, all of the suggested evaluators. These use an AI model as a judge to assess the quality of responses.

1. Remove all of the criteria under **Agents** by selecting **Remove all**, leaving the rest of the evaluators enabled.

    ![](./media/ai103-lab2-t1p48.png)

1. Select **Next**.

    ![](./media/ai103-lab2-t1p49.png)

### Step 5: Review and submit

1. In the **Review** step, verify the evaluation configuration, including the target model, dataset, and selected criteria.

1. Provide a name for the evaluation, such as `travel-assistant-eval` **(1)**. Select **Submit (2)** to start the evaluation run.

    ![](./media/ai103-lab2-t1p50.png)

1. Wait for the evaluation to complete. This may take several minutes, depending on data center load.

    ![](./media/ai103-lab2-t1p51.png)

### Review the results

1. When the evaluation completes, select the evaluation run to view the results page displays an overview of the evaluation metrics.

    ![](./media/ai103-lab2-t1p52.png)

1. Review the scores and results from each evaluation in the table detailed on the run page. Scroll to the right and view additional pages, where you'll see mostly passing values. Depending on the model's response, you may see some failures. If you do, examine those closely.

    ![](./media/ai103-lab2-t1p53.png)

1. Select the **Analyze results (1)** button, selecting **gpt-4.1 (2)** from dropdown, then select **Start analysis (3)**.

    ![](./media/ai103-lab2-t1p54.png)

1. On this page you'll see any failures clustered by why they failed, where you can see details on why it failed. Most of those failures will be due to the model saying it's unable to help due to the nature of the question, however you should explore each failure and consider if the response is what you want to see.

    ![](./media/ai103-lab2-t1p55.png)

1. Review any failures and the AI suggestions for how to improve. This guidance will help you tweak your configuration to perform better.

## Summary

In this exercise, you created a Microsoft Foundry project and explored models available in the model catalog. You compared models using benchmark data and the model leaderboard, deployed multiple models, and tested their responses side-by-side in the model playground. Finally, you ran an evaluation using a synthetically generated dataset, reviewed the evaluation metrics, and analyzed the results to identify strengths, weaknesses, and opportunities for improving model performance.

### Congratulations, you’ve successfully completed the hands-on lab!