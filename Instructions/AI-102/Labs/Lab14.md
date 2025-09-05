
# Lab 14: Analyze Text

### Estimated Duration : 30 Minutes

## Overview

Azure AI Language provides powerful text analysis capabilities, including language detection, sentiment analysis, key phrase extraction, and entity recognition. In this lab, you’ll apply these features to a real-world scenario by analyzing hotel reviews submitted to a travel agency’s website. Using the Azure AI Language Python SDK for text analytics, you’ll build a simple application that identifies the language of each review, determines whether the sentiment is positive, neutral, or negative, and extracts meaningful insights such as main topics, places, or people mentioned. While this exercise uses Python, you can develop similar text analytics solutions in multiple languages using the SDKs provided by Azure AI Language.

## Lab Objectives

- **Task 1:** Provision an Azure AI Language resource

- **Task 2:** Clone the repository for this course

- **Task 3:** Configure your application

- **Task 4:** Add code to connect to your Azure AI Language resource

- **Task 5:** Add code to detect language

- **Task 6:** Add code to evaluate sentiment

- **Task 7:** Add code to identify key phrases

- **Task 8:** Add code to extract entities

- **Task 9:** Add code to extract linked entities

## Task 1: Provision an Azure AI Language resource

In this task, you’ll provision an Azure AI Language resource in your subscription. This will give you the necessary endpoint and authentication key, which you’ll use later to build and test language capabilities in your AI solution.

1. Open the Azure portal at `https://portal.azure.com`, and sign in using the Microsoft account.

1. If prompted, provide the credentials below:

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

        ![](../Images/l14t1p1.png)

    - **Password:** <inject key="AzureAdUserPassword"></inject>

        ![](../Images/l14t1p2.png)

1. When the **Stay signed in?** window appears, select **No**.

    ![](../Images/aifoundrysignin3.png)

    >**Note:** If the **Welcome to Microsoft Azure** window appears, select **Cancel**.

    ![](../Images/l2at2p2.png)

1. On the Azure Portal home page, select **Create a resource**.

    ![](../Images/l14t1p5.png)

1. On the **Create a resource** page, type **Language service** in the search box and press **Enter**. 

    ![](../Images/l14t1p6.png)

1. On the **Marketplace** page, under **Language service**, select the **Create (1)** drop-down and then choose **Language service (2)**.

    ![](../Images/l14t1p7.png)

1. On the **Select additional features** page, click **Continue to create your resource**.

    ![](../Images/l14t1p8.png)

1. Provision the resource with the following settings, then select **Review + create**:

    * Subscription: **Default Subscription (1)**
    * Resource group: **AI-102-RG14 (2)**
    * Region: **<inject key="Region"></inject> (3)**
    * Name: **languageservice<inject key="DeploymentID"></inject> (4)**
    * Pricing tier: **F0 (5)** (*free*) (**S** (*standard*) if F0 isn’t available)
    * Responsible AI Notice: **Agree (6)**

        ![](../Images/l14t1p9.png)

1. On the **Review + create** tab, click **Create** to provision the resource.

    ![](../Images/l14t1p10.png)

1. Wait for deployment to complete, and then click on **Go to resource**.

    ![](../Images/l14t1p11.png)

1. From the left navigation pane, go to **Resource Management (1)** and select **Keys and Endpoint (2)**. Copy the **Endpoint (3)** and **Key (4)**, then save them in a notepad file, you’ll need these details later in the exercise.

    ![](../Images/l14t1p12.png)

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="90093be2-2083-4839-b324-37164c3651c9" />

## Task 2: Clone the repository for this course

In this task, you’ll set up your development environment by cloning the course repository into Azure Cloud Shell. This will give you access to the application code files needed for building and running the lab exercises.

1. On the **Azure portal** homepage, click the **\[>\_] Cloud Shell (1)** button located to the right of the **Copilot** tab at the top. This opens a new Cloud Shell session. In the **Welcome to Azure Cloud Shell** window, choose **PowerShell (2)**.

    ![](../Images/l2at2p3.png)

    >**Note:** The cloud shell provides a command-line interface in a pane at the bottom of the Azure portal. You can resize or maximize this pane to make it easier to work in.

    > **Note:** If you have previously created a cloud shell that uses a **Bash** environment, switch it to **PowerShell**.

