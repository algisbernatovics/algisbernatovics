#!/bin/bash

# GitHub Topics Setup Script
# This script adds topics to all your repositories for better discoverability
# Usage: bash add_topics.sh

# Set your GitHub username and token
GITHUB_USER="algisbernatovics"
GITHUB_TOKEN="your_personal_access_token_here"  # Create at https://github.com/settings/tokens

# Function to add topics to a repo
add_topics() {
    local repo=$1
    local topics=$2
    
    echo "Adding topics to $repo..."
    
    curl -X PUT \
      -H "Authorization: token $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github.v3+json" \
      "https://api.github.com/repos/$GITHUB_USER/$repo/topics" \
      -d "{\"names\": [$topics]}"
    
    echo "✓ Done: $repo"
}

# Add topics to each repository

# Full-Stack Apps
add_topics "article-feed-app" "\"php\", \"mvc\", \"twig\", \"fastroute\""
add_topics "laravel-banking-app" "\"laravel\", \"php\", \"banking\", \"authentication\""
add_topics "cv-generator-app" "\"nextjs\", \"typescript\", \"react\", \"tailwind\""
add_topics "rick-and-morty-nextjs" "\"nextjs\", \"typescript\", \"react\", \"api-client\""
add_topics "rick-and-morty-api-client" "\"php\", \"api-client\", \"guzzle\", \"caching\""
add_topics "youtube-lite-viewer" "\"laravel\", \"php\", \"google-api\", \"vite\""

# Algorithm/Exercise Repos
add_topics "codelex-coursework" "\"php\", \"coursework\", \"education\", \"cli\""
add_topics "crypto-api-client" "\"php\", \"api-client\", \"guzzle\", \"curl\""
add_topics "currency-converter-app" "\"php\", \"api-client\", \"cli\""
add_topics "fast-route-demo" "\"php\", \"routing\", \"fastroute\""
add_topics "foobarqix-extended" "\"php\", \"kata\", \"testing\", \"phpunit\""
add_topics "gif-search-app" "\"php\", \"api-client\", \"mvc\", \"twig\""
add_topics "interval-overlap-checker" "\"php\", \"algorithm\", \"testing\""
add_topics "permutation-counter" "\"php\", \"algorithm\", \"dynamic-programming\""
add_topics "pouring-water-puzzle" "\"php\", \"algorithm\", \"bfs\""
add_topics "rock-paper-scissors-game" "\"php\", \"game\", \"oop\""
add_topics "tic-tac-toe-validator" "\"php\", \"algorithm\", \"testing\""
add_topics "typescript-exercises" "\"typescript\", \"javascript\", \"cli\", \"education\""
add_topics "user-list-manager" "\"php\", \"class-design\", \"testing\""
add_topics "nginx-config-manager" "\"bash\", \"shell\", \"devops\", \"nginx\""

echo ""
echo "=========================================="
echo "✅ All topics added successfully!"
echo "=========================================="
