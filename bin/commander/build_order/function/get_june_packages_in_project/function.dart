import 'dart:io';

import '../../../../entity/model/pubspec_code/model.dart';
import '../../../../entity/model/file_path_and_contents/model.dart';
import '../../../../entity/model/module/model.dart';
import '../../../../entity/model/package_info/model.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

import '../../../../singleton/build_info/model.dart';
import '../add_package_in_modules/function.dart';
import '../check_assets_exist_and_add_folder/function.dart';
import '../check_module_type/function.dart';
import '../flutter_pub_get/function.dart';
import '../get_direct_dependencies_with_versions/function.dart';
import '../get_package_path/function.dart';
import 'usage.dart';

Future<void> getJuneFlowPackagesInProject() async {
  await runFlutterPubGet();

  // pubspec.lock 파일 읽기
  var lockFile = File('pubspec.lock');
  var content = await lockFile.readAsString();
  var yamlContent = loadYaml(content);

  // 디펜던시 목록 추출
  var dependencies = yamlContent['packages'] as Map;

  for (var entry in dependencies.entries) {
    String name = entry.key;
    Map details = entry.value;

    var packagePath = getPackagePath(name, details['version']);
    if (packagePath == null) continue;

    if (await _checkJuneFlowModule(packagePath, name, details['version'])) {
      Module module = await generateModuleObjFromPackage(packagePath, name, details['version']);

      // 경로 처리 부분 수정
      module = await checkAssetsHandler(packagePath, module,
          path.join(packagePath, 'assets', 'module', module.LibraryName));
      module = await checkAssetsHandler(packagePath, module,
          path.join(packagePath, 'assets', 'view', module.LibraryName));

      // module = await checkModuleType(packagePath, module);

      BuildInfo.instance.ModuleList.add(module);
    }
  }
}

Future<bool> _checkJuneFlowModule(String packagePath, String packageName, String packageVersion) async {
  File file = File(path.join(packagePath, 'lib', 'util', '_', 'build_app', 'widget', 'run_app', '_'
      '.dart'));

  return await file.exists();
}

Future<String> _readReadmeContent(String projectPath) async {
  File readmeFile = File(path.join(projectPath, 'README.md'));
  if (await readmeFile.exists()) {
    return await readmeFile.readAsString();
  } else {
    return '';
  }
}

Future<List<FilePathAndContents>> _generateFilePathAndContentsList(
    String libraryName, String projectPath, List<String> copyPaths) async {
  List<String> filteredCopyPaths = copyPaths.where((copyPath) {
    bool startsWithUtil = copyPath.startsWith('lib/util');
    bool containsLibraryName = copyPath.contains(path.join(libraryName));
    bool doesNotStartWithAssets = !copyPath.startsWith('assets/');
    bool doesNotEndWithGitkeep = !copyPath.endsWith('add.june');

    return doesNotStartWithAssets &&
        doesNotEndWithGitkeep &&
        (!startsWithUtil || (startsWithUtil && containsLibraryName));
  }).toList();


  List<FilePathAndContents> files = [];

  for (String relativePath in filteredCopyPaths) {
    String fullPath = path.join(projectPath, relativePath);

    FileSystemEntityType entityType =
    await FileSystemEntity.type(fullPath, followLinks: false);

    if (entityType == FileSystemEntityType.file) {
      try {
        File file = File(fullPath);
        String content = await file.readAsString();  // Try to read the file as a string
        List<String> lines = content.split('\n');
        if (lines.isNotEmpty &&
            (lines.first.trim().startsWith('//@add') ||
                lines.first.trim().startsWith('#@add'))) {
          lines.removeAt(0);
        }
        content = lines.join('\n');

        files.add(FilePathAndContents()
          ..Path = path.relative(fullPath, from: projectPath)  // Use relative path
          ..CodeBloc = content);
      } catch (e) {
        // print('Failed to read $fullPath: $e');
        // Optionally, handle the error further or log to a file.
      }
    } else if (entityType == FileSystemEntityType.directory) {
      // Recursively list files in the directory
      await _listDirectoryFiles(Directory(fullPath), projectPath, files);
    }
  }

  return files;
}


Future<void> _listDirectoryFiles(Directory directory, String projectPath, List<FilePathAndContents> files) async {
  await for (FileSystemEntity entity in directory.list(recursive: true, followLinks: false)) {
    if (entity is File) {
      String entityPath = path.relative(entity.path, from: projectPath);
      String content = await entity.readAsString();
      List<String> lines = content.split('\n');
      if (lines.isNotEmpty &&
          (lines.first.trim().startsWith('//@add') ||
              lines.first.trim().startsWith('#@add'))) {
        lines.removeAt(0);
      }
      content = lines.join('\n');

      files.add(FilePathAndContents()
        ..Path = entityPath
        ..CodeBloc = content);
    }
  }
}

