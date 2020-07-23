# Exercises

## Debugging
1. Use `journalctl` on Linux or `log show` on macOS to get the super user accesses and commands in the last day.
If there aren't any you can execute some harmless commands such as `sudo ls` and check again.

- Answer: `journalctl -S "yesterday" | grep sudo`

2. Do [this](https://github.com/spiside/pdb-tutorial) hands on `pdb` tutorial to familiarize yourself with the commands. For a more in depth tutorial read [this](https://realpython.com/python-debugging-pdb).


3. Install [`shellcheck`](https://www.shellcheck.net/) and try checking the following script. What is wrong with the code? Fix it. Install a linter plugin in your editor so you can get your warnings automatically.

   ```bash
   #!/bin/sh
   ## Example: a typical script with several problems
   for f in $(ls *.m3u)
   do
     grep -qi hq.*mp3 $f \
       && echo -e 'Playlist $f contains a HQ file in mp3 format'
   done
   ```
- Answer:
  ```bash
  #!/bin/sh
  for f in *.m3u
  do
    grep -qi "hq.*mp3" "$f" \
      && echo "Playlist $f contains a HQ file in mp3 format"
  done
  ```
