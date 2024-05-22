import 'dart:io';

Future<void> addImportOrExportReference(String filePath, String reference) async {
  // 파일을 읽습니다.
  String fileContent = await File(filePath).readAsString();

  // 파일의 내용을 줄별로 나눕니다.
  List<String> lines = fileContent.split('\n');

  // 참조가 이미 존재하는지 확인합니다.
  bool referenceExists = lines.any((line) => line.contains(reference));

  if (!referenceExists) {
    int insertIndex = lines.lastIndexWhere((line) => line.startsWith('import ') || line.startsWith('export ')) + 1;

    // 새로운 참조를 적절한 위치에 추가합니다.
    lines.insert(insertIndex, reference);

    // 수정된 내용을 다시 파일에 씁니다.
    await File(filePath).writeAsString(lines.join('\n'));
    // print('Reference added: $reference');
  } else {
    // print('Reference already exists: $reference');
  }
}
