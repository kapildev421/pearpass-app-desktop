#!/bin/bash

# Script to fetch 'tether' remote for all submodules

git submodule foreach '
  echo "Processing submodule: $name"
  
  # Check if remote tether exists
  if git remote | grep -q "^tether$"; then
    echo "  Fetching from remote tether..."
    git fetch tether || echo "  Warning: Failed to fetch from tether for $name"
  else
    echo "  Warning: Remote tether does not exist for $name"
  fi
'
