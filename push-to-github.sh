#!/bin/bash

# HearthBites - GitHub Push Helper Script
# This script helps you push the project to GitHub

echo "🚀 HearthBites - GitHub Push Helper"
echo "===================================="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: Git is not installed"
    echo "Install git first: sudo apt-get install git"
    exit 1
fi

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    echo "Run this script from /home/l3k/HearthBites directory"
    exit 1
fi

echo "✅ Git repository detected"
echo ""

# Check if remote already exists
if git remote get-url origin &> /dev/null; then
    echo "⚠️  Remote 'origin' already exists:"
    git remote get-url origin
    echo ""
    read -p "Do you want to remove it and add a new one? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote remove origin
        echo "✅ Removed existing remote"
    else
        echo "Keeping existing remote. You can push with: git push -u origin main"
        exit 0
    fi
fi

echo ""
echo "📝 Please provide your GitHub repository details:"
echo ""

# Get GitHub username
read -p "Enter your GitHub username: " github_username

if [ -z "$github_username" ]; then
    echo "❌ Error: Username cannot be empty"
    exit 1
fi

# Get repository name
read -p "Enter repository name (default: HearthBites): " repo_name
repo_name=${repo_name:-HearthBites}

echo ""
echo "🔐 Choose authentication method:"
echo "1. HTTPS (requires Personal Access Token)"
echo "2. SSH (requires SSH key setup)"
read -p "Enter choice (1 or 2): " auth_choice

if [ "$auth_choice" = "1" ]; then
    # HTTPS
    remote_url="https://github.com/${github_username}/${repo_name}.git"
elif [ "$auth_choice" = "2" ]; then
    # SSH
    remote_url="git@github.com:${github_username}/${repo_name}.git"
else
    echo "❌ Invalid choice"
    exit 1
fi

echo ""
echo "📌 Adding remote: $remote_url"
git remote add origin "$remote_url"

if [ $? -eq 0 ]; then
    echo "✅ Remote added successfully!"
else
    echo "❌ Failed to add remote"
    exit 1
fi

echo ""
echo "🚀 Ready to push!"
echo ""
read -p "Do you want to push now? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Pushing to GitHub..."
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 Successfully pushed to GitHub!"
        echo ""
        echo "View your repository at:"
        echo "👉 https://github.com/${github_username}/${repo_name}"
        echo ""
        echo "Next steps:"
        echo "1. Visit your repository"
        echo "2. Add a description and topics"
        echo "3. Enable Issues and Projects"
        echo "4. Set up branch protection"
    else
        echo ""
        echo "❌ Push failed!"
        echo ""
        echo "Common issues:"
        echo "1. Repository doesn't exist on GitHub - Create it first at https://github.com/new"
        echo "2. Authentication failed - Use Personal Access Token or set up SSH keys"
        echo "3. Permission denied - Check your GitHub credentials"
        echo ""
        echo "Manual push command:"
        echo "git push -u origin main"
    fi
else
    echo ""
    echo "Push cancelled. You can push later with:"
    echo "git push -u origin main"
fi

echo ""
echo "📖 For detailed instructions, see GITHUB_PUSH_INSTRUCTIONS.md"


