# AI-102: Azure AI Engineer Associate Workshop

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’re excited to guide you through hands-on learning with Azure AI services using Azure AI Foundry, the Azure portal, and tools like Document Intelligence, Custom Vision, the Language Service, etc., to create, deploy, and test intelligent solutions.

# Lab 16: Create a language understanding model with the Language service

### Overall Estimated Duration: 60 Minutes

## Overview

In this lab, you will build a conversational language understanding model using the Azure AI Language service. You will start by provisioning a Language resource and creating a new project in Language Studio. Next, you will define intents and sample utterances, then train and test the model to evaluate its performance. You will enhance the model further by adding entities and retraining it for improved accuracy. Finally, you will integrate the deployed model with a Python client application to process user queries and generate intelligent responses.

## Objectives

By the end of this lab, you will be able to:

1. **Provision an Azure AI Language resource**: Create and configure a Language service resource in the Azure portal, then collect the keys and endpoint required for model development.

1. **Create a conversational language understanding project**: Use Language Studio to define a new project with its name, primary language, and description as the foundation for your conversational model.

1. **Create intents**: Define intents such as GetTime, GetDay, and GetDate to represent the goals behind user utterances.

1. **Label each intent with sample utterances**: Provide example phrases for each intent so the model can learn to map user inputs to the correct intent.

1. **Train and test the model**: Train the model on defined intents and utterances, then evaluate its accuracy using sample queries and review metrics like precision, recall, and F1 score.

1. **Add entities**: Enhance the model by adding entities (learned, list, or prebuilt) to extract specific details like locations, weekdays, and dates from user utterances.

1. **Retrain the model**: Retrain and redeploy the model after adding entities to improve performance, then validate predictions through additional testing.

1. **Use the model from a client app**: Configure and extend a Python client application to connect with the deployed model, send user queries, and generate responses based on predicted intents and extracted entities.

## Pre-requisites

* Basic understanding of question answering systems and knowledge bases.
* Familiarity with **Azure AI Language** concepts, including projects, knowledge bases, and REST endpoints.
* Experience with the **Azure portal** and navigating **Language Studio**.
* Basic knowledge of Python and experience working in **Cloud Shell** or similar terminal environments.

## Architecture

The lab architecture demonstrates how a **Conversational Language Understanding (CLU)** solution is built and accessed using **Azure AI Language**:

1. **Azure AI Language Resource**: The core service that hosts the conversational language understanding model, providing endpoints and API keys for client applications.

1. **Language Studio**: Defines the project structure with intents, utterances, and entities, and manages training, testing, and deployment of the model.

1. **Intents and Entities**: Intents capture the purpose behind user queries (e.g., GetTime, GetDay, GetDate), while entities extract specific details such as dates, weekdays, or locations.

1. **REST Endpoint**: Publishes the trained CLU model as a deployable service that external applications can call for predictions.

1. **Python Client App (Cloud Shell)**: Connects to the deployed CLU model using the endpoint and key, sends user utterances, and receives predicted intents and extracted entities.

1. **User Interaction**: Users provide input through the Python app, and the system returns intent predictions and entity values, demonstrating how the model interprets and processes natural language queries.

## Architecture Diagram

![](../Images/lab15archdiagram.png)

## Explanation of Components

1. **Azure AI Language Resource**: Provides the service environment to host the question answering capabilities, manage API keys, and expose endpoints for client applications.

2. **Language Studio Project**: Enables creation and management of the knowledge base, including importing FAQs, adding chit-chat content, and organizing question-answer pairs, alternate questions, and follow-up prompts.

3. **Knowledge Base**: Stores all questions, answers, and conversational flows, supporting context-aware responses and multi-turn interactions.

4. **REST Endpoint**: Exposes the deployed knowledge base to external applications, allowing programmatic access to submit questions and retrieve answers.

5. **Python Client App (Cloud Shell)**: Connects to the deployed knowledge base using the endpoint and key, providing an interactive interface to submit questions and display answers along with confidence scores and sources.

6. **User Interaction**: Users enter questions through the app, and the system returns responses from the knowledge base, including follow-up prompts for multi-turn conversations, demonstrating the knowledge base’s ability to provide accurate and context-sensitive answers.

# Getting Started with lab

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’ve prepared an interactive environment for you to explore generative AI concepts and work with Microsoft Azure services like Azure AI Foundry, Document Intelligence, Custom Vision, Language Service, etc. Let’s get started and make the most of this hands-on experience.

## Accessing Your Lab Environment
 
Once you're ready to dive in, your virtual machine and **lab guide** will be right at your fingertips within your web browser.
 
![Access Your VM and Lab Guide](../Images/lab15labvm.png)

### Virtual Machine & Lab Guide
 
Your virtual machine is your workhorse throughout the workshop. The lab guide is your roadmap to success.

## Exploring Your Lab Resources
 
To get a better understanding of your lab resources and credentials, navigate to the **Environment** tab.
 
![Explore Lab Resources](../Images/envtab.png)

## Managing Your Virtual Machine
 
Feel free to **Start, Restart, or Stop (2)** your virtual machine as needed from the **Resources (1)** tab. Your experience is in your hands!
 
![Manage Your Virtual Machine](../Images/resourcetab.png)

## Lab Progress

You can use the **Progress** tab to track your progress while working on the lab. A score will be provided after successful validation.

![](../Images/progresstab.png)

## Utilizing the Split Window Feature
 
For convenience, you can open the lab guide in a separate window by selecting the **Split Window** button from the top right corner.
 
![Use the Split Window Feature](../Images/splitwindow.png)

## Lab Guide Zoom In/Zoom Out
 
To adjust the zoom level for the environment page, click the **A↕: 100%** icon located next to the timer in the lab environment.

![](../Images/zoominai102.png)

## Let's Get Started with Azure Portal
 
1. On your virtual machine, click on the Azure Portal icon as shown below:
 
   ![Launch Azure Portal](../Images/azureportalicon.png)

1. In the sign-in window, kindly sign in using the provided Azure credentials

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

        ![](../Images/AI-l16-0.png)

    - **Password:** <inject key="AzureAdUserPassword"></inject>

        ![](../Images/AIl16-1.png)

1. If prompted to **Stay signed in?**, you can click **No**.

    ![](../Images/AIl16-2.png)

1. If a **Welcome to Microsoft Azure** pop-up window appears, simply click **Cancel** to skip the tour.

    ![](../Images/AIl16-3.png)


## Support Contact
 
The CloudLabs support team is available 24/7, 365 days a year, via email and live chat to ensure seamless assistance at any time. We offer dedicated support channels explicitly tailored for both learners and instructors, ensuring that all your needs are promptly and efficiently addressed.
 
Learner Support Contacts:
 
- Email Support: cloudlabs-support@spektrasystems.com
- Live Chat Support: https://cloudlabs.ai/labs-support

Click on **Next** from the lower right corner to move on to the next page.

   ![Start Your Azure Journey](../Images/nextpage.png)

## Happy Learning !!


