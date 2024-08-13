import 'dart:convert';
import 'dart:io';

Future<void> addAssetPaths(List<String> newPaths) async {
  const String filePath = 'pubspec.yaml';
  File file = File(filePath);

  if (await file.exists()) {
    final contents = await file.readAsString();
    List<String> lines = const LineSplitter().convert(contents);

    int flutterSectionIndex = lines.indexWhere((line) => line.startsWith('flutter:'));
    if (flutterSectionIndex != -1) {
      int assetsIndex = lines.indexWhere((line) => line.trim() == 'assets:', flutterSectionIndex);

      // 새로운 경로가 있고, 'assets:' 섹션이 없는 경우에만 'assets:' 섹션을 추가합니다.
      if (assetsIndex == -1 && newPaths.isNotEmpty) {
        lines.insert(flutterSectionIndex + 1, '  assets:');
        assetsIndex = flutterSectionIndex + 1; // 새로운 assetsIndex 업데이트
      }

      for (String newPath in newPaths) {
        bool pathExists = false;
        // 이미 'assets:' 섹션이 있는 경우, 새 경로가 이미 존재하는지 확인합니다.
        for (int i = assetsIndex + 1; i < lines.length && lines[i].startsWith('    -'); i++) {
          if (lines[i].trim() == '- $newPath') {
            pathExists = true;
            break;
          }
        }

        if (!pathExists && assetsIndex != -1) {
          // 새 경로가 존재하지 않는 경우, 추가합니다.
          lines.insert(assetsIndex + 1, '    - $newPath');
          // print('Added asset path: $newPath');
        } else if (pathExists) {
          // 경로가 이미 존재하는 경우, 사용자에게 알립니다.
          // print('Asset path already exists and was not added: $newPath');
        }
      }

      if (newPaths.isNotEmpty) {
        // 파일에 쓰기
        await file.writeAsString(lines.join('\n'));
        // print('Asset paths processing completed.');
      } else if (assetsIndex == -1) {
        // print('No new asset paths to add and no existing "assets:" section to update.');
      }
    } else {
      print('Flutter section not found in pubspec.yaml');
    }
  } else {
    print('pubspec.yaml file not found.');
  }
}
