import 'dart:io';

// flutter pub get을 실행하는 함수
Future<void> runFlutterPubGet() async {
  var currentDirectory = Directory.current.path;
  String flutterCommand = 'flutter';  // 기본 커맨드 설정

  // Windows 환경에서는 'flutter.bat'를 사용합니다.
  if (Platform.isWindows) {
    flutterCommand = 'flutter.bat';
  }

  var result = await Process.run(flutterCommand, ['pub', 'get'], workingDirectory: currentDirectory);

  // 실행 결과를 출력합니다.
  // print(result.stdout);
  // 에러가 있다면 에러도 출력합니다.
  if (result.stderr.isNotEmpty) {
    print('Error: ${result.stderr}');
  }
}