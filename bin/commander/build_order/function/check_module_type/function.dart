import 'dart:io';

import '../../../../entity/enum/project_type/enum.dart';
import '../../../../entity/model/module/model.dart';

import 'package:path/path.dart' as path;

// Future<Module> checkModuleType(String packagePath, Module moduleObj) async {
//   File info = File(path.join(packagePath, 'info.june'));
//
//   if (!await info.exists()) {
//     throw Exception('info.june file not found: $packagePath');
//   }
//
//   List<String> lines = await info.readAsLines();
//
//   if (lines.isEmpty) {
//     throw Exception('info.june file is empty: $packagePath');
//   }
//
//   String type = lines[0].trim();
//
//   switch (type) {
//     case 'project':
//       moduleObj.Type = ProjectTypeEnum.Skeleton;
//       break;
//     // case 'june-view project':
//     //   moduleObj.Type = ProjectTypeEnum.JuneViewProject;
//     //   break;
//     case 'module':
//       moduleObj.Type = ProjectTypeEnum.ModuleTemplate;
//       break;
//     case 'view':
//       moduleObj.Type = ProjectTypeEnum.ViewTemplate;
//       break;
//     default:
//       throw Exception('Invalid module type in info.june file: $type');
//   }
//
//   return moduleObj;
// }
