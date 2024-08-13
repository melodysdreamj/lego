import 'dart:io';

import 'package:yaml/yaml.dart';

import '../build_order/function.dart';
import '../build_order/function/flutter_package_add/function.dart';
import '../build_order/function/flutter_package_remove/function.dart';


Future<void> addModule(String moduleName) async {
  // await checkAndAddModules(moduleName, devPackage: true);

  // final file = File('pubspec.yaml');
  // final yamlString = await file.readAsString();
  // YamlMap yamlDoc = loadYaml(yamlString);
  // bool isDuplicated = await isPackageDuplicated(yamlDoc, moduleName,
  //     devPackage: true);
  // if (!isDuplicated) {
  //   await addFlutterPackage(moduleName,
  //       devPackage: true);
  // }

  await removeFlutterPackage(moduleName);
  await addFlutterPackage(moduleName,
      devPackage: true);

  await buildApp();
}