Future<Module> generateModuleObjFromPackage(
    String projectPath,
    String libraryName,
    String libraryVersion,
    ) async {
  Module moduleObj = Module();

  // add README contents
  moduleObj.ReadMeContents = await _readReadmeContent(projectPath);
  moduleObj.LibraryName = libraryName;
  moduleObj.LibraryVersion = libraryVersion;

  moduleObj.AddLineToGlobalImports = await _collectLinesWithAddTag(
      path.join(projectPath, 'lib', 'main.dart'), '//@add');

  moduleObj.Files = await _generateFilePathAndContentsList(libraryName,
      projectPath, await _findFilesInDirectoriesWithGitkeepForAdd(projectPath));

  moduleObj.PubspecCodeBloc = await _extractPubspecCodes(projectPath);

  return moduleObj;
}

Future<List<String>> _findFilesInDirectoriesWithGitkeepForAdd(
    String directoryPath) async {
  Directory directory = Directory(directoryPath);
  List<String> filesWithAddTag = [];

  Future<void> searchGitkeepFiles(Directory dir, String basePath) async {
    await for (FileSystemEntity entity
    in dir.list(recursive: false, followLinks: false)) {
      if (entity is Directory) {
        await searchGitkeepFiles(entity, basePath);
      } else if (entity is File) {
        try {
          String firstLine = await entity
              .readAsLines()
              .then((lines) => lines.isNotEmpty ? lines.first : '');
          if (entity.path.endsWith('add.june')) {
            if (firstLine.startsWith('@add')) {
              await for (FileSystemEntity fileEntity
              in entity.parent.list(recursive: true, followLinks: false)) {
                if (fileEntity is File) {
                  String relativePath =
                  path.relative(fileEntity.path, from: basePath);
                  filesWithAddTag.add(relativePath);
                }
              }
            }
          } else {
            if (firstLine.startsWith('#@add') ||
                firstLine.startsWith('//@add')) {
              String relativePath = path.relative(entity.path, from: basePath);
              filesWithAddTag.add(relativePath);
            }
          }
        } catch (e) {
          // Handle or log errors as needed
        }
      }
    }
  }

  await searchGitkeepFiles(directory, directoryPath);
  filesWithAddTag = filesWithAddTag.toSet().toList();
  return filesWithAddTag;
}

Future<List<String>> _collectLinesWithAddTag(
    String filePath, String filterKeyword) async {
  var file = File(filePath);
  var linesWithAddTag = <String>[];

  if (await file.exists()) {
    var lines = await file.readAsLines();
    for (var line in lines) {
      if ((line.trim().startsWith('import') || line.trim().startsWith('export')) && line.trim().endsWith
        (filterKeyword)) {
        linesWithAddTag.add(line.split(filterKeyword)[0].trim());
      }
    }
  } else {
    // Optionally handle file not found error or log it
  }

  return linesWithAddTag;
}

List<String> _parseYamlList(YamlMap yamlContent, String key) {
  var list = yamlContent[key];
  if (list is YamlList) {
    return list.map((item) => item.toString()).toList();
  }
  return [];
}

Future<List<PubspecCode>> _extractPubspecCodes(String projectPath) async {
  File pubspecFile = File(path.join(projectPath, 'pubspec.yaml'));
  if (!await pubspecFile.exists()) {
    print("File does not exist: ${pubspecFile.path}");
    return [];
  }

  List<String> lines = await pubspecFile.readAsLines();
  List<PubspecCode> codes = [];
  bool isAddSection = false;
  String title = '';
  String codeBloc = '';

  for (String line in lines) {
    if (line.trim() == "#@add start") {
      isAddSection = true;
      title = '';
      codeBloc = '';
    } else if (line.trim() == "#@add end" && isAddSection) {
      if (title.isNotEmpty && codeBloc.isNotEmpty) {
        codes.add(PubspecCode()
          ..Title = title
          ..CodeBloc = codeBloc.trimRight());
      }
      isAddSection = false;
    } else if (isAddSection) {
      if (title.isEmpty && line.contains(':')) {
        title = line.split(':')[0].trim();
        codeBloc += line + '\n';
      } else {
        codeBloc += line + '\n';
      }
    }
  }
  return codes;
}