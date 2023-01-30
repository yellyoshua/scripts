
function merge-dev() {
  # Check if directory is a git repository
  if [ ! -d .git ]; then
    echo "Error: Current directory is not a git repository."
    return 1
  fi

  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  PROHIBITED_BRANCHES=("development" "staging" "production")

  # Check if current branch be different from $PROHIBITED_BRANCHES
  if [[ " ${PROHIBITED_BRANCHES[@]} " =~ " ${CURRENT_BRANCH} " ]]; then
    echo "Error: Current branch cannot be development, staging or production."
    return 1
  fi

  # Check if current branch has uncommited changes
  if [ -n "$(git status --porcelain)" ]; then
    echo "Error: Current branch has uncommited changes."
    return 1
  fi

  echo "Merging development into $CURRENT_BRANCH..."

  git checkout development
  git pull origin development

  git checkout $CURRENT_BRANCH
  git merge development --no-ff

  echo "Done."
}