1. In the **Getting started** window, ensure **No storage account required (1)** is selected. From the **Subscription** drop-down, choose **Default subscription (2)**, then click **Apply (3)**.

    ![](../Images/l2at2p4.png)

1. In the Cloud Shell toolbar, open the **Settings (1)** menu and choose **Go to Classic version (2)** from the drop-down.

    ![](../Images/l2at2p5.png)

    >**Note:** Ensure you've switched to the classic version of the cloud shell before continuing.

1. In the PowerShell pane, enter the following commands to clone the GitHub repo for this exercise:

    ![](../Images/l14t2p1.png)

    ```
    rm -r mslearn-ai-language -f
    git clone https://github.com/microsoftlearning/mslearn-ai-language
    ```

    > **Note:** As you enter commands into the cloudshell, the ouput may take up a large amount of the screen buffer. You can clear the screen by entering the `cls` command to make it easier to focus on each task.

1. After the repo has been cloned, navigate to the folder containing the application code files:  

    ```
    cd mslearn-ai-language/Labfiles/01-analyze-text/Python/text-analysis
    ```

## Task 3: Configure your application

In this task, you’ll configure the application by setting up a Python virtual environment, installing the required SDK packages, and updating the configuration file with your Azure AI Language resource details. This ensures the app can securely connect to the service and run the text analysis code.

1. In the command line pane, run the following command to view the code files in the **text-analysis** folder:

    ![](../Images/l14t3p1.png)

    ```
    ls -a -l
    ```

    The files include a configuration file (**.env**) and a code file (**text-analysis.py**). The text your application will analyze is in the **reviews** subfolder.

1. Create a Python virtual environment and install the Azure AI Language Text Analytics SDK package and other required packages by running the following command:

    ```
    python -m venv labenv
    ./labenv/bin/Activate.ps1
    pip install -r requirements.txt azure-ai-textanalytics==5.3.0
    ```

1. Enter the following command to edit the application configuration file:

    ![](../Images/l14t3p2.png)

    ```
    code .env
    ```

    The file is opened in a code editor.

1. Update the configuration values to include the  **endpointc (1)** and a **key (2)** from the Azure Language resource you created (available on the **Keys and Endpoint** page for your Azure AI Language resource in the Azure portal).

    ![](../Images/l14t3p3.png)

1. After you've replaced the placeholders, within the code editor, use the **CTRL+S** command or **Right-click > Save** to save your changes and then use the **CTRL+Q** command or **Right-click > Quit** to close the code editor while keeping the cloud shell command line open.

## Task 4: Add code to connect to your Azure AI Language resource

In this task, you’ll update the application code to import the required namespaces and create a client object that connects to your Azure AI Language resource, enabling the app to interact with the Text Analytics API.

1. Enter the following command to edit the application code file:

    ![](../Images/l14t4p1.png)

    ```
    code text-analysis.py
    ```

1. Review the existing code. You will add code to work with the AI Language Text Analytics SDK.

    > **Note:** As you add code to the code file, be sure to maintain the correct indentation.

1. At the top of the code file, under the existing namespace references, find the comment **Import namespaces** and add the following code to import the namespaces you will need to use the Text Analytics SDK:

    ![](../Images/l14t4p2.png)

    ```python
    # import namespaces
    from azure.core.credentials import AzureKeyCredential
    from azure.ai.textanalytics import TextAnalyticsClient
    ```

1. In the **main** function, note that code to load the Azure AI Language service endpoint and key from the configuration file has already been provided. Then find the comment **Create client using endpoint and key**, and add the following code to create a client for the Text Analysis API:

    ![](../Images/l14t4p3.png)

    ```Python
    # Create client using endpoint and key
    credential = AzureKeyCredential(ai_key)
    ai_client = TextAnalyticsClient(endpoint=ai_endpoint, credential=credential)
    ```

1. Save your changes (CTRL+S), then enter the following command to run the program (you maximize the cloud shell pane and resize the panels to see more text in the command line pane):

    ```
    python text-analysis.py
    ```

1. Observe the output as the code should run without error, displaying the contents of each review text file in the **reviews** folder. The application successfully creates a client for the Text Analytics API but doesn't make use of it. We'll fix that in the next section.

    ![](../Images/l14t4p4.png)

## Task 5: Add code to detect language

