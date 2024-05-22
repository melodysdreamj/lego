import 'dart:io';
import 'package:path/path.dart' as p;

Future<void> applyTempDirToProject() async {
  Directory tempDir = Directory('.tempDir');
  Directory currentDir = Directory.current;  // 현재 작업 디렉토리

  if (await tempDir.exists()) {
    await for (var element in tempDir.list(recursive: true)) {
      if (element is File) {
        // 상대 경로를 계산하고 현재 디렉토리로 적용
        String relativePath = p.relative(element.path, from: tempDir.path);
        String newPath = p.join(currentDir.path, relativePath);
        File newFile = File(newPath);

        if (await newFile.exists()) {
          continue;  // 파일이 이미 존재하면 건너뛰기
        }
        await newFile.create(recursive: true);  // 새 파일 생성 (필요한 경우 디렉토리 포함)
        await newFile.writeAsString(await element.readAsString());  // 내용 복사
      }
    }
    await tempDir.delete(recursive: true);  // .tempDir 디렉토리 삭제
  }
}
