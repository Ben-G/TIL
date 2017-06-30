- `$(command)` is “command substitution”.  As you seem to understand, it runs the *command*, captures its output, and inserts that into the command line that contains the **$(…)**; e.g., [Source](https://superuser.com/questions/935374/difference-between-and-in-shell-script)
- Command substituation in bash profile / zshrc requires a shell function instead of an alias, because substitution is evaluated when the alias is defined; not when it is run [Source](https://unix.stackexchange.com/questions/70642/command-substitution-in-alias-resolved-in-bash-profile)
  - Instead of:
  ```
  alias "cd $(git rev-parse --show-toplevel || echo ".")""
  ```
  - Do this:
  ```
  top() {
     cd $(git rev-parse --show-toplevel || echo ".")
  }
  ```
  ​