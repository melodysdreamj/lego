import 'dart:io';

import '../../../../entity/model/pubspec_code/model.dart';

import 'package:path/path.dart' as path;


Future<void> updatePubspecWithCodeBlocks(List<PubspecCode> codeBloc) async {
  File pubspecFile = File(path.join(Directory.current.path, 'pubspec.yaml'));

  if (!await pubspecFile.exists()) {
    print('One or both of the specified files do not exist.');
    return;
  }

  String pubspecContent = await pubspecFile.readAsString();
  bool modified = false;

  for (PubspecCode pubspecCode in codeBloc) {
    String pattern = r'^' + RegExp.escape(pubspecCode.Title) + r':\s';
    if (!RegExp(pattern, multiLine: true).hasMatch(pubspecContent)) {
      String formattedBlock = pubspecCode.CodeBloc;
      pubspecContent += '\n\n$formattedBlock\n\n';
      modified = true;
      print('Adding ${pubspecCode.Title} block to pubspec.yaml');
    }
  }

  if (modified) {
    await pubspecFile.writeAsString(pubspecContent);
    print('pubspec.yaml has been updated with new blocks.');
  }
}

void main() async {
  // 'config_file_path.yaml'과 'pubspec.yaml'을 실제 파일 경로로 변경하세요.
  await updatePubspecWithCodeBlocks([]);
}
