
function merge-dev() {
  # Check if directory is a git repository
  if [ ! -d .git ]; then
    echo "Error: Current directory is not a git repository."
    return 1
  fi

  ORIGIN_BRANCH=$1
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  PROHIBITED_BRANCHES=("development" "staging" "production")


  if [ -z "$ORIGIN_BRANCH" ]; then
    ORIGIN_BRANCH="development"
  fi

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

  echo "Merging ${ORIGIN_BRANCH} into $CURRENT_BRANCH..."

  git checkout $ORIGIN_BRANCH
  git pull origin $ORIGIN_BRANCH

  git checkout $CURRENT_BRANCH
  git merge $ORIGIN_BRANCH --no-ff

  echo "Done."
}
