# Lab 19: Translate Text
Azure AI Translator is a service that enables you to translate text between languages. In this exercise, you'll use it to create a simple app that translates input in any supported language to the target language of your choice.

While this lab is based on Python, you can develop text translation applications using multiple language-specific SDKs.

### Task 1: Provision an *Azure AI Translator* resource

If you don't already have one in your subscription, you'll need to provision an **Azure AI Translator** resource.

1. On the Azure portal, search for **Translators (1)** then select **Translators (2)** in the results.

   ![](../Images/ai19l1.png) 

1. Select **+ Create**.

   ![](../Images/ai19l2.png) 

1. Create a resource with the following settings:

    - **Subscription**: Leave your default Azure subscription **(1)**
    - **Resource group**: Select **AI-102-RG19 (2)**
    - Region: Select **<inject key="Region" enableCopy="false" /> (3)**
    - Name: Enter **Translator<inject key="DeploymentID" enableCopy="false"/> (4)**
    - **Pricing tier**: Select **F0 (5)** (*free*), or **S** (*standard*) if F is not available.
    - Select **Review + create (6)**

      ![](../Images/ai19l3.png)     
    
1. Then select **Create** to provision the resource.

1. Wait for deployment to complete, and select **Go to resource group** to go to the resource group.

   ![](../Images/ai19l4.png) 

1. Select the Translator **Translator<inject key="DeploymentID" enableCopy="false"/>**.

   ![](../Images/ai19l5.png) 

1. Navigate to the **Keys and Endpoint (1)** page. Copy and paste the **KEY 1 (2)** and **Location (3)**. You will need the information on this page later in the lab.

   ![](../Images/ai19l6.png) 

> **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:
>
> - Hit the Validate button for the corresponding task. If you receive a success message, you can proceed to the next task.
> - If not, carefully read the error message and retry the step, following the instructions in the lab guide.
> - If you need any assistance, please contact us at cloudlabs-support@spektrasystems.com. We are available 24/7 to help.
 
<validation step="4549feb5-4ca4-4e67-8263-f994108c704e" />
 
---   


### Task 2: Prepare to develop an app in Cloud Shell

To test the text translation capabilities of Azure AI Translator, you'll develop a simple console application in the Azure Cloud Shell.

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

1. In the PowerShell pane, enter the following commands to clone the GitHub repo for this exercise:

    ```
   rm -r mslearn-ai-language -f
   git clone https://github.com/microsoftlearning/mslearn-ai-language
    ```

     ![](../Images/ai19l7.png)

      >**Tip**: As you enter commands into the cloudshell, the ouput may take up a large amount of the screen buffer. You can clear the screen by entering the `cls` command to make it easier to focus on each task.

1. After the repo has been cloned, navigate to the folder containing the application code files:  

    ```
   cd mslearn-ai-language/Labfiles/06-translator-sdk/Python/translate-text
    ```

### Task 3: Configure your application

1. In the command line pane, run the following command to view the code files in the **translate-text** folder:

    ```
   ls -a -l
    ```

     ![](../Images/ai19l8.png)

     The files include a configuration file (**.env**) and a code file (**translate.py**).

1. Create a Python virtual environment and install the Azure AI Translation SDK package and other required packages by running the following command:

    ```
   python -m venv labenv
   ./labenv/bin/Activate.ps1
   pip install -r requirements.txt azure-ai-translation-text==1.0.1
    ```
1. Enter the following command to edit the application configuration file:

    ```
   code .env
    ```

     ![](../Images/ai19l9.png)

     The file is opened in a code editor.

1. Update the configuration values to include the  **key (1)** and a **region (2)** from the Azure AI Translator resource you created (available on the **Keys and Endpoint** page for your Azure AI Translator resource in the Azure portal that you have copied in `Task 1`).

     ![](../Images/ai1910.png)

      > **NOTE**: Be sure to add the *region* for your resource, <u>not</u> the endpoint!

1. After you've replaced the placeholders, within the code editor, use the **CTRL+S** command or **Right-click > Save** to save your changes and then use the **CTRL+Q** command or **Right-click > Quit** to close the code editor while keeping the cloud shell command line open.

