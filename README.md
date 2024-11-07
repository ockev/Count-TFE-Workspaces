# Terraform Enterprise Workspace Counter

This script fetches and counts all workspaces in a specified Terraform Enterprise (TFE) organization, handling pagination to accommodate large numbers of workspaces.

## Prerequisites

- **Terraform Enterprise API Token**: You'll need a TFE API token with sufficient permissions to view workspaces in your organization.
- **`jq`**: The script uses `jq` to parse JSON responses. Install `jq` if you haven't already:
  
  - **macOS**: `brew install jq`
  - **Debian/Ubuntu**: `sudo apt update && sudo apt install jq`
  - **RHEL/CentOS**: `sudo yum install jq`

- Export required environment variables locally before executing
  - export TFE_TOKEN="your_tfe_token_here"
  - export ORG_NAME="your_org_name_here"

