# Function to clone a repository and change directory
clone_and_cd() {
  REPO_URL=$1

  # Check if a URL was provided
  if [ -z "$REPO_URL" ]; then
    echo "Error: No repository URL provided."
    return 1
  fi

  echo "Cloning repository: $REPO_URL"
  # Clone the repository
  git clone "$REPO_URL"

  # Check if git clone was successful
  if [ $? -ne 0 ]; then
    echo "Error: git clone failed."
    return 1
  fi

  # Determine the directory name from the URL
  # Removes the .git extension and extracts the last part of the path
  REPO_DIR=$(basename "$REPO_URL" .git)

  echo "Changing directory to: $REPO_DIR"
  # Change into the new directory
  cd "$REPO_DIR" || {
    echo "Error: Failed to change directory to $REPO_DIR"
    return 1
  }

  echo "Now inside $REPO_DIR. Ready to install files."

  # >>>>> Place your installation commands here <<<<<
  # Example commands:
  # echo "Starting installation..."
  # npm install
  # make build
  #./install.sh
  mv -f $(pwd)/init.lua ~/.config/nvim
  mv -f $(pwd)/colorscheme.lua ~/.config/nvim/lua/plugins/
  mv -f $(pwd)/nvim-tree.lua ~/.config/nvim/lua/plugins/

  echo "Installation complete."
}

# --- How to use the function ---
# Replace with the URL of the repository you want to clone
# Example: clone_and_install.sh https://github.com

# Check if a URL argument was provided when executing the script
if [ -z "$1" ]; then
  echo "Usage: $0 <repository_url>"
  exit 1
fi

# Call the function with the provided URL
# clone_and_cd "$1"
clone_and_cd "$1"
