import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;

Future<void> renameNewFolders(String directoryPath, String newName, {List<String>? checkDirName}) async {
  final Directory directory = Directory(directoryPath);

  if (!await directory.exists()) {
    print('The specified directory does not exist.');
    return;
  }

  // 폴더 이름을 변경할 대상 폴더 목록을 먼저 수집합니다.
  final List<Directory> directoriesToRename = [];

  await for (final FileSystemEntity entity in directory.list(recursive: true)) {
    if (entity is Directory) {
      final String dirName = p.basename(entity.path);
      // 정확히 '_new'인 폴더와 '_new.'로 시작하는 폴더를 체크합니다.
      if (dirName == '_new' || (checkDirName != null && (checkDirName.contains(dirName) || dirName.startsWith('_new.')))) {
        directoriesToRename.add(entity);
      }
    }
  }

  // 수집한 폴더 목록의 이름을 변경합니다.
  for (final Directory dir in directoriesToRename) {
    String newPath = dir.path;
    final String dirName = p.basename(dir.path);
    if (dirName == '_new') {
      newPath = dir.path.replaceFirst(RegExp(r'_new$'), newName);
    } else if (dirName.startsWith('_new.')) {
      newPath = dir.path.replaceFirst(RegExp(r'_new'), newName);
    } else if (checkDirName != null && checkDirName.contains(dirName)) {
      newPath = dir.path.replaceFirst(RegExp(dirName + r'$'), newName);
    }
    await dir.rename(newPath);
    // print('Renamed ${dir.path} to $newPath');
  }
}
