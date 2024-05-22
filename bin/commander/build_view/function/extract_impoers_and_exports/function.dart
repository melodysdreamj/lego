// 파일 내용을 분석하여 'import'와 'export' 문을 분리하고 나머지 코드도 분리하는 함수
Map<String, String> extractImportsAndExports(String fileContent) {
  // 줄별로 파일 내용 나누기
  List<String> lines = fileContent.split('\n');

  // 'import'와 'export' 문을 분리하여 저장할 리스트
  List<String> importExportLines = [];
  // 나머지 코드를 저장할 리스트
  List<String> codeLines = [];

  // 각 줄을 확인하며 'import' 또는 'export' 부분과 코드 부분 분리
  for (var line in lines) {
    // 줄이 'import' 또는 'export'로 시작한다면 importExportLines 리스트에 추가
    if (line.startsWith('import ') || line.startsWith('export ')) {
      importExportLines.add(line);
    } else {
      // 그렇지 않다면 코드 리스트에 추가
      codeLines.add(line);
    }
  }

  // 분리된 'import'/'export' 부분과 코드 부분을 문자열로 변환
  String importExportString = importExportLines.join('\n');
  String codeString = codeLines.join('\n');

  // 결과를 Map으로 반환
  return {
    'imports_exports': importExportString,
    'code': codeString,
  };
}