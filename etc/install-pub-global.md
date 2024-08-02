# Install Pub Global

When you use the `pub global` command, it's necessary to have Dart's `pub` tool installed and the PATH environment variable updated to include the location of the `pub` command. This allows you to execute the `pub` command from anywhere in your system, which is especially important for running globally activated packages.

## Setting up PATH on Windows

1. Use the search function to find 'Edit the system environment variables'.
2. In the System Properties dialog, click on 'Environment Variables'.
3. Under 'System Variables', find and select 'Path', then click 'Edit'.
4. Click 'New' and add the path to the `.pub-cache/bin` directory, for example, `C:\Users<username>\AppData\Local\Pub\Cache\bin`.
5. Click 'OK' to apply the changes.\\

## Setting up PATH on macOS/Linux

1. Open a terminal.
2. Edit the profile file for your shell, such as `.bash_profile`, `.bashrc`, `.zshrc`, etc.
3. Add the following line to the file: `export PATH="$PATH":"$HOME/.pub-cache/bin"`.
4. To apply the changes, either restart your terminal session or source the profile file, e.g., `source ~/.zshrc`.
