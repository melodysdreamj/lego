String modifyCodeBlockForStateChild(String input) {
  // 입력 문자열을 라인별로 분리
  List<String> lines = input.split('\n');

  // 결과를 저장할 리스트
  List<String> processedLines = [];

  // 각 라인을 순회하며 조건에 맞는 라인 삭제 및 문자열 변경
  for (var line in lines) {
    // 'var state ='로 시작하거나 '/// do not change this line'으로 끝나는 라인을 건너뛰기
    if (line.trim().startsWith('var state =') || line.toString().endsWith('do not change this line')) {
      continue;
    }
    // 'state.' 문자열을 ''로 대체
    String processedLine = line.replaceAll('state.', '');
    processedLine = processedLine.replaceAll('updateState', 'setState');

    processedLines.add(processedLine);
  }

  // 처리된 라인들을 다시 문자열로 합치기
  return processedLines.join('\n');
}