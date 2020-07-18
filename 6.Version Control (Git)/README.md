# Exercises

1. If you don't have any past experience with Git, either try reading the first
   couple chapters of [Pro Git](https://git-scm.com/book/en/v2) or go through a
   tutorial like [Learn Git Branching](https://learngitbranching.js.org/). As
   you're working through it, relate Git commands to the data model.
   
2. Clone the [repository for the
class website](https://github.com/missing-semester/missing-semester).
    1. Explore the version history by visualizing it as a graph.
    
        Answer: `git log --all --graph --decorate --oneline`
    1. Who was the last person to modify `README.md`? (Hint: use `git log` with
       an argument)
       
        Answer: `git log -1 README.md | grep Author`
    1. What was the commit message associated with the last modification to the
       `collections:` line of `_config.yml`? (Hint: use `git blame` and `git
       show`)
       
        Answer: `git blame _config.yml | tail -1 | awk '{print $1}' | xargs git show`
