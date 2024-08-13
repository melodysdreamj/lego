import 'dart:io';

import '../extract_impoers_and_exports/function.dart';

/// 이 함수는 "action"과 "event" 디렉토리에 속한 파일들을 디렉토리 경로별로 별도로 분류 및 병합하여,
/// 각 디렉토리 타입별로 정리된 코드와 import/export 문을 맵 형태로 반환합니다.
Future<Map<String, Map<String, Map<String, String>>>>
    mergeFilesInActionAndEventDirectories(List<String> filePaths) async {
  Map<String, Map<String, List<String>>> directoryFilesMap = {
    'action': {},
    'event': {}
  };
  Map<String, Map<String, Map<String, String>>> mergedResults = {
    'action': {},
    'event': {}
  };

  // 파일 경로를 바탕으로 'action'과 'event' 디렉토리별 파일 리스트 생성
  for (var filePath in filePaths) {
    var file = File(filePath);
    var directory = file.parent.path;
    var directoryName = directory.split(Platform.pathSeparator).last;

    if (directoryFilesMap.containsKey(directoryName)) {
      directoryFilesMap[directoryName]!.putIfAbsent(directory, () => []);
      directoryFilesMap[directoryName]![directory]!.add(filePath);
    }
  }

  // 'action'과 'event' 디렉토리별로 파일 내용 분석 및 병합
  for (var directoryType in ['action', 'event']) {
    for (var directory in directoryFilesMap[directoryType]!.keys) {
      List<String> importsExports = [];
      List<String> codes = [];

      for (var filePath in directoryFilesMap[directoryType]![directory]!) {
        String fileContent = await File(filePath).readAsString();
        var extracted = extractImportsAndExports(fileContent);

        extracted['imports_exports']!.split('\n').forEach((importExportLine) {
          if (!importsExports.contains(importExportLine) &&
              importExportLine.isNotEmpty) {
            importsExports.add(importExportLine);
          }
        });

        codes.add(extracted['code']!);
      }

      mergedResults[directoryType]![directory] = {
        'imports_exports': importsExports.join('\n'),
        'code': codes.join('\n\n')
      };
    }
  }

  return mergedResults;
}
