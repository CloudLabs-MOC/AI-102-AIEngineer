# Getting Started with your AI-103: Azure AI Apps and Agents Developer Associate Workshop

Welcome to your AI-103: Azure AI Apps and Agents Developer Associate workshop! We’re excited to guide you through hands-on learning with Azure AI services using Microsoft Foundry, the Azure portal, and tools like Document Intelligence, Custom Vision, the Language Service, etc., to create, deploy, and test intelligent solutions.

# Lab 02: Explore and compare models

### Overall Estimated Timing: 60 Minutes

## Overview

In this hands-on lab, you will use Microsoft Foundry to explore, compare, and evaluate AI models. You will create a Foundry project, browse the model catalog, and review model details and benchmark data to understand model capabilities. You will then use the model leaderboard to compare models across quality, cost, throughput, and safety metrics, deploy multiple model variants, and test their responses side-by-side in the model playground. Finally, you will generate a synthetic evaluation dataset, run an automated evaluation, and analyze the results to assess model performance and identify opportunities for improvement. 

## Objectives

By the end of this lab, you will be able to:

1. **Create and configure a Microsoft Foundry project:** Set up a Foundry project and the required Azure resources to support model exploration, deployment, and evaluation.

2. **Explore and compare AI models:** Review model details, benchmark results, and leaderboard metrics to understand differences in quality, cost, throughput, and safety.

3. **Deploy and test multiple model variants:** Deploy the *gpt-4.1* and *gpt-4.1-mini* models and interact with them in the Model Playground.

4. **Perform side-by-side model comparisons:** Compare model responses to the same prompts and evaluate differences in reasoning, accuracy, and response style.

5. **Evaluate model performance using synthetic data:** Generate a synthetic dataset, configure an evaluation workflow, and analyze evaluation results to assess model quality, safety, and overall effectiveness.

## Pre-requisites

* Basic knowledge of the Azure portal and Azure resource management.
* Familiarity with generative AI concepts, including AI models, prompts, and model evaluation.
* Basic understanding of Microsoft Foundry and its model catalog.
* Experience navigating web-based development and management portals.

## Architecture

The lab architecture demonstrates how Microsoft Foundry enables model discovery, comparison, deployment, and evaluation within a unified AI development environment:

1. **Microsoft Foundry Project:** A Foundry project provides the workspace where models are explored, deployed, tested, and evaluated using Azure-hosted resources.

2. **Model Catalog and Leaderboard:** The model catalog and leaderboard provide access to available AI models along with benchmark data, enabling comparison across quality, cost, throughput, safety, and supported capabilities.

3. **Model Deployments:** The *gpt-4.1* and *gpt-4.1-mini* models are deployed within the project, making them available for interactive testing and evaluation.

4. **Model Playground:** The playground provides an interactive environment for comparing multiple model deployments side-by-side, allowing users to assess differences in reasoning, accuracy, and response style using the same prompts.

5. **Evaluation Framework:** A synthetic dataset is generated and used to evaluate deployed models against predefined quality and safety criteria, with detailed metrics and analysis available to help identify strengths, weaknesses, and areas for improvement.

## Architecture Diagram

![](../../AI-102/Images/lab9new-arch.png)

## Explanation of Components

1. **Microsoft Foundry Project:** The project serves as the central workspace where AI models are explored, deployed, compared, and evaluated. It provides the resources and environment required for model experimentation and testing.

2. **Model Catalog and Leaderboard:** The model catalog provides access to a variety of AI models, while the leaderboard offers benchmark-based comparisons across metrics such as quality, cost, throughput, and safety to help identify the most suitable model for a given scenario.

3. **Model Deployments:** The *gpt-4.1* and *gpt-4.1-mini* models are deployed within the project, making them available for interactive testing, comparison, and evaluation.

4. **Model Playground:** The playground enables users to interact with deployed models, submit prompts, compare responses side-by-side, and analyze differences in reasoning, accuracy, and response style.

5. **Evaluation and Analysis Framework:** The evaluation framework generates a synthetic dataset, executes automated assessments against selected criteria, and provides detailed metrics and analysis results to help measure model performance, quality, and safety.

## Accessing Your Lab Environment
 
Once you're ready to dive in, your virtual machine and **Guide** will be right at your fingertips within your web browser.
 
![Access Your VM and Lab Guide](../media/ai103-lab2-guidetab.png)

## Virtual Machine & Lab Guide
 
Your virtual machine is your workhorse throughout the workshop. The lab guide is your roadmap to success.

## Lab Guide Zoom In/Zoom Out
 
To adjust the zoom level for the environment page, click the **A↕: 100%** icon located next to the timer in the lab environment.

![](../../AI-102/Images/lab1-z.png)

## Exploring Your Lab Resources
 
To get a better understanding of your lab resources and credentials, navigate to the **Environment** tab.
 
![Explore Lab Resources](../media/ai103-lab2-envtab.png)

## Utilizing the Split Window Feature
 
For convenience, you can open the lab guide in a separate window by selecting the **Split Window** button from the top right corner.
 
![Use the Split Window Feature](../media/ai103-lab2-splittab.png)

## Managing Your Virtual Machine
 
Feel free to **Start, Restart, or Stop (2)** your virtual machine as needed from the **Resources (1)** tab. Your experience is in your hands!
 
![Manage Your Virtual Machine](../../AI-102/Images/resourcetab.png)

## Lab Progress

You can use the **Progress** tab to track your progress while working on the lab. A score will be provided after successful validation.

![](../../AI-102/Images/progresstab.png)

## Let's Get Started with Azure Portal
 
1. On your virtual machine, click on the Azure Portal icon as shown below:
 
    ![Launch Azure Portal](../../AI-102/Images/azureportalicon.png)

1. In the sign-in window, kindly sign in using the provided Azure credentials

    - **Email/Username:** <inject key="AzureAdUserEmail"></inject>

        ![](../../AI-102/Images/AI-l16-0.png)

    - **Password:** <inject key="AzureAdUserPassword"></inject>

        ![](../../AI-102/Images/lab1-p.png)

1. If prompted to **Stay signed in?**, you can click **No**.

    ![](../../AI-102/Images/AIl16-2.png)

1. If a **Welcome to Microsoft Azure** pop-up window appears, simply click **Maybe later** to skip the tour.

    ![](../../AI-102/Images/lab1-w.png)


## Support Contact
 
The CloudLabs support team is available 24/7, 365 days a year, via email and live chat to ensure seamless assistance at any time. We offer dedicated support channels explicitly tailored for both learners and instructors, ensuring that all your needs are promptly and efficiently addressed.
 
Learner Support Contacts:
 
- Email Support: cloudlabs-support@spektrasystems.com
- Live Chat Support: https://cloudlabs.ai/labs-support

Click on **Next** from the lower right corner to move on to the next page.

   ![Start Your Azure Journey](../../AI-102/Images/nextpage.png)

## Happy Learning !!

