#!/bin/bash

# Set repository details
REPO_DIR="/Users/anom/git/bounty-targets" # Replace with your local repo path
BRANCH="main" # Replace with your branch name
COMMIT_MESSAGE="Automated update to .dockerignore"

# Navigate to the repository
cd "$REPO_DIR" || { echo "Repo directory not found"; exit 1; }

# Pull the latest changes
git pull origin "$BRANCH"

# Check if the .dockerignore file needs updating
if ! grep -q "example-pattern" .dockerignore; then
    echo "Pattern not found; updating .dockerignore"
    echo "new-pattern" >> .dockerignore

    # Add, commit, and push the changes
    git add .dockerignore
    git commit -m "$COMMIT_MESSAGE"
    git push origin "$BRANCH"
    echo "Changes pushed to the repository."
else
    echo "No changes needed in .dockerignore"
fi
