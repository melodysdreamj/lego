import 'dart:io';
import 'package:path/path.dart' as path;

import 'dart:io';
import 'package:path/path.dart' as path;

import '../remove_action_or_event_import_on_view/function.dart';

Future<void> cleanAndProcessDartFilesInDirectory(String directoryPath) async {
  final directory = Directory(directoryPath);
  await for (final FileSystemEntity entity in directory.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      await cleanImportsAndGeneratedCodeInFile(entity.path);
    }
  }
}

Future<void> cleanImportsAndGeneratedCodeInFile(String filePath) async {
  String fileContent = await File(filePath).readAsString();
  List<String> lines = fileContent.split('\n');

  // @JuneViewChild() 또는 @JuneViewMother()가 있는지 확인
  bool hasTargetLines = lines.any((line) => line.startsWith('@JuneViewChild()') || line.startsWith('@JuneViewMother()'));
  if (!hasTargetLines) return; // 해당하는 줄이 없으면 아무 작업도 수행하지 않음

  await removeActionOrEventImportOnView(filePath);

  // 필요한 import 목록
  final requiredImports = [
    "import 'package:flutter/cupertino.dart';",
    "import 'package:flutter/material.dart';",
    "import '../../../../../../../../../main.dart';",
    "import '../view.dart';",
  ];

  // 이미 존재하는 import 확인
  List<String> existingImports = [];
  lines.retainWhere((line) {
    bool isImportLine = line.startsWith('import ');
    if (isImportLine && requiredImports.contains(line.trim())) {
      existingImports.add(line.trim());
    }
    return !isImportLine || requiredImports.contains(line.trim());
  });

  // 필요한 import 중 누락된 것이 있으면 추가
  List<String> missingImports = requiredImports.where((import) => !existingImports.contains(import)).toList();
  if (missingImports.isNotEmpty) {
    lines.insertAll(0, missingImports);
  }

  // 자동 생성된 코드 블록 처리
  removeContentBetweenGeneratedCodeMarkers(lines, 'action');
  removeContentBetweenGeneratedCodeMarkers(lines, 'event');

  // 파일에 변경사항 저장
  await File(filePath).writeAsString(lines.join('\n'));
}

void removeContentBetweenGeneratedCodeMarkers(List<String> lines, String type) {
  const startMarker = '/// automatically generated {type} code - don\'t change this code';
  const endMarker = '/// end of automatically {type} generated code';
  int startIndex = -1;
  int endIndex = -1;

  for (int i = 0; i < lines.length; i++) {
    if (lines[i].contains(startMarker.replaceFirst('{type}', type))) {
      startIndex = i;
    }
    if (lines[i].contains(endMarker.replaceFirst('{type}', type))) {
      endIndex = i;
      if (startIndex != -1) break; // 시작과 끝 인덱스 모두 찾으면 반복 종료
    }
  }

  if (startIndex != -1 && endIndex != -1 && endIndex > startIndex) {
    lines.removeRange(startIndex + 1, endIndex);
    lines.insert(startIndex + 1, ''); // 빈 줄 추가
  }
}
