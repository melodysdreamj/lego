
# Install
## mac
```bash
brew tap dart-lang/dart
brew install dart
dart pub global activate lego_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

# Upgrade
```bash
dart pub global deactivate lego_cli
dart pub global activate lego_cli
```

```bash
dart pub global deactivate lego_cli
dart pub global activate --source git https://github.com/melodysdreamj/lego_cli.git
```