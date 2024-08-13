import 'dart:io';

import 'package:yaml/yaml.dart';

import '../../../../entity/model/package_info/model.dart';
import '../flutter_package_add/function.dart';

// Future<void> addPackageInModules(List<PackageInfo> packages) async {
//   for (PackageInfo package in packages) {
//     // print('Add package: ${package.Name} in modules');
//     await addFlutterPackage(package.Name, version: package.Version);
//   }
// }
//
// Future<void> addDevPackageInModules(List<PackageInfo> devPackages) async {
//   for (PackageInfo package in devPackages) {
//     // print('Add package: ${package.Name} in modules');
//     await addFlutterPackage(package.Name,
//         version: package.Version, devPackage: true);
//   }
// }
//
// Future<void> checkAndAddModules(List<PackageInfo> packages,
//     {bool devPackages = false}) async {
//   var yamlDoc = loadYaml(await File('pubspec.yaml').readAsString());
//
//   print('pubspec.yaml: $yamlDoc');
//
//   Map<dynamic, dynamic> dependencies = devPackages
//       ? yamlDoc['dev_dependencies'] ?? {}
//       : yamlDoc['dependencies'] ?? {};
//
//   for (final package in packages) {
//     if (!dependencies.containsKey(package.Name)) {
//       await addFlutterPackage(package.Name,
//           version: package.Version, devPackage: devPackages);
//     } else {
//       // print('${package.Name} is already listed in ${devPackages ? "dev_dependencies" : "dependencies"}');
//     }
//   }
// }

Future<void> addPackagesIfNeeded(
    List<PackageInfo> packages, {bool devPackage = false}) async {
  final file = File('pubspec.yaml');
  final yamlString = await file.readAsString();
  YamlMap yamlDoc = loadYaml(yamlString);

  for (var package in packages) {
    bool isDuplicated = await isPackageDuplicated(yamlDoc, package.Name,
        devPackage: devPackage);
    if (!isDuplicated) {
      await addFlutterPackage(package.Name,
          version: package.Version, devPackage: devPackage);
    } else {
      // print('${package.Name} is already listed in ${devPackage ? "dev_dependencies" : "dependencies"}');
    }
  }
}

Future<bool> isPackageDuplicated(YamlMap yamlDoc, String packageName,
    {bool devPackage = false}) async {
  Map<dynamic, dynamic> dependencies = devPackage
      ? yamlDoc['dev_dependencies'] ?? {}
      : yamlDoc['dependencies'] ?? {};
  return dependencies.containsKey(packageName);
}
