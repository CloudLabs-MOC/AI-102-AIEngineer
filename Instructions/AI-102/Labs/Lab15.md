# Lab 15: Create a Question Answering Solution

One of the most common conversational scenarios is providing support through a knowledge base of frequently asked questions (FAQs). Many organizations publish FAQs as documents or web pages, which works well for a small set of question and answer pairs, but large documents can be difficult and time-consuming to search.

Azure AI Language includes a question answering capability that enables you to create a knowledge base of question and answer pairs that can be queried using natural language input, and is most commonly used as a resource that a bot can use to look up answers to questions submitted by users. In this exercise, you'll use the Azure AI Language Python SDK for text analytics to implement a simple question answering application.

### Task 1: Provision an *Azure AI Language* resource


1. On the Azure portal, search for **Language service (1)** and then select **Language(2)** from the services.

   ![](../Images/ai15l1.png) 

1. Select **+ Create**.

   ![](../Images/ai15l2.png) 

1. Select the **Custom question answering (1)** block. Then select **Continue to create your resource (2)**.

   ![](../Images/ai15l3.png) 

1. You will need to enter the following settings:

    - Subscription: Leave your default Azure subscription **(1)**
    - Resource group: Select **AI-102-RG15 (2)**
    - Region: Select **<inject key="Region" enableCopy="false" /> (3)**
    - Name: Enter **languageservice<inject key="DeploymentID" enableCopy="false"/> (4)**
    - Pricing tier: Select **F0 (5)** (*free*), or **S** (*standard*) if F is not available.
    - Azure Search region: Select **<inject key="Region" enableCopy="false" /> (6)**
    - Azure Search pricing tier: **Free (F) (7)** (*If this tier is not available, select Basic (B)*)
    - Responsible AI Notice: ***Agree* (8)**
    - Select **Review + create (9)**,
    
      ![](../Images/ai15l4.png) 
      ![](../Images/ai15l5.png)   

1. Then select **Create**.

   ![](../Images/ai15l6.png) 
    
    >**NOTE**: Custom Question Answering uses Azure Search to index and query the knowledge base of questions and answers.

1. Wait for deployment to complete, and then select **Go to resource group.**.

   ![](../Images/ai15l7.png) 

1. Select the **languageservice<inject key="DeploymentID" enableCopy="false"/>** language resource.

   ![](../Images/ai15l8.png) 

1. View the **Keys and Endpoint** page in the **Resource Management** section. You will need the information on this page later in the lab.

   ![](../Images/ai15l9.png) 

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="2200df38-ce0c-418c-98e4-cdb808b3c3e2" />
 
---   


### Task 2: Create a question answering project

To create a knowledge base for question answering in your Azure AI Language resource, you can use the Language Studio portal to create a question answering project. In this case, you'll create a knowledge base containing questions and answers about [Microsoft Learn](https://docs.microsoft.com/learn).

