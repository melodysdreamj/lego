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

Future<void> findFunctionsAndGenerateFileMaterialApp() async {
  String searchDirectory = path.join('lib', 'util', '_', 'build_app', 'widget', 'material_app');
  String targetFilePath = path.join(searchDirectory, '_.dart');
  final List<_AnnotatedFunctionInfo> coverFunctions = await _findCoverMaterialAppFunctions(searchDirectory);
  await _generateAndWriteMaterialAppInsideBuilder(coverFunctions, targetFilePath);
}


Future<List<_AnnotatedFunctionInfo>> _findCoverMaterialAppFunctions(String searchDirectory) async {
  final List<_AnnotatedFunctionInfo> functions = [];
  final directory = Directory(searchDirectory);
  await for (final file in directory.list(recursive: true, followLinks: false)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = await file.readAsString();
      // 인덱스가 선택적인 @CoverMaterialApp 어노테이션을 찾는 정규 표현식 수정
      final RegExp exp = RegExp(
          r'@CoverMaterialApp\((index:\s*(\d+(\.\d+)?)\s*)?\)\s*Widget\s*(\w+)\s*\(\s*BuildContext context,\s*Widget\s*widget\s*\)',
          multiLine: true
      );
      final matches = exp.allMatches(content);
      for (final match in matches) {
        // 인덱스 값이 있는 경우와 없는 경우 모두 처리
        final double? index = match.group(2) != null ? double.tryParse(match.group(2)!) : null;
        // 함수 이름 추출
        final String functionName = match.group(4)!; // 함수 이름에 해당하는 그룹 번호를 조정
        functions.add(_AnnotatedFunctionInfo(filePath: file.path, functionName: functionName, index: index));
      }
    }
  }
  return functions;
}

Future<void> _generateAndWriteMaterialAppInsideBuilder(List<_AnnotatedFunctionInfo> coverFunctions, String targetFilePath) async {
  // 인덱스 값이 있는 함수들과 없는 함수들을 분리하여 저장할 리스트
  List<_AnnotatedFunctionInfo> indexedFunctions = [];
  List<_AnnotatedFunctionInfo> nonIndexedFunctions = [];

  // 인덱스 값의 유무에 따라 함수를 분류
  for (final function in coverFunctions) {
    if (function.index != null) {
      indexedFunctions.add(function);
    } else {
      nonIndexedFunctions.add(function);
    }
  }

  // 인덱스가 있는 함수들을 인덱스 값에 따라 정렬
  indexedFunctions.sort((a, b) => a.index!.compareTo(b.index!));

  // 최종 함수 목록 생성: 인덱스가 있는 함수들 다음에 인덱스가 없는 함수들이 위치
  final List<_AnnotatedFunctionInfo> finalFunctions = []
    ..addAll(indexedFunctions)
    ..addAll(nonIndexedFunctions);

  final StringBuffer coverFunctionCalls = StringBuffer();
  final Set<String> imports = Set(); // 중복을 방지하기 위한 Set 컬렉션

  for (final functionInfo in finalFunctions) {
    final String relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
    final String importPath = relativeFilePath.replaceAll('\\', '/');
    imports.add("import '$importPath';"); // Import 문을 추가합니다.
    coverFunctionCalls.writeln('  child = ${functionInfo.functionName}(context, child!);');
  }

  final String importStatements = imports.join('\n');

  final String materialAppInsideBuilderFunction = '''
import 'package:flutter/material.dart';
import '../../../../../main.dart';

import '../../../shared_params/_/material_app.dart';
$importStatements

Widget materialAppInsideBuilder(BuildContext context, Widget? child) {
${coverFunctionCalls.toString()}
  return child!;
}

Widget Function() MaterialAppBuilder(BuildContext context) {
  return () =>
      currentMaterialApp ??
      MaterialApp(
        localizationsDelegates: MaterialAppParams.localizationsDelegates,
        supportedLocales: MaterialAppParams.supportedLocales ?? const <Locale>[Locale('en', 'US')],
        locale: MaterialAppParams.locale,
        title: MaterialAppParams.appName ?? 'June',
        theme: MaterialAppParams.lightTheme,
        darkTheme: MaterialAppParams.darkTheme,
        themeMode: MaterialAppParams.themeMode ?? ThemeMode.system,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return materialAppInsideBuilder(context, child);
        },
        navigatorObservers: MaterialAppParams.navigatorObservers ?? [],
        home: MyAppHome ?? InitView(),
      );
}
''';

  final File targetFile = File(targetFilePath);
  await targetFile.writeAsString(materialAppInsideBuilderFunction);
  // print('MaterialAppInsideBuilder util updated successfully with cover functions sorted by index and dynamic imports.');
}

Future<void> main() async {
  await findFunctionsAndGenerateFileMaterialApp();
}
