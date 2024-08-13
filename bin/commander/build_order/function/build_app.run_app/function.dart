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


Future<void> findFunctionsAndGenerateFileBuildRunApp() async {
  String searchDirectory = path.join('lib', 'util', '_', 'build_app', 'widget', 'run_app');
  String targetFilePath = path.join(searchDirectory, '_.dart');
  final List<_AnnotatedFunctionInfo> coverFunctions = await _findCoverRunAppFunctions(searchDirectory);
  await _generateAndWriteBuildApp(coverFunctions, targetFilePath);
}

Future<List<_AnnotatedFunctionInfo>> _findCoverRunAppFunctions(String searchDirectory) async {
  final List<_AnnotatedFunctionInfo> functions = [];
  final directory = Directory(searchDirectory);
  await for (final file in directory.list(recursive: true, followLinks: false)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = await file.readAsString();
      // 정규 표현식 수정으로 인해 인덱스 추출 부분과 함수 이름 추출 부분의 그룹 번호가 변경될 수 있음
      final RegExp exp = RegExp(
          r'@CoverRunApp\((?:index:\s*(\d+(?:\.\d+)?)\s*)?\)\s*Widget\s*(\w+)\s*\(\s*Widget\s*widget\s*\)',
          multiLine: true
      );
      final matches = exp.allMatches(content);
      for (final match in matches) {
        // 인덱스 값 추출 부분
        final double? index = match.group(1) != null ? double.tryParse(match.group(1)!) : null;
        // 함수 이름 추출 부분의 그룹 번호를 변경
        final String functionName = match.group(2)!;
        functions.add(_AnnotatedFunctionInfo(filePath: file.path, functionName: functionName, index: index));
      }
    }
  }
  return functions;
}

Future<void> _generateAndWriteBuildApp(List<_AnnotatedFunctionInfo> coverFunctions, String targetFilePath) async {
  final StringBuffer coverFunctionCalls = StringBuffer();
  final Set<String> imports = Set(); // 중복을 방지하기 위해 Set 사용

  // 함수들을 인덱스에 따라 정렬 (인덱스가 없는 경우는 마지막으로)
  coverFunctions.sort((a, b) => (a.index ?? double.infinity).compareTo(b.index ?? double.infinity));


  for (final functionInfo in coverFunctions) {
    final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
    final importPath = relativeFilePath.replaceAll('\\', '/');
    // 파일 경로를 기반으로 import 문 생성
    imports.add("import '$importPath';");

    coverFunctionCalls.writeln('  childWidget = ${functionInfo.functionName}(childWidget);');
  }

  final String importStatements = imports.join('\n');

  final String buildAppFunction = '''
import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../function/before_run_app/_.dart';
import '../my_app/_.dart';
$importStatements

Future<void> buildApp({Widget? home}) async {
  if (home != null) MyAppHome = home;
  await readyBeforeRunApp();
  Widget childWidget = MyApp();
${coverFunctionCalls.toString()}
  return runApp(childWidget);
}


''';

  final File targetFile = File(targetFilePath);
  await targetFile.writeAsString(buildAppFunction);
  // print('buildApp util updated successfully with cover functions and imports.');
}
Future<void> main() async {
  findFunctionsAndGenerateFileBuildRunApp();
}