In this task, you’ll extend the application to use the Text Analytics client to detect the language of each review document and display the identified language in the output.

1. In the code editor, find the comment **Get language**. Then add the code necessary to detect the language in each review document:

    ![](../Images/l14t5p1.png)

    ```python
    # Get language
    detectedLanguage = ai_client.detect_language(documents=[text])[0]
    print('\nLanguage: {}'.format(detectedLanguage.primary_language.name))
    ```

     > **Note**: In this example, each review is analyzed individually, resulting in a separate call to the service for each file. An alternative approach is to create a collection of documents and pass them to the service in a single call. In both approaches, the response from the service consists of a collection of documents; which is why in the Python code above, the index of the first (and only) document in the response ([0]) is specified.

1. Save your changes. Then re-run the program.

1. Observe the output, noting that this time the language for each review is identified.

    ![](../Images/l14t5p2.png)

## Task 6: Add code to evaluate sentiment

In this task, you'll add code to evaluate the sentiment of each review. By doing this, you'll classify the text as positive, negative, neutral, or mixed, which helps in understanding the general tone of the feedback.

1. In the code editor, find the comment **Get sentiment**. Then add the code necessary to detect the sentiment of each review document:

    ![](../Images/l14t6p1.png)

    ```python
    # Get sentiment
    sentimentAnalysis = ai_client.analyze_sentiment(documents=[text])[0]
    print("\nSentiment: {}".format(sentimentAnalysis.sentiment))
    ```

1. Save your changes. Then close the code editor and re-run the program.

1. Observe the output, noting that the sentiment of the reviews is detected.

    ![](../Images/l14t6p2.png)

## Task 7: Add code to identify key phrases

In this task, you'll add code to extract key phrases from the reviews. This will help you identify the main topics or themes discussed in the text, giving deeper insights into what the review is about.

1. In the code editor, find the comment **Get key phrases**. Then add the code necessary to detect the key phrases in each review document:

    ![](../Images/l14t7p1.png)

    ```python
    # Get key phrases
    phrases = ai_client.extract_key_phrases(documents=[text])[0].key_phrases
    if len(phrases) > 0:
            print("\nKey Phrases:")
            for phrase in phrases:
                print('\t{}'.format(phrase))
    ```

1. Save your changes and re-run the program.

1. Observe the output, noting that each document contains key phrases that give some insights into what the review is about.

    ![](../Images/l14t7p2.png)

## Task 8: Add code to extract entities

In this task, you'll add code to detect entities such as people, places, and organizations mentioned in the text. Identifying these entities helps categorize and organize the information contained within the reviews.

1. In the code editor, find the comment **Get entities**. Then, add the code necessary to identify entities that are mentioned in each review:

    ![](../Images/l14t8p1.png)

    ```python
    # Get entities
    entities = ai_client.recognize_entities(documents=[text])[0].entities
    if len(entities) > 0:
            print("\nEntities")
            for entity in entities:
                print('\t{} ({})'.format(entity.text, entity.category))
    ```

1. Save your changes and re-run the program.

1. Observe the output, noting the entities that have been detected in the text.

    ![](../Images/l14t8p2.png)

## Task 9: Add code to extract linked entities

In this task, you'll add code to recognize linked entities, entities with references to external data sources like Wikipedia. This will provide additional context and allow you to connect the extracted information with authoritative resources.

1. In the code editor, find the comment **Get linked entities**. Then, add the code necessary to identify linked entities that are mentioned in each review:

    ![](../Images/l14t9p1.png)

    ```python
    # Get linked entities
    entities = ai_client.recognize_linked_entities(documents=[text])[0].entities
    if len(entities) > 0:
            print("\nLinks")
            for linked_entity in entities:
                print('\t{} ({})'.format(linked_entity.name, linked_entity.url))
    ```

1. Save your changes and re-run the program.

1. Observe the output, noting the linked entities that are identified.

    ![](../Images/l14t9p2.png)

## Summary

In this lab, you connected to the Azure AI Language service and progressively added code to analyze customer reviews. You successfully detected the language of each review, evaluated the sentiment expressed, and extracted meaningful insights including key phrases, entities, and linked entities. By completing these tasks, you gained practical experience in using Azure AI to transform unstructured text into structured data that can drive decision-making and improve understanding of customer feedback.

### You have successfully completed the Hands-on Lab!
