import 'dart:io';
import 'package:path/path.dart' as p;

import '../../../../entity/model/module/model.dart';


Future<Module> checkAssetsHandler(String packageAbsolutePath,
    Module moduleObj, String moduleAssetsAbsolutePaths) async {
  // 현재의 패키지 경로
  String currentPath = Directory.current.path;

  // targetPath 계산: packageAbsolutePath로부터 moduleAssetsAbsolutePaths의 상대 경로를 구하고, 이를 currentPath와 결합
  String relativePath = p.relative(moduleAssetsAbsolutePaths, from: packageAbsolutePath);
  String targetPath = p.join(currentPath, relativePath);

  // 1. 해당 위치에 별도의 파일이 존재하는지 체크
  if (await _isExistAssetInDirectory(moduleAssetsAbsolutePaths)) {
    // 2. 재귀적으로 검사하면서 모든 디렉토리 검사해서 목록으로 만들어두기
    List<String> directories =
    await _findAllDirectoriesRelative(packageAbsolutePath, moduleAssetsAbsolutePaths);
    for (String directory in directories) {
      String _ = p.relative(directory, from: packageAbsolutePath);
      moduleObj.AddLineToPubspecAssetsBlock.add('$_/');
    }

    // 소스 디렉토리의 모든 엔티티를 탐색
    await for (var entity
    in Directory(moduleAssetsAbsolutePaths).list(recursive: true, followLinks: false)) {
      if (entity is File) {
        final String newPath =
        entity.path.replaceFirst(moduleAssetsAbsolutePaths, targetPath);
        if(newPath.endsWith('/add.june')) {
          continue;
        }
        final File newFile = File(newPath);

        // 새 파일의 디렉토리가 존재하지 않으면 생성
        if (!await newFile.parent.exists()) {
          await newFile.parent.create(recursive: true);
        }

        // 파일 복사
        await entity.copy(newPath);
      }
    }
  }

  return moduleObj;
}

// 디렉토리 내에 add.june 외에 다른 파일이나 폴더가 없는지 확인
Future<bool> _isExistAssetInDirectory(String directoryPath) async {
  // Directory 객체 생성
  final directory = Directory(directoryPath);

  // 디렉토리가 존재하는지 확인
  if (!await directory.exists()) {
    // print('Directory does not exist.');
    return false;
  }

  // 디렉토리 내의 모든 항목을 async* 스트림으로 반환
  await for (final entity in directory.list()) {
    // entity가 파일이면서 add.june가 아닌 경우 true 반환
    if (entity is File && !entity.path.endsWith('/add.june')) {
      return true;
    }
    // entity가 디렉토리인 경우(하위 디렉토리 탐색은 여기서 수행하지 않음)
    if (entity is Directory) {
      return true;
    }
  }

  // add.june 이외에 다른 파일이나 폴더가 없는 경우 false 반환
  return false;
}

Future<List<String>> _findAllDirectoriesRelative(String packageAbsolutePath, String assetFolderPath) async {
  Directory assetsDir = Directory(assetFolderPath);
  List<String> directories = [assetFolderPath];

  // if (!(await baseDir.exists())) {
  //   print('The specified base path does not exist.');
  //   return directories;
  // }

  await for (var entity in assetsDir.list(recursive: true, followLinks: false)) {
    if (entity is Directory) {
      // 절대 경로로부터 basePath 까지의 상대 경로를 계산
      String relativePath = p.relative(entity.path, from: packageAbsolutePath);
      directories.add(relativePath);
    }
  }

  return directories;
}
