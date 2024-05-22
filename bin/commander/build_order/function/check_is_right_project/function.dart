import 'dart:io';
import 'package:path/path.dart' as path;

Future<bool> checkIsRightProject() async {
  String currentPath = Directory.current.path;
  List<String> filePaths = [
    path.join(currentPath, 'lib', 'util', '_', 'build_app', 'widget', 'run_app', '_.dart'),
    // path.join(currentPath, 'lib', 'util', 'config', 'global_imports.dart'),
    path.join(currentPath, 'lib', 'util', '_', 'build_app', 'function', 'before_run_app', '_.dart'),
    path.join(currentPath, 'pubspec.lock'),
  ];

  for (String filePath in filePaths) {
    File file = File(filePath);
    bool exists = await file.exists();
    if (!exists) return false;
  }

  return true;
}
