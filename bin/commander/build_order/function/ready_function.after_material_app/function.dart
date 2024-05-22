// import 'dart:io';
// import 'dart:async';
// import 'package:path/path.dart' as p;
// import 'package:path/path.dart' as path;
//
//
// class _AnnotatedFunctionInfo {
//   final String filePath;
//   final String functionName;
//   final double? index;
//
//   _AnnotatedFunctionInfo({required this.filePath, required this.functionName, this.index});
// }
//
// Future<void> findFunctionsAndGenerateFileAfterMaterialApp() async {
//   String searchDirectory = path.join('lib', 'util', '_', 'build_app', 'ready_functions', 'afte
//   r_material_app');
//   String targetFilePath = path.join(searchDirectory, '_.dart');
//   final List<_AnnotatedFunctionInfo> functions = await _findAnnotatedFunctions(searchDirectory);
//
//   await _generateAndWriteReadyAfterMaterialApp(functions, targetFilePath, searchDirectory);
// }
//
//
// Future<List<_AnnotatedFunctionInfo>> _findAnnotatedFunctions(String searchDirectory) async {
//   final List<_AnnotatedFunctionInfo> functions = [];
//   final directory = Directory(searchDirectory);
//   if (!directory.existsSync()) {
//     print('Search directory does not exist.');
//     return functions;
//   }
//
//   await for (final file in directory.list(recursive: true, followLinks: false)) {
//     if (file is File && file.path.endsWith('.dart')) {
//       final content = await file.readAsString();
//       // 매개변수를 포함하는 함수 형태를 처리할 수 있도록 정규 표현식 수정
//       final RegExp exp = RegExp(r'@ReadyAfterMaterialApp\((index:\s*(\d+(\.\d+)?)\s*)?\)\s*void\s*(\w+)\s*\((.*?)\)', multiLine: true);
//       final matches = exp.allMatches(content);
//
//       for (final match in matches) {
//         final index = match.group(2) != null ? double.parse(match.group(2)!) : null;
//         final functionName = match.group(4)!;
//         functions.add(_AnnotatedFunctionInfo(filePath: file.path, functionName: functionName, index: index));
//       }
//     }
//   }
//
//   return functions;
// }
//
// Future<void> _generateAndWriteReadyAfterMaterialApp(List<_AnnotatedFunctionInfo> functions, String targetFilePath, String searchDirectory) async {
//   final StringBuffer functionCalls = StringBuffer();
//   final Set<String> imports = {};
//
// // 인덱스 기준으로 함수 정렬
//   functions.sort((a, b) => a.index?.compareTo(b.index ?? 0) ?? -1);
//
// // 인덱스가 있는 함수와 없는 함수를 분리
//   final indexedFunctions = functions.where((f) => f.index != null).toList();
//   final unindexedFunctions = functions.where((f) => f.index == null).toList();
//
// // 인덱스가 있는 함수들의 호출문 생성
//   for (final functionInfo in indexedFunctions) {
//     final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
//     final importPath = relativeFilePath.replaceAll('\\', '/');
//     imports.add("import '$importPath';");
//     functionCalls.writeln('  ${functionInfo.functionName}(context);');
//   }
//
// // 인덱스가 없는 함수들의 호출문 생성
//   if (unindexedFunctions.isNotEmpty) {
//
//     for (final functionInfo in unindexedFunctions) {
//       final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
//       final importPath = relativeFilePath.replaceAll('\\', '/');
//       imports.add("import '$importPath';");
//       functionCalls.writeln('  ${functionInfo.functionName}(context);');
//     }
//
//     // // 인덱스가 없는 함수가 단 하나인 경우, Future.wait 없이 직접 호출
//     // if (unindexedFunctions.length == 1) {
//     //   final functionInfo = unindexedFunctions.first;
//     //   final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
//     //   final importPath = relativeFilePath.replaceAll('\\', '/');
//     //   imports.add("import '$importPath';");
//     //   functionCalls.writeln('  await ${functionInfo.functionName}(context);');
//     // } else {
//     //   // 여러 개인 경우, Future.wait 사용
//     //   functionCalls.writeln('  await Future.wait([');
//     //   for (final functionInfo in unindexedFunctions) {
//     //     final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
//     //     final importPath = relativeFilePath.replaceAll('\\', '/');
//     //     imports.add("import '$importPath';");
//     //     functionCalls.writeln('    ${functionInfo.functionName}(context),');
//     //   }
//     //   functionCalls.writeln('  ]);');
//     // }
//   }
//
//   final String importStatements = imports.join('\n');
//
//   final String readyAfterMaterialAppFunction = '''
// import 'package:flutter/material.dart';
// import '../../../../../main.dart';
// $importStatements
//
// void readyAfterMaterialApp(BuildContext context) {
//   if (_done) return;
//   _done = true;
//
// ${functionCalls.toString()}
//
// }
//
// bool _done = false;
// ''';
//
//   final File targetFile = File(targetFilePath);
//   await targetFile.writeAsString(readyAfterMaterialAppFunction);
//   // print('readyAfterMaterialApp util updated successfully with dynamic imports and util calls.');
// }
//
// Future<void> main() async {
//   await findFunctionsAndGenerateFileAfterMaterialApp();
// }
