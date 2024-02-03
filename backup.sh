#!/bin/bash

# Set variables
REPO_URL="https://github.com/descartes-underwriting/devops-technical-test-data.git"
BRANCH="DD-MM-YYYY-test"
START_COMMIT="282180fe7e5d9cbf297f2f0ef813cffe60ce2328"
BACKUP_BASE_DIR="/path/to/backup/directory"

# Clone the repository
git clone --branch $BRANCH $REPO_URL
cd devops-technical-test-data

# Iterate through commits and perform backup
git rev-list --reverse $START_COMMIT..HEAD | while read commit; do
    # Create backup folder based on SHA1
    backup_folder="$BACKUP_BASE_DIR/$(git show --format=%H -s $commit)"
    mkdir -p $backup_folder

    # Checkout the specific commit
    git checkout $commit

    # Copy changed files to backup folder
    git diff-tree --no-commit-id --name-only -r $commit | \
        xargs -I {} cp --parents {} $backup_folder
done

# Cleanup: return to the latest commit and remove cloned repository
git checkout $BRANCH
cd ..
rm -rf devops-technical-test-data

echo "Backup completed successfully!"
