import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as p;

class _AnnotatedFunctionInfo {
  final String filePath;
  final String functionName;
  final double? index;

  _AnnotatedFunctionInfo({required this.filePath, required this.functionName, this.index});
}

// 지정된 디렉토리에서 @ReadyForListener 어노테이션이 있는 함수들을 찾는 함수
Future<List<_AnnotatedFunctionInfo>> _findAnnotatedFunctions(String searchDirectory) async {
  final List<_AnnotatedFunctionInfo> functions = [];
  final directory = Directory(searchDirectory);
  if (!directory.existsSync()) {
    // print('Search directory does not exist.');
    return functions; // 디렉토리가 존재하지 않으면 빈 목록 반환
  }

  await for (final file in directory.list(recursive: true, followLinks: false)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = await file.readAsString();
      final RegExp exp = RegExp(r'@ReadyForListener\((index:\s*(\d+(\.\d+)?)\s*)?\)\s*Future<void>\s*(\w+)\s*\(\s*BuildContext context\s*\)\s*async', multiLine: true);
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

// 함수 호출과 import 문을 생성하고 파일에 쓰는 함수
Future<void> _generateAndWriteReadyForListeners(List<_AnnotatedFunctionInfo> functions, String targetFilePath, String searchDirectory) async {
  final StringBuffer functionCalls = StringBuffer();
  final Set<String> imports = {};
  final directory = Directory(p.dirname(targetFilePath));

  // 타겟 파일 디렉토리가 존재하지 않는 경우 생성
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }

  // 인덱스 기준으로 함수 정렬
  functions.sort((a, b) => a.index?.compareTo(b.index ?? 0) ?? -1);

  // 함수 호출문 생성
  for (final functionInfo in functions) {
    final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
    final importPath = relativeFilePath.replaceAll('\\', '/');
    imports.add("import '$importPath';");

    functionCalls.writeln('  await ${functionInfo.functionName}(context);');
  }

  final String importStatements = imports.join('\n');

  // 최종 함수와 import 문 생성
  final String readyForListenersFunction = '''
import 'package:flutter/material.dart';
import '../../../../../main.dart';
$importStatements

Future<void> readyForListeners(BuildContext context) async {
  if (_done) return; _done = true;

${functionCalls.toString()}
}
bool _done = false;
''';

  final File targetFile = File(targetFilePath);
  await targetFile.writeAsString(readyForListenersFunction);
}

// 앱 실행 전에 함수들을 찾아서 파일 생성
Future<void> findFunctionsAndGenerateFileReadyListener() async {
  String searchDirectory = p.join('lib', 'app', '_', '_', 'interaction', 'listener');
  String targetFilePath = p.join(searchDirectory, '_.dart');
  final List<_AnnotatedFunctionInfo> functions = await _findAnnotatedFunctions(searchDirectory);

  if (functions.isNotEmpty) {
    await _generateAndWriteReadyForListeners(functions, targetFilePath, searchDirectory);
  } else {
    // print('No functions found or search directory does not exist.');
  }
}

Future<void> main() async {
  await findFunctionsAndGenerateFileReadyListener();
}
