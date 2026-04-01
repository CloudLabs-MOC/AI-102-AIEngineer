# Lab 33: Extract information from multimodal content

### Estimated Duration : 60 Minutes

## Overview

In this lab, you use Azure Content Understanding to extract information from a variety of content types; including an invoice, an image of a slide containing charts, an audio recording of a voice message, and a video recording of a conference call.

## Lab Objectives

In this lab, you'll perform the following tasks:

* Task 1: Create a Microsoft Foundry project
* Task 2: Download content
* Task 3: Try prebuilt analyzers in Microsoft Foundry
* Task 4: Set up Content Understanding Studio for custom analyzers
* Task 5: Extract information from invoice documents
* Task 6: Extract information from a slide image
* Task 7: Extract information from a voicemail audio recording
* Task 8: Extract information from a video conference recording

## Task 1: Create a Microsoft Foundry project

In this task, you will create a new project in the Microsoft Foundry portal and set up its configuration.

1. Open a new tab in the browser, right-click on the following link [Foundry portal](https://ai.azure.com), then **Copy link** and paste it in a browser tab to log in to **Microsoft Foundry portal**.

1. Click on **Sign in**.
 
    ![](../Images/lab1-s2.png)

1. If prompted, provide the credentials below:
 
   - **Email/Username:** <inject key="AzureAdUserEmail"></inject>
    
     ![](../Images/lab2a-03-11.png)

   - **Password:** <inject key="AzureAdUserPassword"></inject>
    
     ![](../Images/lab1-s4.png)

1. When the **Stay signed in?** window appears, select **No**.

    ![](../Images/lab1-s5.png)
    
    >**Note:** Close any tips or quick start panes that are opened the first time you sign in, and if necessary use the **Foundry** logo at the top left to navigate to the home page, which looks similar to the following image (close the **Help** pane if it's open):

1. At the top of the **Microsoft Foundry** portal, enable the **New Foundry toggle (1)** to switch to the latest Foundry user interface.

1. From the **Select a project to continue** dialog, click the drop-down under **Select or search for a project**, and then select **Create a new project (2)**.

     ![](../Images/lab1-s6.png)

1. In the **Create a project** window, enter **Myproject<inject key="DeploymentID" enableCopy="false"/> (1)** as the project name. Open the **Advanced options (2)** drop-down, fill in the following details, and then click **Create (6)**:

    * Subscription: **Choose Default Subscription (3)**
    * Resource group: **AI-102-RG33 (4)**
    * Microsoft Foundry resource: **Keep as Default**
    * Region: **<inject key="Region" enableCopy="false" /> (5)**

      ![](../Images/lab33-03-1.png)

      >**Note:** Some Azure AI resources are constrained by regional model quotas. In the event of a quota limit being exceeded later in the exercise, there's a possibility you may need to create another resource in a different region.

1. Wait for your project created. It may take a few minutes.

### Task 2: Download content

The content you're going to analyze is in a .zip archive. Download it and extract it in a local folder.

1. In a new browser tab, copy and paste the [content.zip](https://github.com/microsoftlearning/mslearn-ai-information-extraction/raw/main/Labfiles/content/content.zip) from `https://github.com/microsoftlearning/mslearn-ai-information-extraction/raw/main/Labfiles/content/content.zip`.

1. Click on the **folder** icon.

    ![](../Images/ai32l2.png)

1. Right click on **Content** folder **(1)** and then select **Extract All (2)** to extract the downloaded *content.zip* file.

      ![](../Images/ai32l3.png)

1. Enter `C:\LabFiles` **(1)** as destination folder and then select **Extract (2)**.

      ![](../Images/ai32l4.png)

1. View the files it contains. You'll use these files to build various Content Understanding analyzers in this lab.

### Task 3: Try prebuilt analyzers in Microsoft Foundry

Azure Content Understanding includes prebuilt Read and Layout analyzers that can extract text and structural elements from documents without requiring any custom configuration. These prebuilt analyzers are available directly in the Foundry (new) portal as AI Services models.

### Task 3.1: Use the Layout analyzer in the playground

1. From the homepage, select the **Build** tab.

    ![](../Images/lab24-p2t2p1.png)

1. On the Build page, select the **Models (1)** tab to view the models in your project.

1. In the **Models** page, select the **AI Services (2)** tab to view the list of Azure services in Foundry Tools.

    ![](../Images/lab24-p2t2p2.png)

1. In the list of tools, select **Azure Content Understanding - Layout**.

    ![](../Images/lab33-03-2.png)

1. This opens the Layout analyzer playground page, where you can test the layout model on sample data or your own files.

1. In the **Azure Content Understanding - Layout** playground, select **Browse for files**, upload the sample file, and then click **Run analysis**.

    ![](../Images/lab33-03-3.png)

1. Navigate to `C:\LabFiles` **(1)** then select **invoice-1234.pdf (2)** file from the folder where you extracted content files and then **Open (3)**.

      ![](../Images/ai32l8.png)

1. This file contains the following invoice:

    ![](../Images/ai32l11.png)

1. Select **Run analyzer** and wait for analysis to complete.

    ![](../Images/lab33-03-4.png)

1. Review the results. You can view the extracted content either as formatted output or as raw JSON data. Notice that the Layout analyzer extracts text, tables, and structural elements such as paragraphs and sections from the document.

    ![](../Images/lab33-03-5.png)

     > **Note**: The prebuilt **Read** and **Layout** analyzers extract content from documents without requiring a generative AI model. **Read** extracts text elements (words, paragraphs, formulas, and barcodes), while **Layout** additionally extracts tables, figures, document structure, hyperlinks, and annotations. These analyzers are useful for general-purpose content extraction, but they don't extract specific custom fields such as invoice amounts or vendor names.

1. In the **Azure Content Understanding - Layout** playground, select the **Back** button to return to the previous page.

    ![](../Images/lab33-03-6.png)

1. In the list of tools, select **Azure Translator - Text translation**.

    ![](../Images/lab33-03-7.png)

1. In the **Azure Content Understanding - Read** playground, select the same sample file **read_resume.png (1)**, and then click **Run analysis (2)**.

    ![](../Images/lab33-03-8.png)

1. Review the results and notice that Read extracts text without layout analysis.

    ![](../Images/lab33-03-9.png)

## Task 4: Set up Content Understanding Studio for custom analyzers

1. In a new browser tab, open [Content Understanding Studio](https://contentunderstanding.ai.azure.com) at `https://contentunderstanding.ai.azure.com`.

1. If prompted, sign in with the same Azure credentials you used for the Foundry portal.

1. On the **Content Understanding Studio** home page, select **Explore Content Understanding**.

    ![](../Images/lab33-03-10.png)

1. On the **Content Understanding Studio** page, select **Get started**.

    ![](../Images/lab33-03-11.png)

1. In the **Select AI Foundry resource** pane, select the following details, and then click **Next (5)**. 

    * Subscription: **Choose Default Subscription (1)**
    * Resource group: **AI-102-RG33 (2)**
    * Resource group name: **Myproject<inject key="DeploymentID" enableCopy="false"/>-resource (3)**
    * Enable auto-deployment: Select checkbox.
      
      ![](../Images/lab33-03-12.png)

      > **Tip:** Make sure that the **Enable autodeployment for required models if no defaults are available** checkbox is selected. This ensures your resource is set up with the required `GPT-4.1`, `GPT-4.1-mini`, and `text-embedding-3-large` models that custom analyzers need.

1. In the **Review configuration** pane, verify the details and then select **Save**.

    ![](../Images/lab33-03-13.png)

1. Navigate to `C:\LabFiles` **(1)** then select the **invoice-1235.pdf (2)** from the folder where you extracted the content files and then **Open (3)**.

    ![](../Images/ai32l23.png)


### Task 5: Extract information from invoice documents

You are going to build a custom Azure Content Understanding analyzer that can extract specific fields from invoices. You'll create a project in Content Understanding Studio, define a schema based on a sample invoice, and then build a reusable analyzer.

### Task 5.1: Create a storage account

1. Open the [Azure portal](https://portal.azure.com) at `https://portal.azure.com`, and sign in using your Azure credentials.

1. In the Azure Portal tab, in the top search bar, search for **Storage accounts (1)** and select **Storage accounts (2)** from the services section.

    ![](../Images/lab9-s29.png)

1. In the **Storage center | Blob Storage** page, select **+ Create** to start creating a new storage account.

    ![](../Images/lab9-s13.png)

1. Create a storage account with the following settings and click **Review + create (8)**
    - **Subscription:** Select default subscription **(1)**
    - **Resource group:** Select **AI-3026-RG33 (2)**
    - **Storage account name:** **stg<inject key="DeploymentID" enableCopy="false"/> (3)**
    - **Region:** Select **<inject key="Region" enableCopy="false" /> (4)**
    - **Preferred storage type:** Azure Blob Storage or Azure Data Lake Storage Gen 2 **(5)**
    - **Performance:** Standard **(6)**
    - **Redundancy:** Locally-redundant storage (LRS) **(7)**

      ![](../Images/lab33-03-15.png)

1. On the **Review + create** tab, select **Create**.

    ![](../Images/lab33-03-16.png)

### Task 5.1: Define a schema for invoice analysis

1. On the **Manage projects and analyzers** page, select **Create**.

    ![](../Images/lab33-03-17.png)

1. In the **Create a new project** pane, then create a project with the following settings:
    - **Project name**: `Invoice analysis` **(1)**
    - **Description**: `Extract data from an invoice` **(2)**
    - choose the type of project that is best for your case: select **Extract content and field with custom schema (3)**
    - expand **Advanced settings (4)**

      ![](../Images/lab33-03-18.png)

    - **Advanced settings**
        - **Connected resource:** Confirm your Foundry resource is selected
        - **Connect storage account:** Select the storage account you just created
        - **Blob container:** click **Create a new container (3)** and enter the container name `content-understanding`, and click **Ok**.
        - Click **Create (5)**

            ![](../Images/lab33-03-19.png)

1. Wait for the project to be created.

    > **Tip:** If an error accessing storage occurs, wait a minute and try again. Permissions for a new resource may take a few minutes to propagate.

1. On the **Invoice analysis** page, select **Browse for files** to upload a file.

    ![](../Images/lab33-03-20.png)

1. In the **Choose a template** pane, select **Invoice (1)**, and then click **Save (2)**.

    ![](../Images/lab33-03-21.png)

1. In the list of suggested fields, select **BillingAddress (1)**. This field is not needed for the invoice format you have uploaded, so use the **Delete field** (**&#128465;**) **(2)** icon that appears at the end in the selected field row to delete it.

    ![](../Images/lab33-03-22.png)

1. In the top bar of the schema tab, select **Suggest**. This will look at the sample invoice and suggest which fields should be a part of your schema. Expand the **Items** field to see which subfields are suggested. Adding those fields will replace your existing schema, so be careful in your projects if you've edited a schema. Select **Save**.

    ![](../Images/lab33-03-23.png)

1. In the **Suggested Fields** pane, select the required fields, and then click **Add selected**.

    ![](../Images/lab33-03-24.png)

1. In the **Confirm schema replacement** dialog box, select **Confirm**.

    ![](../Images/lab33-03-25.png)

1. In the **Schema** tab, select **Add new field**.

    ![](../Images/lab33-03-26.png)

1. In **+ Add new field** button to add the following field **(1)**, selecting **Save** (**&#10003;**) **(2)** for each new field:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `TotalQuantity` | `Total number of items on the invoice` | String | Auto |

    ![](../Images/lab33-03-27.png)

1. Select **Test (1)**, and then click **Run analysis (2)**.

    ![](../Images/lab33-03-28.png)

1. Review the analysis results, which should look similar to this:

    ![](../Images/lab33-03-29.png)

1. View the details of the fields that were identified in the **Fields** pane.

### Task 5.2: Build and test an analyzer for invoices

1. Select the **Build analyzer (1)** button at the top, build a new analyzer with the following properties and click on **Build (4)**
    - **Name**: `invoiceanalyzer` **(2)**
    - **Description**: `Invoice analyzer` **(3)**

      ![](../Images/lab33-03-30.png)

1. When the analyzer has been built, select **Jump to analyzer list** to view all built analyzers. 

    ![](../Images/lab33-03-31.png)

1. In the **Analyzer list**, select the **invoiceanalyzer** link to view the schema fields.

    ![](../Images/lab33-03-32.png)

1. In the **invoiceanalyzer** page, select **Test (1)**, and then click **Browse for files (2)**.

     ![](../Images/lab33-03-33.png)

1. Navigate to `C:\LabFiles` **(1)** then select the **invoice-1235.pdf (2)** from the folder where you extracted the content files and then **Open (3)**.

    ![](../Images/ai32l23.png)

1. Click on **Run analysis** to extract field data from the invoice.

    ![](../Images/lab33-03-36.png)

1. Review the **Fields** pane, and verify that the analyzer extracted the correct fields from the test invoice.

    ![](../Images/lab33-03-34.png)

1. Review the **Results** pane to see the JSON response that the analyzer would return to a client application.

    ![](../Images/lab33-03-35.png)

1. Close the **invoiceanalyzer** page to return to the analyzer list.

## Task 6: Extract information from a slide image

You are going to build a custom Azure Content Understanding analyzer that can extract information from a slide containing charts.

### Task 6.1 Define a schema for image analysis

1. On the **Manage projects and analyzers** page, select **Project list (1)**, and then click **Create (2)**.

    ![](../Images/lab33-03-37.png)

1. In the **Create a new project** pane, then create a project with the following settings:
    - **Project name**: `Slide analysis` **(1)**
    - **Description**: `Extract data from an image of a slide` **(2)**
    - choose the type of project that is best for your case: select **Extract content and field with custom schema (3)**
    - **Advanced settings**: Verify the settings are the same as the last project

      ![](../Images/lab33-03-38.png)

1. Wait for the project to be created.

1. In the **Choose a template** pane, select **Image Analysis (1)**, and then click **Save (2)**.

    ![](../Images/lab33-03-39.png)

1. In the **File** section, click **Browse for files**.

    ![](../Images/lab33-03-40.png)

1. Navigate to `C:\LabFiles` **(1)**, upload the **slide-1.jpg (2)** file from the folder where you extracted content files and then **Open (3)**.

    ![](../Images/ai32l33.png)

1. In the **Schema** tab, select **Add new field**.

    ![](../Images/lab33-03-41.png)

1. Add the following fields **(1)**, selecting **Save changes** (**&#10003;**) **(2)** for each new field:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `Title` | `Slide title` | String | Generate |
    | `Summary` | `Summary of the slide` | String | Generate |
    | `Charts` | `Number of charts on the slide` | Integer | Generate |

    ![](../Images/lab33-03-43.png)

1. Use **+ Add new field** button to add a new field named `QuarterlyRevenue` with the description `Revenue per quarter` with the value type **List of objects** **(1)**. Then, select the **table icon (2)** next to the value type dropdown. 

    ![](../Images/lab33-03-44.png)

1. In the new page for the table subfields that opens, add the following subfields:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `Quarter` | `Which quarter?` | String | Generate |
    | `Revenue` | `Revenue for the quarter` | Number | Generate |

    ![](../Images/lab33-03-45.png)

1. Select **Back** to return to the top level of your schema, 

    ![](../Images/lab33-03-46.png)

1. Select **+ Add new field** button to add a new field named `ProductCategories` with the description `Product categories` with the value type **List of objects** **(1)**. Then, select the **table icon (2)** next to the value type dropdown. 

    ![](../Images/lab33-03-47.png)

1. In the new page for the table subfields that opens, add the following subfields:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `ProductCategory` | `Product category name` | String | Generate |
    | `RevenuePercentage` | `Percentage of revenue` | Number | Generate |

    ![](../Images/lab33-03-48.png)

1. Select **Back** to return to the top level of your schema, and verify that it looks like this. Then select **Save**.

   ![](../Images/lab33-03-49.png)

1. Select **Test (1)**, and then click **Run analysis (2)**.

    ![](../Images/lab33-03-28.png)

1. Review the analysis results, which should look similar to this:

    ![](../Images/lab33-03-50.png)

1. View the details of the fields that were identified in the **Fields** pane, expanding the **QuarterlyRevenue** and **ProductCategories** fields to see the subfield values.

### Task 6.2 Build and test an analyzer

Now that you have defined a schema to extract fields from slides, you can build an analyzer to use with similar slide images.

1. Select the **Build analyzer (1)** button at the top, build a new analyzer with the following properties and click **Build (4)**
    - **Name**: `slideanalyzer` **(2)**
    - **Description**: `Slide image analyzer` **(3)**

     ![](../Images/lab33-03-51.png)

1. When the analyzer has been built, select **Jump to analyzer list** to view all built analyzers. 

    ![](../Images/lab33-03-31.png)

1. In the **Analyzer list**, select the **slideanalyzer** link to view the schema fields.

    ![](../Images/lab33-03-52.png)

1. In the **slideanalyzer** page, select **Test (1)**, and then click **Browse for files (2)**.

     ![](../Images/lab33-03-53.png)

1. Navigate to `C:\LabFiles` **(1)** then select the **slide-2.jpg (2)** from the folder where you extracted the content files and the **Open (3)**.

    ![](../Images/ai32l45.png) 

1. Click on **Run analysis** to extract field data from the invoice.

1. Review the **Fields** pane, and verify that the analyzer extracted the correct fields from the slide image.

    ![](../Images/lab33-03-54.png)

     > **Note**: Slide 2 doesn't include a breakdown by product category, so the product category revenue data is not found.

1. Review the **Results** pane to see the JSON response that the analyzer would return to a client application.

1. Close the **slideanalyzer** page.

## Task 7: Extract information from a voicemail audio recording

You are going to build a custom Azure Content Understanding analyzer that can extract information from an audio recording of a voicemail message.

### Task 7.1 Define a schema for audio analysis

1. On the **Manage projects and analyzers** page, select **Project list (1)**, and then click **Create (2)**.

    ![](../Images/lab33-03-55.png)

1. In the **Create a new project** pane, then create a project with the following settings and click **Create (4)**
    - **Project name**: `Voicemail analysis` **(1)**
    - **Description**: `Extract data from a voicemail recording` **(2)**
    - choose the type of project that is best for your case: select **Extract content and field with custom schema (3)**
    - **Advanced settings**: Verify the settings are the same as the last project

      ![](../Images/lab33-03-56.png)

1. Wait for the project to be created.

1. In the **File** section, click **Browse for files**.

    ![](../Images/lab33-03-57.png)

1. In the **Choose a template** pane, select **Audio analysis (1)**, and then click **Save (2)**.

    ![](../Images/lab33-03-58.png)

1. Navigate to `C:\LabFiles` **(1)**, upload the **call-1.mp3 (2)** file from the folder where you extracted content files and then **Open (3)**.

    ![](../Images/ai32l52.png)    

1. In the **Schema** tab, select **Add new field**.

    ![](../Images/lab33-03-59.png)

1. Add the following fields **(1)**, selecting **Save changes** (**&#10003;**) **(2)** for each new field:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `Caller` | `Person who left the message` | String | Generate |
    | `Summary` | `Summary of the message` | String | Generate |
    | `Actions` | `Requested actions` | String | Generate |
    | `CallbackNumber` | `Telephone number to return the call` | String | Generate |
    | `AlternativeContacts` | `Alternative contact details` | List of Strings | Generate |

    ![](../Images/lab33-03-60.png)

1. Select **Run analysis** and wait for analysis to complete.

    Audio analysis can take some time. While you're waiting, you can play the audio file below:

    **Note**: This audio was generated using AI.

1. Review the analysis results and view the details of the fields that were identified in the **Fields** pane, expanding the **AlternativeContacts** field to see the listed values.

    ![](../Images/lab33-03-61.png)

### Task 7.2 Build and test an analyzer

Now that you have defined a schema to extract fields from voice messages, you can build an analyzer to use with similar audio recordings.

1. Select the **Build analyzer (1)** button at the top, build a new analyzer with the following properties and click **Build (4)**
    
    - **Name**: `voicemailanalyzer` **(2)**
    - **Description**: `Voicemail audio analyzer` **(3)**

       ![](../Images/lab33-03-62.png)

1. When the analyzer has been built, select **Jump to analyzer list** to view all built analyzers. 

    ![](../Images/lab33-03-31.png)

1. In the **Analyzer list**, select the **voicemailanalyzer** link to view the schema fields.

    ![](../Images/lab33-03-63.png)

1. In the **voicemailanalyzer** page, select **Test (1)**, and then click **Browse for files (2)**.

     ![](../Images/lab33-03-64.png)

1. Navigate to `C:\LabFiles` **(1)** then select the **call-2.mp3 (2)** from the folder where you extracted the content files and the **Open (3)**.

    ![](../Images/lab33-03-65.png) 

1. Click on **Run analysis** to extract field data from the invoice.

    **Note**: This audio was generated using AI.

1. Review the **Fields** pane, and verify that the analyzer extracted the correct fields from the voice message.

    ![](../Images/lab33-03-66.png) 

1. Review the **Results** pane to see the JSON response that the analyzer would return to a client application.

1. Close the **voicemail-analyzer** page.

## Task 8: Extract information from a video conference recording

You are going to build a custom Azure Content Understanding analyzer that can extract information from a video recording of a conference call.

### Task 8.1 Define a schema for video analysis

1. On the **Manage projects and analyzers** page, select **Project list (1)**, and then click **Create (2)**.

    ![](../Images/lab33-03-55.png)

1. In the **Create a new project** pane, then create a project with the following settings and click **Create (4)**
    
    - **Project name**: `Conference call video analysis` **(1)**
    - **Description**: `Extract data from a video conference recording` **(2)**
    - choose the type of project that is best for your case: select **Extract content and field with custom schema (3)**

      ![](../Images/lab33-03-67.png)

1. Wait for the project to be created.

1. In the **File** section, click **Browse for files**.

    ![](../Images/lab33-03-57.png)

1. In the **Choose a template** pane, select **Video analysis (1)**, and then click **Save (2)**.

    ![](../Images/lab33-03-68.png)

1. Navigate to `C:\LabFiles` **(1)** then select the **meeting-1.mp4 (2)** file from the folder where you extracted content files and then **Open (3)**.

    ![](../Images/ai32l67.png) 

1. In the **Schema** tab, select **Add new field**.

    ![](../Images/lab33-03-69.png)

1. Add the following fields, selecting **Save changes** (**&#10003;**) for each new field:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `Summary` | `Summary of the discussion` | String | Generate |
    | `Participants` | `Count of meeting participants` | Integer | Generate |
    | `ParticipantNames` | `Names of meeting participants` | List of Strings | Generate |
    | `SharedSlides` | `Descriptions of any PowerPoint slides presented` | List of Strings | Generate |
    | `AssignedActions` | `Tasks assigned to participants` | List of Objects | Generate |

    ![](../Images/lab33-03-79.png)

1. Select **Save (1)**, Then select the table icon **(2)** next to the value type dropdown.

    ![](../Images/lab33-03-70.png)

1. In the new page for the table subfields that opens, add the following subfields:

    | Field name | Field description | Value type | Method |
    |--|--|--|--|
    | `Task` | `Description of the task` | String | Generate |
    | `AssignedTo` | `Who the task is assigned to` | String | Generate |

    ![](../Images/lab33-03-71.png)

1. Select **Back** to return to the top level of your schema, and verify that it looks like this. Then select **Save**.

    ![](../Images/lab33-03-72.png)

1. Select **Run analysis** and wait for analysis to complete.

    ![](../Images/lab33-03-73.png)

    **Note**: This video was generated using AI.

1. When analysis is complete, review the results.

    ![](../Images/lab33-03-74.png)

1. In the **Fields** pane, view the extracted data.

### Task 8.2 Build and test an analyzer

Now that you have defined a schema to extract fields from conference call recordings, you can build an analyzer to use with similar videos.

1. Select the **Build analyzer (1)** button at the top, build a new analyzer with the following properties and click **Build (4)**
    
    - **Name**: `meetinganalyzer` **(2)**
    - **Description**: `Meeting video analyzer` **(3)**

       ![](../Images/lab33-03-75.png)

1. When the analyzer has been built, select **Jump to analyzer list** to view all built analyzers. 

    ![](../Images/lab33-03-31.png)

1. In the **Analyzer list**, select the **meetinganalyzer** link to view the schema fields.

    ![](../Images/lab33-03-76.png)

1. In the **meetinganalyzer** page, select **Test (1)**, and then click **Browse for files (2)**.

     ![](../Images/lab33-03-77.png)

1. Navigate to `C:\LabFiles` **(1)**  upload **meeting-2.mp4 (2)** from the folder where you extracted the content files and then **Open (3)**.

    ![](../Images/ai32l76.png) 

1. Click on **Run analysis** to extract field data from the video file.

1. Review the **Fields** pane, and view the fields that the analyzer extracted for each shot in the conference call video.

     ![](../Images/lab33-03-78.png)

1. Review the **Results** pane to see the JSON response that the analyzer would return to a client application.

1. Close the **meetinganalyzer** page.

## Summary


### You have successfully completed the Hands-on Lab!