### Task 4: Add code to translate text

1. Enter the following command to edit the application code file:

    ```
   code translate.py
    ```

1. Review the existing code. You will add code to work with the Azure AI Translation SDK.

    ![](../Images/ai1911.png)

     >**Tip**: As you add code to the code file, be sure to maintain the correct indentation.

1. At the top of the code file, under the existing namespace references, find the comment **Import namespaces** and add the following code to import the namespaces you will need to use the Translation SDK:

    ```python
   # import namespaces
   from azure.core.credentials import AzureKeyCredential
   from azure.ai.translation.text import *
   from azure.ai.translation.text.models import InputTextItem
    ```

     ![](../Images/ai1912.png)  

      >**Tip**: As you add code to the code file, be sure to maintain the correct indentation.       

1. In the **main** function, note that the existing code reads the configuration settings.
1. Find the comment **Create client using endpoint and key** and add the following code:

    ```python
   # Create client using endpoint and key
   credential = AzureKeyCredential(translatorKey)
   client = TextTranslationClient(credential=credential, region=translatorRegion)
    ```

     ![](../Images/ai1913.png)    

      >**Tip**: As you add code to the code file, be sure to maintain the correct indentation.        

1. Find the comment **Choose target language** and add the following code, which uses the Text Translator service to return list of supported languages for translation, and prompts the user to select a language code for the target language:

    ```python
   # Choose target language
   languagesResponse = client.get_supported_languages(scope="translation")
   print("{} languages supported.".format(len(languagesResponse.translation)))
   print("(See https://learn.microsoft.com/azure/ai-services/translator/language-support#translation)")
   print("Enter a target language code for translation (for example, 'en'):")
   targetLanguage = "xx"
   supportedLanguage = False
   while supportedLanguage == False:
        targetLanguage = input()
        if  targetLanguage in languagesResponse.translation.keys():
            supportedLanguage = True
        else:
            print("{} is not a supported language.".format(targetLanguage))
    ```

     ![](../Images/ai1914.png) 

      >**Tip**: As you add code to the code file, be sure to maintain the correct indentation.       

1. Find the comment **Translate text** and add the following code, which repeatedly prompts the user for text to be translated, uses the Azure AI Translator service to translate it to the target language (detecting the source language automatically), and displays the results until the user enters *quit*:

    ```python
   # Translate text
   inputText = ""
   while inputText.lower() != "quit":
        inputText = input("Enter text to translate ('quit' to exit):")
        if inputText != "quit":
            input_text_elements = [InputTextItem(text=inputText)]
            translationResponse = client.translate(body=input_text_elements, to_language=[targetLanguage])
            translation = translationResponse[0] if translationResponse else None
            if translation:
                sourceLanguage = translation.detected_language
                for translated_text in translation.translations:
                    print(f"'{inputText}' was translated from {sourceLanguage.language} to {translated_text.to} as '{translated_text.text}'.")
    ```

     ![](../Images/ai1915.png) 

      >**Tip**: As you add code to the code file, be sure to maintain the correct indentation. 

1. Save your changes using **CTRL+S**.

1. Then enter the following command to run the program (you maximize the cloud shell pane and resize the panels to see more text in the command line pane):

    ```
   python translate.py
    ```

     ![](../Images/ai1916.png)     

1. When prompted, enter a valid target language from the list displayed (for example `en`, `fr`).

    - Lets provide `en` as a target language **(1)**
    - Enter `C'est un test` as a phrase to be translated **(2)**
    - View the results, which should detect the source language and translate the text to the target language **(3)**

      ![](../Images/ai1917.png) 

      **Here source language is French and it translated the text to the target language English**.

1. Press **Ctrl+C** to navigate back to the directory.

1. Enter the following command to run the program again **(1)**

    ```
   python translate.py
    ```

    - Lets provide `fr` as a target language **(2)**
    - Enter `This is a test` as a phrase to be translated **(3)**
    - View the results, which should detect the source language and translate the text to the target language **(4)**

      ![](../Images/ai1918.png) 

      **Here source language is English and it translated the text to the target language French**.
    
1. When you're done, enter `quit`. You can run the application again and choose a different target language.    


