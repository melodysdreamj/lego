import 'dart:io';

import '../../entity/enum/project_type/enum.dart';
import '../../entity/model/creation_result/model.dart';
import 'function/ask_user_input_for_project_creation/function.dart';
import 'function/change_project_name/function.dart';
import 'function/clone_and_remove_git/function.dart';
import 'function/recreate_name_new_folder/function.dart';
import 'function/remove_file/function.dart';
import 'function/rename_new_folder/function.dart';
import 'function/replace_string_in_file/function.dart';
import 'function/replace_sttring_in_files/function.dart';
import 'package:path/path.dart' as path;

createApp() async {
  CreationResult? result = await askUserInputForProjectCreation();
  if (result == null) {
    print('The app creation has been cancelled.');
    return;
  }

  bool successClone = false;
  if (result.Type == ProjectTypeEnum.Skeleton) {
    successClone = await cloneAndRemoveGit(
        'https://github.com/melodysdreamj/lego.git',
        'skeleton_project',
        result.Name);
    // } else if (result.Type == ProjectTypeEnum.JuneViewProject) {
    //   successClone =
    //       await cloneAndRemoveGit('https://github.com/melodysdreamj/lego.git', 'starter_project', result.Name);
  } else if (result.Type == ProjectTypeEnum.LegoTemplate) {
    successClone = await cloneAndRemoveGit(
        'https://github.com/melodysdreamj/lego.git',
        'lego_template',
        result.Name);
  }
  // else if (result.Type == ProjectTypeEnum.Skeleton) {
  //   successClone =
  //       await cloneAndRemoveGit('https://github.com/melodysdreamj/lego.git', 'skeleton_project', result.Name);
  // }
  if (successClone == false) {
    print('Failed to clone the project.');
    return;
  }

  await changeProjectName(result.Name, result.Name);

  await changeAndroidAppName(result.Name, result.Name);
  await changeIosAppName(result.Name, result.Name);
  await changeMacosAppName(result.Name, result.Name);
  await changeWebAppName(result.Name, result.Name);
  await changeLinuxAppName(result.Name, result.Name);
  await changeWindowsAppName(result.Name, result.Name);

  if (result.Type == ProjectTypeEnum.Skeleton) {
    await replaceStringInFiles(
        result.Name, 'june.lee.lego', result.PackageName);
    await removeFile(path.join(result.Name, 'LICENSE'));
    await replaceStringInFile(
        path.join(result.Name, 'lib', 'util', '_', 'shared_params', '_',
            'material_app.dart'),
        "static String appName = 'June';",
        "static String appName = '${result.Name}';");
    // } else if (result.Type == ProjectTypeEnum.JuneViewProject) {
    //   await replaceStringInFiles(result.Name, 'june.lee.lego', result.PackageName);
    //   await removeFile('${result.Name}/LICENSE');
  } else if (result.Type == ProjectTypeEnum.LegoTemplate) {
    await replaceStringInFiles(
        path.join(
          result.Name,
          'lib',
          'util',
          '_',
          'build_app',
        ),
        'New',
        _toPascalCase(result.Name));

    await renameNewFolders(path.join(result.Name, 'lib', 'util'), result.Name);
    await renameNewFolders(
        path.join(result.Name, 'assets', 'lego'), result.Name);

    await replaceStringInFile(path.join(result.Name, 'pubspec.yaml'),
        'assets/lego/_new/', 'assets/lego/${result.Name}/');

    await replaceStringInFile(
        path.join(
            result.Name,'lib', 'util', '_', 'shared_params', '_', 'material_app.dart'),
        "static String appName = 'June';",
        "static String appName = '${result.Name}';");

    await renameNewFolders(
        path.join(result.Name, 'lib', 'widget_book'), result.Name,
        checkDirName: [
          '_new',
          '_new.dialog',
          '_new.bottom_sheet',
          '_new.snackbar',
          '_new.toast',
          '_new.in_app_notification',
        ]);

    // } else if (result.Type == ProjectTypeEnum.ViewTemplate) {
    await renameNewFolders(
        path.join(result.Name, 'assets', 'lego'), result.Name);
    //   await reCreateNameNewFolders('${result.Name}/lib/app/_/_/interaction', result.Name);
    await replaceStringInFile(
        path.join(result.Name, 'README.md'), 'NewLego', result.Name);
    await replaceStringInFile(path.join(result.Name, 'pubspec.yaml'),
        'assets/lego/_new/', 'assets/view/${result.Name}/');
  } else {
    print('Invalid project type: ${result.Type}');
    return;
  }

  print('\nCongratulations! Your project has been created successfully!');
  print(
      'Please change your current directory to the project directory by executing the following command: 👉👉👉');
  print('cd ${result.Name} && flutter pub get');
}

String _toPascalCase(String text) {
  // 언더스코어로 단어를 분리하여 리스트를 생성
  List<String> words = text.split('_');

  // 모든 단어의 첫 글자를 대문자로 변환
  for (int i = 0; i < words.length; i++) {
    if (words[i].isNotEmpty) {
      words[i] =
          words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }
  }

  // 단어들을 다시 하나의 문자열로 합침
  return words.join('');
}
