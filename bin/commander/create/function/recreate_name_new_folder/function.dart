import 'dart:io';
import 'package:path/path.dart' as p;

Future<void> reCreateNameNewFolders(String directoryPath, String newName) async {
  final Directory directory = Directory(directoryPath);

  if (!await directory.exists()) {
    print('The specified directory does not exist.');
    return;
  }

  await for (final FileSystemEntity entity in directory.list(recursive: true)) {
    if (entity is Directory) {
      final String dirName = p.basename(entity.path);
      if (dirName == '_new') {
        // 새 경로를 생성합니다.
        final String newPath = entity.path.replaceFirst(RegExp(r'_new$'), newName);
        await copyDirectory(entity, Directory(newPath));
      }
    }
  }
}

Future<void> copyDirectory(Directory source, Directory destination) async {
  if (!await destination.exists()) {
    await destination.create(recursive: true);
  }

  await for (final FileSystemEntity entity in source.list()) {
    final String newPath = p.join(destination.path, p.basename(entity.path));
    if (entity is File) {
      await entity.copy(newPath);
    } else if (entity is Directory) {
      await copyDirectory(entity, Directory(newPath));
    }
  }
}