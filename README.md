## Prerequisists
- Docker
- Wezterm (?Version wezterm 20240203-110809-5046fc22)
- ? CPU with x86 architecture

## Reproduction of Error
1. `cd .devcontainer`
2. `docker-compose up -d`
3. `docker exec -it vim-slime_matplotlib-bug /bin/bash`
4. `tmux`
5. `nvim test.py`
6. `ctrl a v`
7. `ipyhton`
8. `ctrl a h`

#### Working
9. `ctrl c ctrl c`
10. `ctrl a l`
11. `plt.show()`

#### Bug
9. `ctrl c ctrl c`
10. `7 j`
11. `ctrl c ctrl c`

#### Recording
![](bug-reproduction.gif)

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
