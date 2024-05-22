import 'dart:io';

import 'package:yaml/yaml.dart';

import '../../../../entity/model/package_info/model.dart';

Future<PackageInfo?> getPackageInfoUsingName(String name) async {
  // get version using pubspec.lock
  var lockFile = File('pubspec.lock');
  var content = await lockFile.readAsString();
  var yamlContent = loadYaml(content);

  // 디펜던시 목록 추출
  var dependencies = yamlContent['packages'] as Map;

  for (var entry in dependencies.entries) {
    if (entry.key == name) {
      return PackageInfo()
        ..Name = entry.key
        ..Version = entry.value['version']
      ;
    }
  }

  return null;
}