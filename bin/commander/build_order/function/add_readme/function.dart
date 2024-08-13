import 'dart:io';
import 'package:path/path.dart' as path;

// Future<void> addReadme(String readmeContent, String libraryName) async {
//   if (readmeContent.isEmpty) {
//     print('Readme content is empty.');
//     return;
//   }
//
//   String currentPath = Directory.current.path;
//   String directoryPath = path.join(currentPath, 'lib', 'util', 'usage', libraryName);
//   await Directory(directoryPath).create(recursive: true); // 폴더 생성
//
//   String filePath = path.join(directoryPath, 'README.md');
//   File file = File(filePath);
//   await file.writeAsString(readmeContent); // 비동기 방식으로 파일 쓰기
// }