1. In a new browser tab, go to the Language Studio portal at [https://language.cognitive.azure.com/](https://language.cognitive.azure.com/).

1. Selelect **Sign in**.

    ![](../Images/ai15l10.png) 

1. If prompted, provide the credentials below:

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

    - **Password:** <inject key="AzureAdUserPassword"></inject>

1. If you're prompted to choose a Language resource, select the following settings:

    - **Azure Directory**: The Azure directory containing your subscription **(1)**
    - **Azure subscription**: Your Azure subscription **(2)**
    - **Resource type**: Language **(3)**
    - **Resource name**: Select **languageservice<inject key="DeploymentID" enableCopy="false"/> (4)**
    - Then select **Done (5)**

      ![](../Images/ai15l11.png)    

      If you are <u>not</u> prompted to choose a language resource, it may be because you have multiple Language resources in your subscription; in which case:

      1. On the bar at the top if the page, select the **Settings (&#9881;)** button.
      2. On the **Settings** page, view the **Resources** tab.
      3. Select the language resource you just created, and click **Switch resource**.
      4. At the top of the page, click **Language Studio** to return to the Language Studio home page.

1. At the top of the portal, in the **Create new (1)** menu, select **Custom question answering (2)**.

    ![](../Images/ai15l12.png) 

1. In the **Create a project** wizard, on the **Choose language setting** page,

    - Select the option to **Select the language for all projects (1)**
    - Select **English (2)** as the language. 
    - Then select **Next (3)**.

      ![](../Images/ai15l13.png) 

1. On the **Enter basic information** page, enter the following details:

    - **Name** `LearnFAQ` **(1)**
    - **Description**: `FAQ for Microsoft Learn` **(2)**
    - **Default answer when no answer is returned**: `Sorry, I don't understand the question` **(3)**
    - Select **Next (4)**.

      ![](../Images/ai15l14.png)     

1. On the **Review and finish** page, select **Create project**.

    ![](../Images/ai15l15.png) 

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="43774b71-1947-43ce-901e-6a3f7009419c" />
 
---   

### Task 3: Add sources to the knowledge base

You can create a knowledge base from scratch, but it's common to start by importing questions and answers from an existing FAQ page or document. In this case, you'll import data from an existing FAQ web page for Microsoft Learn, and you'll also import some pre-defined "chit chat" questions and answers to support common conversational exchanges.

1. On the **Manage sources (1)** page for your question answering project, in the **&#9547; Add source (2)** list, select **URLs (3)**.

    ![](../Images/ai15l16.png) 
    
1. Then in the **Add URLs** dialog box, select **&#9547; Add url (1)**. Set the following name and URL  before you select **Add all (4)** to add it to the knowledge base:

    - **Name**: `Learn FAQ Page` **(2)**
    - **URL**: `https://docs.microsoft.com/en-us/learn/support/faq` **(3)**

      ![](../Images/ai15l17.png) 

1. On the **Manage sources** page for your question answering project, in the **&#9547; Add source (1)** list, select **Chitchat (2)**.

    ![](../Images/ai15l18.png) 

1. The in the **Add chit chat** dialog box, select **Friendly (1)** and select **Add chit chat (2)**.

    ![](../Images/ai15l19.png) 

### Task 4:  Edit the knowledge base

Your knowledge base has been populated with question and answer pairs from the Microsoft Learn FAQ, supplemented with a set of conversational *chit-chat* question  and answer pairs. You can extend the knowledge base by adding additional question and answer pairs.

1. In your **LearnFAQ** project in Language Studio, select the **Edit knowledge base** page to see the existing question and answer pairs (if some tips are displayed, read them and choose **Got it** to dismiss them, or select **Skip all**)

    ![](../Images/ai15l20.png) 
    ![](../Images/ai15l21.png) 

1. In the knowledge base, on the **Question answer pairs** tab, select **&#65291; (1)**.

    ![](../Images/ai15l22.png) 

1. Create a new question answer pair with the following settings and then select **Done (4)**.

    - **Source**: `https://docs.microsoft.com/en-us/learn/support/faq` **(1)**
    - **Question**: `What are Microsoft credentials?` **(2)**
    - **Answer**: `Microsoft credentials enable you to validate and prove your skills with Microsoft technologies.` **(3)**

      ![](../Images/ai15l23.png)

1. In the page for the **What are Microsoft credentials?** question that is created, expand **Alternate questions (1)**. Click on **+ Add the alternate question (2)** and the add the alternate question `How can I demonstrate my Microsoft technology skills?`. **(3)**

    ![](../Images/ai15l24.png) 

    In some cases, it makes sense to enable the user to follow up on an answer by creating a *multi-turn* conversation that enables the user to iteratively refine the question to get to the answer they need.

1. Under the answer you entered for the certification question, expand **Follow-up prompts (1)** and then click on **+ Add follow up prompt (2)**.

    ![](../Images/ai15l25.png) 

1. Add  the following follow-up prompt:

    - Text displayed in the prompt to the user: Enter `Learn more about credentials`. **(1)**
    - Select the **Create link to new pair (2)** tab
    - Enter this text: `You can learn more about credentials on the [Microsoft credentials page](https://docs.microsoft.com/learn/credentials/).` **(3)**
    - Select **Show in contextual flow only (3)**. This option ensures that the answer is only ever returned in the context of a follow-up question from the original certification question.
    - Select **Add prompt**.

      ![](../Images/ai15l26.png) 

### Task 5: Train and test the knowledge base

Now that you have a knowledge base, you can test it in Language Studio.

1. Save the changes to your knowledge base by selecting the **Save** button under the **Question answer pairs** tab on the left.

    ![](../Images/ai15l27.png) 

1. After the changes have been saved, select the **Test (1)** button to open the test pane.

    - In the test pane, at the top, deselect **Include short answer response (2)** (if not already unselected).
    
      ![](../Images/ai15l28.png)     
    
1. Then at the bottom enter the message `Hello`. A suitable response should be returned.

    ![](../Images/ai15l29.png) 

1. In the test pane, at the bottom enter the message `What is Microsoft Learn?`. An appropriate response from the FAQ should be returned.

    ![](../Images/ai15l30.png) 

1. Enter the message `Thanks!` An appropriate chit-chat response should be returned.

    ![](../Images/ai15l31.png) 

1. Enter the message `Tell me about Microsoft credentials`. The answer you created should be returned along with a follow-up prompt link.

    ![](../Images/ai15l32.png) 

1. Select the **Credentials** follow-up link. The follow-up answer with a link to the Credentials page should be returned.

1. When you're done testing the knowledge base, close the test pane.



