## Prerequisists
- Docker
- Wezterm (?Version wezterm 20240203-110809-5046fc22)
- ? CPU with x86 architecture

## Reproduction of Error
1. `cd .devcontainer`
2. `docker-compose up -d`
3. `docker exec -it vim-slime_matplotlib-bug /bin/bash`
4. `chmod +x neovim-startup.sh`
5. `./neovim-startup.sh`
6. `tmux`
7. `nvim test.py`
8. `space i p`

#### Issue
IPython opens. When `plt.show()` is executed in the IPython window (switch to it with `ctrl a l`), the plot will be displayed.
However when instead vim-slime is used, it will cause an error and no image is displayed (Repeat step 7. and 8. and send the command `plt.show()` with `ctrl v ctrl v` or simply uncomment `plt.show()`),

#### Error-Message
```shell
14:37:30.235  ERROR  env_bootstrap > panic at wezterm/src/main.rs:383:10 - attempt to divide by zero
   0: <unknown>
   1: <unknown>
   2: <unknown>
   3: <unknown>
   4: <unknown>
   5: <unknown>
   6: <unknown>
   7: <unknown>
   8: <unknown>
   9: <unknown>
  10: <unknown>
  11: <unknown>
  12: <unknown>
  13: <unknown>
  14: <unknown>
  15: __libc_start_main
  16: <unknown>

thread 'main' panicked at wezterm/src/main.rs:383:10:
attempt to divide by zero
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
```
