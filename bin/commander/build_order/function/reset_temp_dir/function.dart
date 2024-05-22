import 'dart:io';

Future<void> resetTempDir() async {
  final directory = Directory('.tempDir');

  // 디렉토리가 존재하는지 확인
  if (await directory.exists()) {
    // 존재하면 삭제
    await directory.delete(recursive: true);
    // print('.tempDir 디렉토리가 삭제되었습니다.');
  } else {
    // 존재하지 않으면 넘어감
    // print('.tempDir 디렉토리가 존재하지 않습니다.');
  }
}