#!/bin/bash

# Define the current date and patch version
TODAY=$(date +%Y-%m-%d)  # Format: YYYY-MM-DD
PATCH=1  # Example patch version, adjust dynamically if needed (e.g., increment for each build)

# Check for any changes in the repository (you can adjust this to check specific files or services)
CHANGED_FILES=$(git diff --name-only $GITHUB_SHA^ $GITHUB_SHA)  # Adjust for your CI/CD environment

# Check if any files were modified
if [ -z "$CHANGED_FILES" ]; then
  echo "No changes detected. Skipping version tag creation."
  exit 0
fi

# If changes are detected, create a new version tag
NEW_TAG="v$TODAY.$PATCH"
echo "Changes detected in files: $CHANGED_FILES"
echo "Creating version tag: $NEW_TAG"
