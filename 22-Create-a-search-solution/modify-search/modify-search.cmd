@echo off

rem Set values for your Search service
set url=YOUR_SEARCH_URL
set admin_key=YOUR_ADMIN_KEY

rem Set the API version
set api_version=2023-10-01-Preview

echo ----- Updating the skillset...
curl -X PUT %url%/skillsets/margies-skillset?api-version=%api_version% ^
     -H "Content-Type: application/json" ^
     -H "api-key: %admin_key%" ^
     -d @skillset.json

timeout /t 2 /nobreak

echo ----- Updating the index...
curl -X PUT %url%/indexes/margies-index?api-version=%api_version% ^
     -H "Content-Type: application/json" ^
     -H "api-key: %admin_key%" ^
     -d @index.json

timeout /t 2 /nobreak

echo ----- Updating the indexer...
curl -X PUT %url%/indexers/margies-indexer?api-version=%api_version% ^
     -H "Content-Type: application/json" ^
     -H "api-key: %admin_key%" ^
     -d @indexer.json

timeout /t 2 /nobreak

echo ----- Resetting the indexer
curl -X POST %url%/indexers/margies-indexer/reset?api-version=%api_version% ^
     -H "Content-Type: application/json" ^
     -H "Content-Length: 0" ^
     -H "api-key: %admin_key%" 

timeout /t 5 /nobreak

echo ----- Rerunning the indexer
curl -X POST %url%/indexers/margies-indexer/run?api-version=%api_version% ^
     -H "Content-Type: application/json" ^
     -H "Content-Length: 0" ^
     -H "api-key: %admin_key%" 
