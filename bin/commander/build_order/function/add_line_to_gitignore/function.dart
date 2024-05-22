import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;


Future<void> addLineToGitignore(String lineToAdd) async {
  // 업로드한 .gitignore 파일의 경로를 지정합니다.
  // 업로드한 파일의 실제 경로로 변경해야 할 수도 있습니다.
  const String filePath = '.gitignore';
  final file = File(filePath);

  // 파일이 존재하지 않는 경우, 새로운 파일을 생성하고 원하는 내용을 추가합니다.
  if (!await file.exists()) {
    await file.writeAsString('\n' + lineToAdd + '\n');
    print('File not found. Creating new file and adding the line.');
    return;
  }

  // 파일이 존재하는 경우, 파일의 내용을 읽습니다.
  String contents = await file.readAsString();

  // 파일 내용이 이미 해당 줄을 포함하는지 검사합니다.
  if (contents.contains('\n' + lineToAdd + '\n') || contents.startsWith(lineToAdd + '\n')) {
    print('The line already exists in the file.');
    return;
  }

  // 파일의 마지막이 새로운 줄로 끝나지 않는 경우, 새로운 줄을 추가합니다.
  if (!contents.endsWith('\n')) {
    contents += '\n';
  }

  // 새로운 줄에 원하는 내용을 추가합니다.
  contents += lineToAdd + '\n';

  // 수정된 내용을 파일에 다시 씁니다.
  await file.writeAsString(contents);
  print('Line added to the file.');
}

Future<void> main() async {
  // 예시: 이 함수를 호출하여 '.gitignore' 파일에 원하는 내용을 추가합니다.
  // "example_line_to_add"를 원하는 내용으로 대체하세요.
  await addLineToGitignore('example_line_to_add');
}
