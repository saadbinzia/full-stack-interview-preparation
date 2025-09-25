#!/bin/bash

# Auto-commit script for interview preparation guide
# Usage: ./auto-commit.sh "Your commit message"

if [ $# -eq 0 ]; then
    echo "Usage: ./auto-commit.sh \"Your commit message\""
    exit 1
fi

COMMIT_MSG="$1"

echo "Adding all changes..."
git add .

echo "Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "Pushing to origin main..."
git push origin main

echo "✅ Auto-commit completed!"
