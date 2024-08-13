import 'dart:io';

Future<void> removePackageVersion(String filePath, String packageName) async {
  File pubspec = File(filePath);
  if (!await pubspec.exists()) {
    // print('지정한 경로의 pubspec.yaml 파일을 찾을 수 없습니다.');
    return;
  }

  List<String> lines = await pubspec.readAsLines();
  bool found = false;

  List<String> updatedLines = lines.map((line) {
    // 각 줄의 시작 부분에서 '$packageName:' 패턴을 찾습니다.
    if (line.startsWith('  $packageName:') || line.startsWith('$packageName:')) {
      found = true;
      if (line.contains('#@add')) {
        int index = line.indexOf('#@add');
        return '${line.substring(0, index).trimRight()} #@add';
      }
      return line.substring(0, line.indexOf(':') + 1);  // 콜론 다음 내용을 제거하지만 공백은 유지
    }
    return line;
  }).toList();

  if (!found) {
    // print('$packageName 패키지가 pubspec.yaml 파일에 없습니다.');
    return;
  }

  await pubspec.writeAsString(updatedLines.join('\n'));
  // print('패키지 버전 정보가 성공적으로 제거되었습니다.');
}


// void main() async {
//   String filePath = 'path/to/your/pubspec.yaml';  // 파일 경로를 입력하세요
//   String packageName = 'package_name';            // 패키지 이름을 입력하세요
//   await removePackageVersion(filePath, packageName);
// }
