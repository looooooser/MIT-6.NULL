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
    
- Answer:see the file [pidwait.sh](./pidwait.sh)

Notes: Four ways to execute .sh file.  
1. `./pidwait.sh` This way execute the file in the current shell session, it will take pidwait.sh as a file, so we need the execute permission(x), and when we run this program, we have two child process one is pidwait, another is sleep process, if we type `ctrl-c`, both pidwait and sleep will stop.
2. `sh pidwait.sh` In this way, we start a new bash session to execute the command in the file, it don't need the execute permission, since we don't take it as a file. In the run time, it also have two process, one is bash, another is sleep and if we type `ctrl-c`, the bash will stop, so as the sleep.
3. `source pidwait.sh` This way run the command in the current shell session directly, it also no need the execute permission, but this way will only have one process is running--sleep, if we type `ctrl-c`, just stop the sleep process.
4. `. pidwait.sh` Same as the third way.

