# AI-102: Azure AI Engineer Associate Workshop

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’re excited to guide you through hands-on learning with Azure AI services using Azure AI Foundry, the Azure portal, and tools like Document Intelligence, Custom Vision, the Language Service, etc., to create, deploy, and test intelligent solutions.

# Lab 03: Use a prompt flow to manage conversation in a chat app

### Overall Estimated Timing: 60 Minutes

## Overview

In this lab, you will work with **Azure AI Foundry** to design, build, and deploy a prompt flow solution. You’ll begin by creating a project, then construct and configure a flow with system instructions and connect it to a model. You will test the flow in the chat pane using sample prompts to validate its responses and make adjustments as needed. Finally, you’ll deploy the flow as an endpoint, test it directly in the Azure AI Foundry portal, and review connection details that enable integration into client applications. This lab provides practical experience in creating, testing, and deploying prompt flows to deliver generative AI capabilities.

## Objectives

By the end of this lab, you will be able to:

1. **Create an Azure AI Foundry project**: Set up a new project environment to build and manage prompt flows.
2. **Design and configure a prompt flow**: Add system instructions, connect to a model, and adjust flow components.
3. **Test flows in the chat pane**: Run sample queries, review outputs, and refine prompts to improve responses.
4. **Deploy a prompt flow as an endpoint**: Publish your flow, enabling it to be accessed outside the design environment.
5. **Validate the deployed endpoint**: Interact with the deployed flow directly in Azure AI Foundry to confirm functionality.
6. **Retrieve endpoint connection details**: Access deployment information required to integrate the flow into client applications.

## Pre-requisites

- Basic knowledge of navigating the Azure portal.

- Familiarity with AI concepts such as generative AI, language models, and benchmarks.

- An active Azure subscription with access to Azure AI Foundry.

- Permission to create and manage resources (including enabling managed identities).

## Architecture

1. **Azure AI Foundry Resource**: Provisioned via the Azure portal, this resource connects to Azure AI services, manages access via system-assigned identities, and hosts deployed models such as **gpt-4.1** and **Phi-4-mini-instruct**.

2. **Azure AI Foundry Project**: A workspace for deploying and managing models, configuring project settings, creating prompt flows, and accessing endpoints and authorization keys for applications.

3. **Prompt Flow and Chat Playground**: Interactive tools within the project to build, test, and deploy prompt flows, configure system instructions, submit queries to models, analyze responses, and compare model performance for different scenarios.

4. **Storage and Authorization**: Blob storage integrated with managed identities ensures the project and prompt flows have secure access to necessary data and assets.

## Architecture Diagram

![](../Images/lab01archdiagram.png)

## Explanation of Components

1. **Azure AI Foundry Resource**: The core service provisioned in the Azure portal that connects to Azure AI services, hosts deployed models, and manages secure access via system-assigned identities. It serves as the foundation for creating projects, deploying models, and integrating AI capabilities.

2. **Azure AI Foundry Project**: The workspace where you deploy and manage models, configure project-level settings, create prompt flows, and access endpoints and authorization keys. This is where all model-related operations, including deployment, testing, and orchestration, occur.

3. **Models and Endpoints**: AI models such as **gpt-4.1** and **Phi-4-mini-instruct** are deployed within the project and exposed through endpoints. Endpoints enable applications or prompt flows to interact with the models programmatically while ensuring secure access via keys.

4. **Prompt Flow**: A configurable workflow that orchestrates prompts, inputs, and outputs for a generative AI model. It allows you to define interactions, integrate system instructions, and process user queries to automate AI-assisted tasks.

5. **Chat Playground**: An interactive interface for testing deployed models and prompt flows. Users can input queries, provide system instructions, observe responses, and iteratively refine model behavior before integrating it into applications.

6. **Storage Integration and Authorization**: Blob storage connected via managed identities ensures that prompt flows and projects can securely read and store assets required for AI operations, maintaining controlled access to sensitive data.

# Getting Started with lab

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’ve prepared an interactive environment for you to explore generative AI concepts and work with Microsoft Azure services like Azure AI Foundry, Document Intelligence, Custom Vision, Language Service etc. Let’s get started and make the most of this hands-on experience.

## Accessing Your Lab Environment
 
Once you're ready to dive in, your virtual machine and **lab guide** will be right at your fingertips within your web browser.
 
![Access Your VM and Lab Guide](../Images/lab03labvm.png)

### Virtual Machine & Lab Guide
 
Your virtual machine is your workhorse throughout the workshop. The lab guide is your roadmap to success.

## Exploring Your Lab Resources
 
To get a better understanding of your lab resources and credentials, navigate to the **Environment** tab.
 
![Explore Lab Resources](../Images/envtab.png)

## Lab Guide Zoom In/Zoom Out
 
To adjust the zoom level for the environment page, click the **A↕: 100%** icon located next to the timer in the lab environment.

![](../Images/zoominai102.png)

## Utilizing the Split Window Feature
 
For convenience, you can open the lab guide in a separate window by selecting the **Split Window** button from the top right corner.
 
![Use the Split Window Feature](../Images/splitwindow.png)

## Managing Your Virtual Machine
 
Feel free to **Start, Restart, or Stop (2)** your virtual machine as needed from the **Resources (1)** tab. Your experience is in your hands!
 
![Manage Your Virtual Machine](../Images/resourcetab.png)

## Lab Progress

You can use the **Progress** tab to track your progress while working on the lab. A score will be provided after successful validation.

![](../Images/progresstab.png)

## Let's Get Started with Azure Portal
 
1. On your virtual machine, click on the Azure Portal icon as shown below:
 
   ![Launch Azure Portal](../Images/azureportalicon.png)

1. In sign-in window, kindly sign in using the provided Azure credentials

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