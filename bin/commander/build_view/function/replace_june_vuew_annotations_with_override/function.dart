String replaceJuneViewAnnotationsWithOverride(String input) {
  // 문자열을 줄별로 나눈다.
  var lines = input.split('\n');

  // 조건에 맞는 라인을 @override로 대체한다.
  var modifiedLines = lines.map((line) {
    if (line.startsWith('@JuneViewAction()') || line.startsWith('@JuneViewEvent()')) {
      return '@override';
    }
    return line;
  }).toList();

  // 수정된 라인들을 다시 문자열로 합친다.
  return modifiedLines.join('\n');
}
