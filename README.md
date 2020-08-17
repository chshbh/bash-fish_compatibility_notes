# source-bashto-fish_example
### using bass in fish shell to import bash source function

> **issue** : usually you can't import bash functions into fish shell environment.
> **use-case** : sourcing bash functions when running fish shell

+ (there are other hacks) using [bass](https://github.com/edc/bass), need fish shell + bash shell installed
+ install bass with [fisher](https://github.com/jorgebucaran/fisher) `fisher add edc/bass`

  ```bash
  cat example.sh
  source f2sh.fish
  funced fish_func
  fish_func test
  ```
