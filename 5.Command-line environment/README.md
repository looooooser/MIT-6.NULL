# Job control

1. From what we have seen, we can use some `ps aux | grep` commands to get our jobs' pids and then kill them, but there are better ways to do it. Start a `sleep 10000` job in a terminal, background it with `Ctrl-Z` and continue its execution with `bg`. Now use [`pgrep`](https://www.man7.org/linux/man-pages/man1/pgrep.1.html) to find its pid and [`pkill`](http://man7.org/linux/man-pages/man1/pgrep.1.html) to kill it without ever typing the pid itself. (Hint: use the `-af` flags).

- Answer:
```bash
  sleep 10000
  pgrep -af 'sleep 10000'
  pkill -f 'sleep 10000'
```
2. Say you don't want to start a process until another completes, how you would go about it? In this exercise our limiting process will always be `sleep 60 &`.
One way to achieve this is to use the [`wait`](https://www.man7.org/linux/man-pages/man1/wait.1p.html) command. Try launching the sleep command and having an `ls` wait until the background process finishes.

    However, this strategy will fail if we start in a different bash session, since `wait` only works for child processes. One feature we did not discuss in the notes is that the `kill` command's exit status will be zero on success and nonzero otherwise. `kill -0` does not send a signal but will give a nonzero exit status if the process does not exist.
    Write a bash function called `pidwait` that takes a pid and waits until the given process completes. You should use `sleep` to avoid wasting CPU unnecessarily.
    
- Answer: See the file [pidwait.sh](./pidwait.sh)

Notes: Four ways to execute .sh file.  
1. `./pidwait.sh` This way execute the file in the current shell session, it will take pidwait.sh as a file, so we need the execute permission(x), and when we run this program, we have two child process one is `pidwait`, another is `sleep` process, if we type `ctrl-c`, both pidwait and sleep will stop.
2. `sh pidwait.sh` In this way, we start a new bash session to execute the command in the file, it don't need the execute permission, since we don't take it as a file. In the run time, it also have two process, one is `bash`, another is `sleep` and if we type `ctrl-c`, the bash will stop, so as the sleep.
3. `source pidwait.sh` This way run the command in the current shell session directly, it also no need the execute permission, but this way will only have one process is running--`sleep`, if we type `ctrl-c`, just stop the sleep process.
4. `. pidwait.sh` Same as the third way.

# Terminal multiplexer

1. Follow this `tmux` [tutorial](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)  and then learn how to do some basic customizations following these [steps](https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/).

# Aliase

1. Create an alias `dc` that resolves to `cd` for when you type it wrongly.

- Answer: `alias dc=cd`

2. Run `history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10` to get your top 10 most used commands and consider writing shorter aliases for them. Note: this works for Bash; if you’re using ZSH, use history 1 instead of just history.

- Answer:
```bash
vim .tmux.conf
rqt_graph
vim .vimrc
roslaunch my_turtlebot_nav turtlebot_stage.launch
gedit ~/.bashrc
vim .bashrc
ls
source ~/ros/devel/setup.bash
tmux
ps
------------------------------------
alias rsl="roslaunch my_turtlebot_nav turtlebot_stage.launch"
alias gb="gedit ~/.bashrc"
```

# Dotfiles

Let’s get you up to speed with dotfiles.

1. Create a folder for your dotfiles and set up version control.
2. Add a configuration for at least one program, e.g. your shell, with some customization (to start off, it can be something as simple as customizing your shell prompt by setting `$PS1`).
3. Set up a method to install your dotfiles quickly (and without manual effort) on a new machine. This can be as simple as a shell script that calls `ln -s` for each file, or you could use a [specialized utility](https://dotfiles.github.io/utilities/).
4. Test your installation script on a fresh virtual machine.
5. Migrate all of your current tool configurations to your dotfiles repository.
6. Publish your dotfiles on GitHub.

My dotfile click [here](../../dotfile).
