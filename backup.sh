EPO_URL="https://github.com/descartes-underwriting/devops-technical-test-data.git"
BRANCH_NAME=$(date +'%d-%m-%Y')"-test"
BACKUP_DIR="data"
#SHA=$(git ls-remote $REPO_URL $BRANCH_NAME | awk '{ print $1 }')

# Create backup directory
mkdir -p $BACKUP_DIR

# Clone the repository with only the specific branch
#git clone --branch $BRANCH_NAME --single-branch $REPO_URL $BACKUP_DIR

# Change directory to the cloned repository
cd $BACKUP_DIR

git rev-list --reverse $START_COMMIT..HEAD | while read commit; do
    # Create backup folder based on SHA1
    backup_folder="$BACKUP_BASE_DIR/$(git show --format=%H -s $commit)"
    mkdir -p $backup_folder


# Get the latest commit hash
#COMMIT_HASH=$(git rev-parse HEAD)

# Create a folder based on the commit hash
#mkdir -p $COMMIT_HASH

# Copy modified files to the backup folder
git diff-tree --no-commit-id --name-only -r $COMMIT_HASH | xargs -I {} cp --parents {} $COMMIT_HASH

# Create a tarball of the backup folder
#tar -czf $COMMIT_HASH.tar.gz $COMMIT_HASH

# Clean up the temporary backup folder
#rm -r $COMMIT_HASH

# Move the tarball to a central location or upload it to cloud storage

# Print a success message
echo "Backup completed for commit: $COMMIT_HASH"
