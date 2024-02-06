#!/bin/bash

# Define repository and branch information
REPO_URL="https://github.com/JihedTR/devops-technical-test-data.git"

git clone --branch $BRANCH $REPO_URL
cd devops-technical-test-data

branch_name=$(date +'%d-%m-%Y')"-test"
git checkout $branch_name

base_directory="data"

commit_count=$(git rev-list --count origin/$branch_name)
commit_number=$(($commit_count - 18))

echo $commit_number

directory_name="${base_directory}/N+${commit_number}"
mkdir -p "$directory_name"

#commit_count=$(git rev-list --count origin/$BRANCH)

#mkdir -p $backup_dir/N$commit_count

MODIFIED_FILES=$(git diff-tree --name-only -r --no-commit-id  origin/$branch_name)

cp $MODIFIED_FILES  $directory_name

git config --local user.email "jihed.trifi@gmail.com"
git config --local user.name "JihedTR"
git add -A
git commit -a -m "Updated "
git push
