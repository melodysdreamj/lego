# Create New Widget

1. install lego CLI by this [guide](../)
2.  create new widget template

    1. run the following command in the terminal:

    ```bash
    lego create
    ```

    2. select the widget type(select 3\~6 for the widget type)
    3. enter the widget name
3. write the widget code in the generated file(lib/widget\_book/\[widget]/_/_.dart)

### Add Assets

add any assets to the `assets/lego/_new/` folder

* note: always use relative paths for imports

### Add Libraries

1. add any libraries to this terminal command:

```bash
flutter pub add [library_name]
```

2. add `#@add` to the library without a version number in the pubspec.yaml file.

```yaml
# example
dependencies:
  ...
  cupertino_icons: #@add
```

* this will automatically add your project's dependencies to the pubspec.yaml file when you add a new widget.
* do not add the library that need initialization in the main.dart file.

###
