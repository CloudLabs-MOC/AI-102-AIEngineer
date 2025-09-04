# AI-102: Azure AI Engineer Associate Workshop

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’re excited to guide you through hands-on learning with Azure AI services using Azure AI Foundry, the Azure portal, and tools like Document Intelligence, Custom Vision, the Language Service, etc., to create, deploy, and test intelligent solutions.

# Lab 12: Develop a multi-agent solution with Semantic Kernel

### Overall Estimated Duration: 60 Minutes

## Overview

Here’s a concise overview for Lab 12 in the style of your previous lab summaries:

---

## Overview

In this lab, you developed a multi-agent solution using the **Semantic Kernel SDK** in Azure AI Foundry. You created two AI agents: the *Incident Manager*, which analyzes service log files to detect potential issues and recommend resolutions, and the *DevOps Assistant*, which executes corrective actions and updates the logs. You configured the agents, defined turn-taking and termination strategies for their group chat, and tested their collaboration using sample log files. Finally, you verified that the log files were updated correctly and that the agents’ interactions achieved the intended results.

## Objectives

By the end of this lab, you will be able to:

1. **Create AI agents using the Semantic Kernel SDK**: Build and configure two distinct agents — an *Incident Manager* and a *DevOps Assistant* — within an Azure AI Foundry project.
2. **Define group chat behavior**: Set up rules for turn-taking and termination to ensure effective collaboration between agents.
3. **Test agents with log files**: Provide sample service log files as input, observe how the Incident Manager analyzes issues, and how the DevOps Assistant applies corrective actions.
4. **Validate outputs**: Confirm that the log files were updated and that the agents worked together to resolve issues.

## Pre-requisites

* Basic understanding of AI agents and their roles in collaborative problem-solving.
* Familiarity with the **Semantic Kernel SDK** concepts like planners, skills, and connectors.
* Experience with the **Azure portal** and navigating **Azure AI Foundry**.
* An active Azure subscription with access to **Azure AI Foundry**.
* Permissions to create and manage resources within the assigned resource group (for example, Azure AI User role).

## Architecture

The lab architecture demonstrates how two AI agents collaborate using the **Semantic Kernel SDK** inside an Azure AI Foundry project:

1. **Azure AI Foundry Project**: The central workspace that hosts the deployed model and provides endpoints for the Semantic Kernel–based agents.
2. **Incident Manager Agent**: An agent responsible for parsing and analyzing service log files, detecting issues, and recommending corrective actions.
3. **DevOps Assistant Agent**: A supporting agent that executes corrective steps suggested by the Incident Manager and updates the service log accordingly.
4. **Group Chat Orchestration**: A coordination mechanism that defines agent turn-taking rules and sets termination criteria for the conversation.
5. **Updated Log File**: The output file reflecting both the analysis of detected issues and the corrective actions performed.

## Architecture Diagram

![](../Images/lab08archdiagram.png)

## Explanation of Components

1. **Azure AI Foundry Project**: Provides the environment to deploy the model, configure Semantic Kernel agents, and manage experiments.
2. **Semantic Kernel SDK**: A framework used to build, orchestrate, and manage the multi-agent workflow. It provides APIs for agent communication, memory, and plugins.
3. **Incident Manager Agent**: Detects problems in service logs, prioritizes them, and recommends corrective actions for resolution.
4. **DevOps Assistant Agent**: Applies the corrective actions suggested, modifies the log file accordingly, and ensures changes are tracked.
5. **Group Chat Mechanism**: Ensures structured dialogue between agents by enforcing rules for how agents take turns and when the conversation ends.
6. **Log Files**: Serve as both input (service data) and output (updated with fixes), acting as the ground truth for testing the multi-agent workflow.

# Getting Started with lab

Welcome to your AI-102: Azure AI Engineer Associate workshop! We’ve prepared an interactive environment for you to explore generative AI concepts and work with Microsoft Azure services like Azure AI Foundry, Document Intelligence, Custom Vision, Language Service etc. Let’s get started and make the most of this hands-on experience.

## Accessing Your Lab Environment
 
Once you're ready to dive in, your virtual machine and **lab guide** will be right at your fingertips within your web browser.
 
![Access Your VM and Lab Guide](../Images/lab08labvm.png)

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

