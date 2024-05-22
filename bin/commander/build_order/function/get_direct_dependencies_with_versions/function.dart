import 'dart:io';
import 'package:yaml/yaml.dart';

import '../../../../entity/model/package_info/model.dart';
import 'package:path/path.dart' as path;


Future<List<PackageInfo>> getNeedAddPackagesUsingPath(
    String packagePath) async {
  try {
    final pubspecYaml = File(path.join(packagePath, 'pubspec.yaml'));

    final pubspecLock = File('pubspec.lock');

    final pubspecContents = await pubspecYaml.readAsLines();
    final directDependenciesWithComments = {};
    bool inDependenciesSection = false;
    for (var line in pubspecContents) {
      if (line.trim() == 'dependencies:') {
        inDependenciesSection = true;
      } else if (inDependenciesSection && line.startsWith(' ')) {
        // 'dependencies' 섹션 내부의 내용 처리
        if (line.contains('#@add')) {
          final dependencyName = line.split(':')[0].trim();
          directDependenciesWithComments[dependencyName] = true;
          // print('dependencyName: $dependencyName');
        }
      } else if (line
          .trim()
          .isNotEmpty && !line.startsWith(' ')) {
        // 다른 섹션의 시작을 만나면 'dependencies' 섹션의 끝으로 간주
        inDependenciesSection = false;
      }
    }

    final pubspecLockContents = await pubspecLock.readAsString();
    final lockfile = loadYaml(pubspecLockContents);
    final packages = lockfile['packages'] as YamlMap;

    final List<PackageInfo> dependenciesWithVersions = [];
    for (var packageName in directDependenciesWithComments.keys) {
      final version = packages.containsKey(packageName)
          ? (packages[packageName] as YamlMap)['version'] as String
          : 'Unknown Version';
      dependenciesWithVersions.add(PackageInfo()
        ..Name = packageName
        ..Version = version);
    }

    return dependenciesWithVersions;
  } catch (e) {
    // print('Error: $e');
    return [];
  }
}

Future<List<PackageInfo>> getNeedAddDevPackagesUsingPath(
    String packagePath) async {
  try {
    final pubspecYaml = File(path.join(packagePath, 'pubspec.yaml'));

    final pubspecLock = File('pubspec.lock');

    final pubspecContents = await pubspecYaml.readAsLines();
    final directDependenciesWithComments = {};
    bool inDependenciesSection = false;
    for (var line in pubspecContents) {
      if (line.trim() == 'dev_dependencies:') {
        inDependenciesSection = true;
      } else if (inDependenciesSection && line.startsWith(' ')) {
        // 'dev_dependencies' 섹션 내부의 내용 처리
        if (line.contains('#@add')) {
          final dependencyName = line.split(':')[0].trim();
          directDependenciesWithComments[dependencyName] = true;
          // print('devDependencyName: $dependencyName');
        }
      } else if (line
          .trim()
          .isNotEmpty && !line.startsWith(' ')) {
        // 다른 섹션의 시작을 만나면 'dev_dependencies' 섹션의 끝으로 간주
        inDependenciesSection = false;
      }
    }

    final pubspecLockContents = await pubspecLock.readAsString();
    final lockfile = loadYaml(pubspecLockContents);
    final packages = lockfile['packages'] as YamlMap;

    final List<PackageInfo> dependenciesWithVersions = [];
    for (var packageName in directDependenciesWithComments.keys) {
      final version = packages.containsKey(packageName)
          ? (packages[packageName] as YamlMap)['version'] as String
          : 'Unknown Version';
      dependenciesWithVersions.add(PackageInfo()
        ..Name = packageName
        ..Version = version);
    }

    return dependenciesWithVersions;
  } catch (e) {
    // print('Error: $e');
    return [];
  }
}
