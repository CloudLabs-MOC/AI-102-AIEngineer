@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your subscription and resource group
set subscription_id=YOUR_SUBSCRIPTION_ID
set resource_group=YOUR_RESOURCE_GROUP
set location=YOUR_LOCATION_NAME

rem Get random numbers to create unique resource names
set unique_id=!random!!random!

echo Creating storage...
call az storage account create --name ai102str!unique_id! --subscription !subscription_id! --resource-group !resource_group! --location !location! --sku Standard_LRS --encryption-services blob --default-action Allow --output none

echo Uploading files...

REM Get storage key (single line – batch safe)
for /f "delims=" %%k in ('az storage account keys list --subscription !subscription_id! --resource-group !resource_group! --account-name ai102str!unique_id! --query "[0].value" -o tsv') do set AZURE_STORAGE_KEY=%%k

REM Sanity check (must print a long key)
echo Storage key length: !AZURE_STORAGE_KEY!

REM Create container
call az storage container create --name margies --account-name ai102str!unique_id! --auth-mode key --account-key !AZURE_STORAGE_KEY!

REM Wait until container REALLY exists
echo Waiting for container to be available...
set CONTAINER_READY=false

:wait_loop
for /f %%c in ('az storage container exists --name margies --account-name ai102str!unique_id! --auth-mode key --account-key !AZURE_STORAGE_KEY! --query exists -o tsv') do set CONTAINER_READY=%%c
if "!CONTAINER_READY!"=="true" (echo Container is ready.) else (echo Container not ready yet. Waiting... & timeout /t 5 >nul & goto wait_loop)

REM Upload blobs
call az storage blob upload-batch --destination margies --source data --account-name ai102str!unique_id! --auth-mode key --account-key !AZURE_STORAGE_KEY!

echo Creating cognitive services account...
call az cognitiveservices account create --kind CognitiveServices --location !location! --name ai102cog!unique_id! --sku S0 --subscription !subscription_id! --resource-group !resource_group! --yes --output none

echo Creating search service...
echo (If this gets stuck at '- Running ..' for more than a minute, press CTRL+C then select N)
call az search service create --name ai102srch!unique_id! --subscription !subscription_id! --resource-group !resource_group! --location !location! --sku basic --output none

echo -------------------------------------
echo Storage account: ai102str!unique_id!
call az storage account show-connection-string --subscription !subscription_id! --resource-group !resource_group! --name ai102str!unique_id!
echo ----
echo Cognitive Services account: ai102cog!unique_id!
call az cognitiveservices account keys list --subscription !subscription_id! --resource-group !resource_group! --name ai102cog!unique_id!
echo ----
echo Search Service: ai102srch
echo  Url: https://ai102srch!unique_id!.search.windows.net
echo  Admin Keys:
call az search admin-key show --subscription !subscription_id! --resource-group !resource_group! --service-name ai102srch!unique_id!
echo  Query Keys:
call az search query-key list --subscription !subscription_id! --resource-group !resource_group! --service-name ai102srch!unique_id!

