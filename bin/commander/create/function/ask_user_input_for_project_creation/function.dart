import 'dart:io';

import '../../../../entity/enum/project_type/enum.dart';
import '../../../../entity/model/creation_result/model.dart';

Future<CreationResult?> askUserInputForProjectCreation() async {
  String type = 'june_view project'; // Default value
  while (true) {
    print(
        'What are you creating? (Press Enter for default, type "cancel" to exit)');

    print('1. New Project(default)');
    print('2. New Lego Plugin');
    String? typeSelection = await readLine();
    if (typeSelection?.toLowerCase() == 'cancel') {
      print('Operation cancelled.');
      return null;
    }
    switch (typeSelection) {
      case '1':
        type = 'skeleton';
        break;
      case '2':
        type = 'lego template';
        break;

      case '':
        print('Default selection [1. StarterKit Project] is used.');
        break;
      default:
        print(
            'Invalid selection. Please enter 1 for Skeleton project, 2 for Module, 3 for View or "cancel" to exit.');
        continue;
    }
    break;
  }

  CreationResult? result;
  if(type == 'skeleton') {
    result = await _createEmptyProject();
  } else if(type == 'lego template') {
    result = await _createLegoTemplate();
  }

  // if (type == 'module template') {
  //   result = await _createModule();
  // } else if(type == 'view template') {
  //   result = await _createView();
  // } else if(type == 'skeleton') {
  //   result = await _createEmptyProject();
  // } else if(type == 'june_view project') {
  //   result = await _createJuneViewProject();
  // }


  if (result != null) {
    _printSuccessMessage(
        result.Type, result.Name, result.PackageName);
    // print('The $type has been created successfully!');
    return result;
  } else {
    // print('The $type creation has been cancelled.');
  }
  return null;
}

Future<CreationResult?> _createEmptyProject() async {
  String? name = await _getName('project');
  if (name == null) return null; // Operation was cancelled.

  String? packageName = await _getPackageName();
  if (packageName == null) return null; // Operation was cancelled.

  return CreationResult()..Type = ProjectTypeEnum.Skeleton..Name = name..PackageName = packageName;
}


// Future<CreationResult?> _createJuneViewProject() async {
//   String? name = await _getName('project');
//   if (name == null) return null; // Operation was cancelled.
//
//   String? packageName = await _getPackageName();
//   if (packageName == null) return null; // Operation was cancelled.
//
//   return CreationResult()..Type = ProjectTypeEnum.Skeleton..Name = name..PackageName = packageName;
//   // return CreationResult()..Type = ProjectTypeEnum.JuneViewProject..Name = name..PackageName = packageName;
// }


Future<CreationResult?> _createLegoTemplate() async {
  String? name = await _getName('lego plugin');
  if (name == null) return null; // Operation was cancelled.
  return CreationResult()..Type = ProjectTypeEnum.LegoTemplate..Name = name;
  // return CreationResult()..Type = ProjectTypeEnum.ModuleTemplate..Name = name;
}

// Future<CreationResult?> _createModule() async {
//   String? name = await _getName('module');
//   if (name == null) return null; // Operation was cancelled.
//   return CreationResult()..Type = ProjectTypeEnum.ModuleTemplate..Name = name;
//   return CreationResult()..Type = ProjectTypeEnum.ModuleTemplate..Name = name;
// }
//
// Future<CreationResult?> _createView() async {
//   String? name = await _getName('view');
//   if (name == null) return null; // Operation was cancelled.
//   return CreationResult()..Type = ProjectTypeEnum.ViewTemplate..Name = name;
//   return CreationResult()..Type = ProjectTypeEnum.ViewTemplate..Name = name;
// }

Future<String?> _getName(String type) async {
  String? name;
  while (true) {
    print('Enter the name for your $type (e.g., my_app):');
    name = stdin.readLineSync();
    if (name?.toLowerCase() == 'cancel') {
      print('Operation cancelled.');
      return null;
    } else if (!_isValidProjectName(name)) {
      print('Error: The project name must be all lowercase, including underscores to separate words, and cannot start with a digit. Please try again.');
      continue;
    }
    break;
  }
  if(type == 'lego plugin') {
    return '${name}_lego';
  }else {
    return name;
  }
}

Future<String?> _getPackageName() async {
  String? packageName;
  while (true) {
    print(
        'Enter the package name for your project (e.g., com.example.myapp), or type "cancel" to exit:');
    packageName = stdin.readLineSync();
    if (packageName?.toLowerCase() == 'cancel') {
      print('Operation cancelled.');
      return null;
    } else if (!_isValidPackageName(packageName)) {
      print(
          'Error: The package name must be a valid domain name in reverse domain name notation, consisting of at least three segments separated by dots, and all lowercase. Please try again.');
      continue;
    }
    break;
  }
  return packageName;
}

_printSuccessMessage(ProjectTypeEnum type, String? name, String? packageName) {
  print('Project/Module name: $name');
  if (packageName != null && packageName != '') {
    print('Package name: $packageName');
  }
}

bool _isValidProjectName(String? name) {
  return name != null && RegExp(r'^[a-z_][a-z0-9_]*$').hasMatch(name);
}

bool _isValidPackageName(String? packageName) {
  return packageName != null &&
      RegExp(r'^[a-z]+(\.[a-z0-9]+){2}$').hasMatch(packageName);
}

Future<String?> readLine() async {
  return stdin.readLineSync();
}