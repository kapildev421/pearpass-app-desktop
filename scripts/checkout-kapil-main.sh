#!/bin/bash

# Script to checkout 'tether-main' branch from 'tether/main' for all submodules

git submodule foreach '
  echo "Processing submodule: $name"
  
  # Check if remote tether exists
  if git remote | grep -q "^tether$"; then
    # Check if tether-main branch already exists locally
    if git show-ref --verify --quiet refs/heads/tether-main; then
        echo "  Branch tether-main already exists. Checking it out..."
        git checkout tether-main
        echo "  Pulling latest from tether/main..."
        git pull tether main || echo "  Warning: Failed to pull from tether/main for $name"
    else
        echo "  Creating and checking out branch tether-main from tether/main..."
        git checkout -b tether-main tether/main || echo "  Warning: Failed to checkout tether-main for $name (maybe tether/main does not exist?)"
    fi
  else
    echo "  Warning: Remote tether does not exist for $name"
  fi
'
