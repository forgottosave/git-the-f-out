#!/usr/bin/env bash

# GENERAL SCRIPT SETUP

time=$(date +"%Y%m%d-%H%M%S")
TEXT_DEFAULT='\033[0;0m'
TEXT_BOLD='\033[0;1m'
TEXT_CURSIVE='\033[0;3m'
TEXT_RED='\033[0;31m'
TEXT_GREEN='\033[0;32m'
TEXT_YELLOW='\033[0;33m'

print_okay() {
    printf "${TEXT_GREEN}${1}${TEXT_DEFAULT}${2}\n"
}
print_info() {
    printf "${TEXT_BOLD}${1}${TEXT_DEFAULT}${2}\n"
}
print_warning() {
    printf "${TEXT_YELLOW}${1}${TEXT_DEFAULT}${2}\n"
}
print_error() {
    printf "${TEXT_RED}${1}${TEXT_DEFAULT}${2}\n"
}

VERSION="gtfo 0.1.0"
HELP="${TEXT_BOLD}Git the f*ck out${TEXT_DEFAULT}
House burning down? Better git add, commit, push and git the f*** out. Or use git-the-f-out directly :)
https://github.com/forgottosave/git-the-f-out

${TEXT_BOLD}Options:          Description:${TEXT_DEFAULT}
-h, --help        Display help page.
--version         Display version.
"

# ARGUMENT PARSING
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
        printf "$HELP"
        exit 0
    ;;
    --version)
        printf "$VERSION\n"
        exit 0
    ;;
    *)
        echo "Unknown option: $1"
        exit 1
    ;;
  esac
done

# SETUP VARIABLES & HELPERS

home_dir=("/home/$(whoami)")
commit_message="${time}_emergancy_gtfo_backup"
exclude_dirs=()

source "$home_dir/.gtfo"

prefix_exists_in_excluded() {
    local path="$1"
    for prefix in "${exclude_dirs[@]}"; do
        if [[ "$path" == "$prefix"* ]]; then
            return 0
        fi
    done
    return 1
}

# START BACKUP

# find all git repository paths
repo_paths=$(find "$home_dir" -type d -name ".git" -exec dirname {} \;)

print_info "Git the f*ck out" ", starting emergancy backup..."
while IFS= read -r repo; do   
    
    # check if excluded    
    if prefix_exists_in_excluded "$repo"; then
        print_warning "ignoring $repo"
        continue
    fi

    print_info "checking $repo..."
    cd "$repo"
    
    # check for uncommitted changes
    if [[ -n $(git status --porcelain) ]]; then
        print_okay "  creating branch: " "$commit_message"
        git stash
        git checkout -b "$commit_message"
        git stash pop
        print_okay "  creating commit: " "$commit_message"
        git add .
        git commit -m "$commit_message"
    else
        print_okay "  No changes to commit."
    fi

    # check all local branches for non-pushed commits
    print_okay "  pushing all banches & tags..."
    git push --all origin
    git push --tags origin

done <<< "$repo_paths"
