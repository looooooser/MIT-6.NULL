# Exercises

1. If you don't have any past experience with Git, either try reading the first
   couple chapters of [Pro Git](https://git-scm.com/book/en/v2) or go through a
   tutorial like [Learn Git Branching](https://learngitbranching.js.org/). As
   you're working through it, relate Git commands to the data model.
   
2. Clone the [repository for the
class website](https://github.com/missing-semester/missing-semester).
    1. Explore the version history by visualizing it as a graph.
    
        Answer: `git log --all --graph --decorate --oneline`.
    1. Who was the last person to modify `README.md`? (Hint: use `git log` with
       an argument)
       
        Answer: `git log -1 README.md | grep Author`
    1. What was the commit message associated with the last modification to the
       `collections:` line of `_config.yml`? (Hint: use `git blame` and `git
       show`)
       
        Answer: `git blame _config.yml | tail -1 | awk '{print $1}' | xargs git show`
        
3. One common mistake when learning Git is to commit large files that should
   not be managed by Git or adding sensitive information. Try adding a file to
   a repository, making some commits and then deleting that file from history
   (you may want to look at
   [this](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)).
   
4. Clone some repository from GitHub, and modify one of its existing files.
   What happens when you do `git stash`? What do you see when running `git log
   --all --oneline`? Run `git stash pop` to undo what you did with `git stash`.
   In what scenario might this be useful?
- Notes:  
      `git stash` Temporarily discard modifications on working files and save them in a stack.  
      When type `git log --all --oneline`, it has no changes from before.  
      `git stash pop` Pop modifications in the stack.  
      Maybe this command is useful when we not sure whether to commit a change.

5. Like many command line tools, Git provides a configuration file (or dotfile)
   called `~/.gitconfig`. Create an alias in `~/.gitconfig` so that when you
   run `git graph`, you get the output of `git log --all --graph --decorate
   --oneline`.
- Answers:
   ```bash
   [alias]
   graph="log --graph --all -decorate --oneline"
   ```
