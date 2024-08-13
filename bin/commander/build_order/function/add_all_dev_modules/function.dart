import 'dart:io';

import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

import '../../../../entity/model/package_info/model.dart';
import '../add_package_in_modules/function.dart';
import '../flutter_package_add/function.dart';
import '../get_direct_dependencies_with_versions/function.dart';
import '../get_package_info_using_name/function.dart';
import '../get_package_path/function.dart';

import 'package:path/path.dart' as path;


Future<void> addAllModules() async {
  // 현재꺼는 모든 dev를 가져옵니다.
  List<dynamic> devPackages = await _getAllDevPackages(Directory.current.path);
  // print('DevPackage: $devPackages');

  // 이거를 바탕으로 해당 프로젝트 경로를 받아줍니다. 그러기 위해서는 버전정보도 알아야합니다.
  for (var package in devPackages) {
    // 해당 패키지의 버전을 가져옵니다.
    PackageInfo? packageInfo = await getPackageInfoUsingName(package);
    if (packageInfo == null) {
      continue;
    }
    // 해당 패키지의 경로를 가져옵니다.
    String? packagePath = getPackagePath(packageInfo.Name, packageInfo.Version);
    if (packagePath == null) {
      continue;
    }

    await addPackageUsingPath(packagePath);
  }
}

Future<void> addPackageUsingPath(String packagePath) async {
  // print('addPackageUsingPath: $packagePath');
  // 이제 그 경로를 바탕으로 그 프로젝트에서 dev에서 @add 인걸 찾아줍니다.
  List<PackageInfo> packagesInfo =
      await getNeedAddPackagesUsingPath(packagePath);
  List<PackageInfo> devPackagesInfo =
      await getNeedAddDevPackagesUsingPath(packagePath);

  for (var package in packagesInfo) {
    bool isExistBefore = await addFlutterPackage(package.Name,
        version: package.Version, devPackage: false);

    // 가끔 Version 이 Unknown Version 으로 나오는 경우가 있어서 다시 가져옵니다.
    PackageInfo? renewPackageInfo = await getPackageInfoUsingName(package.Name);
    if (renewPackageInfo == null) {
      continue;
    }
    package = renewPackageInfo;

    String? _packagePath = getPackagePath(package.Name, package.Version);
    // print(
    //     'isExistBefore: $isExistBefore _packagePath: $_packagePath _packageName: ${package.Name}');
    if (_packagePath == null || isExistBefore) {
      continue;
    }
    await addPackageUsingPath(_packagePath);
  }

  for (var package in devPackagesInfo) {
    bool isExistBefore = await addFlutterPackage(package.Name,
        version: package.Version, devPackage: true);

    // 가끔 Version 이 Unknown Version 으로 나오는 경우가 있어서 다시 가져옵니다.
    PackageInfo? renewPackageInfo = await getPackageInfoUsingName(package.Name);
    if (renewPackageInfo == null) {
      continue;
    }
    package = renewPackageInfo;

    String? _packagePath = getPackagePath(package.Name, package.Version);
    if (_packagePath == null || isExistBefore) {
      continue;
    }
    // print(
    //     'isExistBefore: $isExistBefore _packagePath: $_packagePath _packageName: ${package.Name}');
    await addPackageUsingPath(_packagePath);
  }
}

Future<List<dynamic>> _getAllDevPackages(String projectPath) async {
  final pubspecYaml = File(path.join(projectPath, 'pubspec.yaml'));
  final pubspecContent = await pubspecYaml.readAsString();

  final pubspecYamlMap = loadYaml(pubspecContent);
  final devDependencies = pubspecYamlMap['dev_dependencies'] as Map;

  return devDependencies.keys.toList();
}