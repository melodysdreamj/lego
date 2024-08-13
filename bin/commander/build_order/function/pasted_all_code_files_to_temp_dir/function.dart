import 'dart:io';

import '../../../../entity/model/file_path_and_contents/model.dart';

Future<void> pasteAllCodeFiles(
    String libraryName, List<FilePathAndContents> files) async {
  String currentDirectory = Directory.current.path;

  for (FilePathAndContents fileObj in files) {
    String filePath = '$currentDirectory/.tempDir/${fileObj.Path}';
    File newFile = File(filePath);

    // 파일이 이미 존재하는지 확인
    if (await newFile.exists()) {
      // 파일이 이미 존재하면 에러 메시지를 출력하고 함수 실행을 종료
      // print('\x1B[31mError: The $libraryName conflicts with another module.\x1B[0m');
      throw Exception('The $libraryName conflicts with another module. filename : ${fileObj.Path}');
    }

    // 파일이 존재하지 않으면, 새로 생성하고 내용을 작성
    await newFile.create(recursive: true);
    await newFile.writeAsString(fileObj.CodeBloc);
  }
}