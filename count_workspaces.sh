#!/bin/bash

# Set the Terraform Enterprise token and organization name
#TFE_TOKEN="YOUR_TFE_TOKEN"
#ORG_NAME="YOUR_ORG_NAME"

# Initialize variables for pagination and counting
PAGE=1
PAGE_SIZE=100
TOTAL_WORKSPACES=0

# Loop through each page of results
while true; do
  # Fetch a page of workspaces
  RESPONSE=$(curl -s \
    --header "Authorization: Bearer $TFE_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    "https://app.terraform.io/api/v2/organizations/$ORG_NAME/workspaces?page%5Bsize%5D=$PAGE_SIZE&page%5Bnumber%5D=$PAGE")
  
  # Debug: Print the API response for the current page
  echo "Response for page $PAGE:"
  echo "$RESPONSE" | jq '.'

  # Count the number of workspaces in the current page
  WORKSPACE_COUNT=$(echo "$RESPONSE" | jq '.data | length')
  
  # Add the count to the total
  TOTAL_WORKSPACES=$((TOTAL_WORKSPACES + WORKSPACE_COUNT))
  
  # Break the loop if there are no more workspaces in the response
  if [ "$WORKSPACE_COUNT" -lt "$PAGE_SIZE" ]; then
    break
  fi
  
  # Move to the next page
  PAGE=$((PAGE + 1))
done

echo "Total workspaces: $TOTAL_WORKSPACES"
