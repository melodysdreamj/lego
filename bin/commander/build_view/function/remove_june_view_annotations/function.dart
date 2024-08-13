String removeJuneViewAnnotations(String input) {
  // 문자열을 줄별로 나눈다.
  var lines = input.split('\n');

  // 조건에 맞지 않는 라인들만 필터링하여 다시 조합한다.
  var filteredLines = lines.where((line) =>
  !line.startsWith('@JuneViewAction()') && !line.startsWith('@JuneViewEvent()')).toList();

  // 필터링된 라인들을 다시 문자열로 합친다.
  return filteredLines.join('\n');
}