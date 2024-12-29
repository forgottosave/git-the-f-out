# ~~Git the f*ck out~~ Project still under construction 🏗️

**Your emergancy git backup system.**

Your house is burning to ashes? Didn't pay your bills and police come raid your house? And all of that while you have unsaved, local-only changes?... While `git-the-f-out` does **not** solve these immediate issues, it **can** create a quick backup of all your most important files with one command: `gtfo`

## How it works

### Default Behavior

In its default configuration, `gtfo` first searches through all your folders in `/home/current_user/` for git repositories with unpushed changes and pushes those. It then tries to save the rest by creating a huge repository, pushing everything into a specified emergancy remote repo.

### Configurations

Since there are many individual ways one might want to handle his data, `gtfo` offers many configurations to modify its behavior. At least one "root"-config file `.gtfo` is expected to be in `~/`, or `~/.config/`. More config-files can be placed in any sub-directory to change the behavior for this dir and all its sub-dirs.

| config | default | description |
| ------ | ------- | ----------- |
| no     | configs | yet         |
