import 'dart:io';
import 'package:path/path.dart' as path;

import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

Future<String?> checkIsRightProjectOrLegoTopic() async {
  String currentPath = Directory.current.path;
  List<String> filePaths = [
    path.join(currentPath, 'lib', 'util', '_', 'build_app', 'widget', 'run_app', '_.dart'),
    // path.join(currentPath, 'lib', 'util', 'config', 'global_imports.dart'),
    path.join(currentPath, 'lib', 'util', '_', 'build_app', 'function', 'before_run_app', '_.dart'),
    path.join(currentPath, 'pubspec.lock'),
  ];

  // 첫 번째 조건 검사
  bool allFilesExist = true;
  for (String filePath in filePaths) {
    File file = File(filePath);
    bool exists = await file.exists();
    if (!exists) {
      allFilesExist = false;
      break;
    }
  }

  if (allFilesExist) {
    return 'common lego'; // 첫 번째 조건 통과
  }

  // 두 번째 조건 검사
  final pubspecFile = File(path.join(currentPath, 'pubspec.yaml'));

  if (await pubspecFile.exists()) {
    final pubspecContent = await pubspecFile.readAsString();
    final yamlMap = loadYaml(pubspecContent);

    if (yamlMap['topics'] is List && yamlMap['topics'].contains('lego')) {
      return 'pure view lego'; // 두 번째 조건 통과
    }
  }

  // 두 조건 모두 통과 못하면 null 리턴
  return null;
}