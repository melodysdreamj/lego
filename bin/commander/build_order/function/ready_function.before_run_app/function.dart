import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:path/path.dart' as path;



class _AnnotatedFunctionInfo {
  final String filePath;
  final String functionName;
  final double? index;

  _AnnotatedFunctionInfo({required this.filePath, required this.functionName, this.index});
}

Future<void> findFunctionsAndGenerateFileBeforeRunApp() async {
  String searchDirectory = path.join('lib', 'util', '_', 'build_app', 'function', 'before_run_app');
  String targetFilePath = path.join(searchDirectory, '_.dart');
  final List<_AnnotatedFunctionInfo> functions = await _findAnnotatedFunctions(searchDirectory);

  await _generateAndWriteReadyBeforeRunApp(functions, targetFilePath, searchDirectory);
}


Future<List<_AnnotatedFunctionInfo>> _findAnnotatedFunctions(String searchDirectory) async {
  final List<_AnnotatedFunctionInfo> functions = [];
  final directory = Directory(searchDirectory);
  if (!directory.existsSync()) {
    print('Search directory does not exist.');
    return functions;
  }

  await for (final file in directory.list(recursive: true, followLinks: false)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = await file.readAsString();
      final RegExp exp = RegExp(r'@ReadyBeforeRunApp\((index:\s*(\d+(\.\d+)?)\s*)?\)\s*Future<void>\s*(\w+)\s*\(\)\s*async', multiLine: true);
      final matches = exp.allMatches(content);

      for (final match in matches) {
        final index = match.group(2) != null ? double.parse(match.group(2)!) : null;
        final functionName = match.group(4)!;
        functions.add(_AnnotatedFunctionInfo(filePath: file.path, functionName: functionName, index: index));
      }
    }
  }

  return functions;
}

Future<void> _generateAndWriteReadyBeforeRunApp(List<_AnnotatedFunctionInfo> functions, String targetFilePath, String searchDirectory) async {
  final StringBuffer functionCalls = StringBuffer();
  final Set<String> imports = {};

  // 인덱스 기준으로 함수 정렬
  functions.sort((a, b) => a.index?.compareTo(b.index ?? 0) ?? -1);

  // 인덱스가 있는 함수와 없는 함수를 분리
  final indexedFunctions = functions.where((f) => f.index != null).toList();
  final unindexedFunctions = functions.where((f) => f.index == null).toList();

  // 인덱스가 있는 함수들의 호출문 생성
  for (final functionInfo in indexedFunctions) {
    final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
    final importPath = relativeFilePath.replaceAll('\\', '/');
    imports.add("import '$importPath';");

    functionCalls.writeln('  await ${functionInfo.functionName}();');
  }

  // 인덱스가 없는 함수들의 호출문 생성
  if (unindexedFunctions.isNotEmpty) {
    functionCalls.writeln('  await Future.wait([');
    for (final functionInfo in unindexedFunctions) {
      final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
      final importPath = relativeFilePath.replaceAll('\\', '/');
      // 중복 import 방지
      imports.add("import '$importPath';");

      functionCalls.writeln('    ${functionInfo.functionName}(),');
    }
    functionCalls.writeln('  ]);');
  }

  final String importStatements = imports.join('\n');

  // 최종 함수와 import 문 생성
  final String readyBeforeRunAppFunction = '''
import 'package:flutter/material.dart';
import '../../../../../main.dart';
$importStatements

Future<void> readyBeforeRunApp() async {
  if (_done) return;
  _done = true;
${functionCalls.toString()}
}

bool _done = false;
''';

  final File targetFile = File(targetFilePath);
  await targetFile.writeAsString(readyBeforeRunAppFunction);
  // print('readyBeforeRunApp util updated successfully with dynamic imports and util calls.');
}


Future<void> main() async {
  await findFunctionsAndGenerateFileBeforeRunApp();
}
