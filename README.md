# Git the f*ck out

**Your emergancy git backup system.**

Your house is burning to ashes? Didn't pay your bills and police come raid your house? And all of that while you have unsaved, local-only changes?... While `git-the-f-out` does **not** solve these immediate issues, it **can** quickly commit and push all your local git repositories with one command: `gtfo`

## How it works

### Default Behavior

In its default configuration, `gtfo` searches through all your directories in `/home/current_user/` for git repositories. For each repo, it commits all changes and pushes all branches to remote.

### Configurations

Since there are many individual ways one might want to handle his data, `gtfo` will in future offer many configurations to modify its behavior. At least one "root"-config file `.gtfo` is expected to be in `~/`. <!-- More config-files can be placed in any sub-directory to change the behavior for this dir and all its sub-dirs. -->

| config | default | description |
| ------ | ------- | ----------- |
| home-dir | /home/$(whoami) | path to home directory |
| commit_message | ${date}_emergancy_gtfo_backup | branch name & commit message of the new emergancy commits and branches |
| exclude_dirs | ("$home_dir/.local") | directories, which will be ignored |
