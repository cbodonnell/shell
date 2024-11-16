# Function to validate a branch name
gbvalid() {
  if ! [[ "$1" =~ ^[a-zA-Z0-9._/-]+$ ]]; then
    echo "Error: Invalid branch name. Branch names can only contain letters, numbers, periods, underscores, slashes, and dashes."
    return 1
  fi
  return 0
}

# Function to create and checkout a new branch
gb() {
  if [ -z "$1" ]; then
    echo "Usage: gb <new-branch-name>"
    return 1
  fi

  gbvalid "$1" || return 1
  
  # Create and checkout the new branch
  git checkout -b "$1"
}

# Function to push the current branch to origin
gup() {
  # Get the current branch name
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  
  # Push the current branch to origin
  git push -u origin "$current_branch"
}

# Function to create a new branch and push it to upstream
gbup() {
  if [ -z "$1" ]; then
    echo "Usage: gbup <new-branch-name>"
    return 1
  fi

  gbvalid "$1" || return 1

  # Create and checkout the new branch using gb function
  gb "$1"
  
  # Push the new branch to upstream using gup function
  gup
}


