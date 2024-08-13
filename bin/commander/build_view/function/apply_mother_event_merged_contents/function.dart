import 'dart:io';
import 'dart:async';

import '../add_import_or_export_reference/function.dart';
import '../remove_june_view_annotations/function.dart';

import 'package:path/path.dart' as path;

Future<void> applyMotherEventMergedContents(Map<String, Map<String, String>> mergedDirectoryContents) async {
  for (var directory in mergedDirectoryContents.keys) {
    String targetFilePath = path.join(directory, '..', '_', 'state_mother.dart');
    File targetFile = File(targetFilePath);

    // 파일이 존재하는지 확인
    if (await targetFile.exists()) {
      // 'import'와 'export' 문 적용
      String importsExports = mergedDirectoryContents[directory]!['imports_exports']!;
      for (String reference in importsExports.split('\n')) {
        if (reference.isNotEmpty) {
          await addImportOrExportReference(targetFilePath, reference);
        }
      }

      // 코드 블록 추가
      String codeBlock = mergedDirectoryContents[directory]!['code']!;
      codeBlock = removeJuneViewAnnotations(codeBlock);
      await _addCodeBlock(targetFilePath, codeBlock.trim());
    } else {
      print('File does not exist: $targetFilePath');
    }
  }
}


Future<void> _addCodeBlock(String filePath, String codeBlock) async {
  String fileContent = await File(filePath).readAsString();
  List<String> lines = fileContent.split('\n');
  int startIndex = -1;
  int endIndex = -1;

  // 각 줄을 순회하며 시작과 끝 인덱스 찾기
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].contains('/// automatically generated event code - don\'t change this code')) {
      startIndex = i;
    }
    if (lines[i].contains('/// end of automatically event generated code')) {
      endIndex = i;
      break; // 끝 인덱스를 찾으면 반복 종료
    }
  }


  // 시작과 끝 마커가 모두 존재하는 경우에만 처리
  if (startIndex != -1 && endIndex != -1) {
    // 마커 사이의 내용을 삭제하고, 하나의 빈 줄을 남깁니다.
    lines.removeRange(startIndex + 1, endIndex);
    lines.insert(startIndex + 1, ''); // 빈 줄 추가
    // 새로운 코드 블록을 빈 줄 다음에 추가
    lines.insert(startIndex + 2, codeBlock);
  } else if (startIndex != -1) {
    // 끝 마커가 없는 경우, 시작 마커 바로 다음에 빈 줄과 코드 블록 추가
    lines.insert(startIndex + 1, '');
    lines.insert(startIndex + 2, codeBlock);
  } else {
    print('Start marker not found in: $filePath');
    return;
  }

  // 수정된 내용을 파일에 다시 쓴다.
  await File(filePath).writeAsString(lines.join('\n'));
  // print('Code block and an empty line added to: $filePath');
}