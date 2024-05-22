import 'dart:io';
import 'package:path/path.dart' as path;

Future<void> changeProjectName(String targetDirectory, String newName) async {
  final String pubspecPath = path.join(Directory.current.path, targetDirectory, 'pubspec.yaml');
  final File pubspecFile = File(pubspecPath);

  if (await pubspecFile.exists()) {
    final lines = await pubspecFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.startsWith('name:')) {
        return 'name: $newName';
      }
      return line;
    }).toList();

    await pubspecFile.writeAsString(updatedLines.join('\n'));
    // print('Project name updated to $newName in pubspec.yaml');
  } else {
    // print('pubspec.yaml not found in the provided project path.');
  }
}

Future<void> changeAndroidAppName(String targetDirectory, String newName) async {
  final String manifestPath = path.join(targetDirectory, 'android', 'app', 'src', 'main', 'AndroidManifest.xml');
  final File manifestFile = File(manifestPath);

  if (await manifestFile.exists()) {
    final lines = await manifestFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.trim().contains('android:label=')) {
        final newLine = line.replaceFirst(RegExp(r'android:label=".*"'), 'android:label="$newName"');
        return newLine;
      }
      return line;
    }).toList();

    await manifestFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('AndroidManifest.xml not found in the provided project path.');
  }
}

Future<void> changeIosAppName(String targetDirectory, String newName) async {
  final String plistPath = path.join(targetDirectory, 'ios', 'Runner', 'Info.plist');
  final File plistFile = File(plistPath);

  if (await plistFile.exists()) {
    final lines = await plistFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.contains('<key>CFBundleDisplayName</key>')) {
        final nextLineIndex = lines.indexOf(line) + 1;
        lines[nextLineIndex] = lines[nextLineIndex].replaceFirst(RegExp(r'<string>.*</string>'), '<string>$newName</string>');
      }
      return line;
    }).toList();

    await plistFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('Info.plist not found in the provided project path.');
  }
}

Future<void> changeWebAppName(String targetDirectory, String newName) async {
  final String indexPath = path.join(targetDirectory, 'web', 'index.html');
  final File indexFile = File(indexPath);

  if (await indexFile.exists()) {
    final lines = await indexFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.contains('<title>')) {
        return line.replaceFirst(RegExp(r'<title>.*</title>'), '<title>$newName</title>');
      }
      return line;
    }).toList();

    await indexFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('index.html not found in the provided project path.');
  }
}

Future<void> changeMacosAppName(String targetDirectory, String newName) async {
  final String xcconfigPath = path.join(targetDirectory, 'macos', 'Runner', 'Configs', 'AppInfo.xcconfig');
  final File xcconfigFile = File(xcconfigPath);

  if (await xcconfigFile.exists()) {
    final lines = await xcconfigFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.trim().startsWith('PRODUCT_NAME =')) {
        return 'PRODUCT_NAME = $newName';
      }
      return line;
    }).toList();

    await xcconfigFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('AppInfo.xcconfig not found in the provided project path.');
  }
}

Future<void> changeWindowsAppName(String targetDirectory, String newName) async {
  final String cmakePath = path.join(targetDirectory, 'windows', 'CMakeLists.txt');
  final File cmakeFile = File(cmakePath);

  if (await cmakeFile.exists()) {
    final lines = await cmakeFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.trim().startsWith('set(BINARY_NAME')) {
        return 'set(BINARY_NAME "$newName")';
      }
      return line;
    }).toList();

    await cmakeFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('CMakeLists.txt not found in the provided project path.');
  }
}

Future<void> changeLinuxAppName(String targetDirectory, String newName) async {
  final String cmakePath = path.join(targetDirectory, 'linux', 'CMakeLists.txt');
  final File cmakeFile = File(cmakePath);

  if (await cmakeFile.exists()) {
    final lines = await cmakeFile.readAsLines();
    final updatedLines = lines.map((line) {
      if (line.trim().startsWith('set(BINARY_NAME')) {
        return 'set(BINARY_NAME "$newName")';
      }
      return line;
    }).toList();

    await cmakeFile.writeAsString(updatedLines.join('\n'));
  } else {
    print('CMakeLists.txt not found in the provided project path.');
  }
}