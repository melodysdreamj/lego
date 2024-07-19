import 'dart:io';

import '../../entity/enum/project_type/enum.dart';
import '../../singleton/build_info/model.dart';
import 'function/add_all_dev_modules/function.dart';
import 'function/add_asset_paths_in_pubspec/function.dart';
import 'function/add_bloc_to_pubspec/function.dart';
import 'function/add_global_export_if_not_exists/function.dart';
import 'function/add_line_to_gitignore/function.dart';
import 'function/add_readme/function.dart';
import 'function/apply_temp_dir_to_project/function.dart';
import 'function/build_app_with_juneflow_style/function.dart';
import 'function/check_is_right_project/function.dart';
import 'function/get_june_packages_in_project/function.dart';
import 'function/pasted_all_code_files_to_temp_dir/function.dart';
import 'function/reset_temp_dir/function.dart';

buildApp() async {

  bool isLegoProject = await checkIsRightProject();
  // if (!await checkIsRightProject()) {
  //   print('This is not a lego project');
  //   return;
  // }

  await addAllModules();

  await getJuneFlowPackagesInProject();

  // print(BuildInfo.instance.ModuleList);

  // 시작전 초기화하고 진행
  await resetTempDir();

  for (var module in BuildInfo.instance.ModuleList) {
    // 6. copy and paste the code file to the lib folder
    await pasteAllCodeFiles(module.LibraryName, module.Files);
  }

  if(isLegoProject) {
    for (var module in BuildInfo.instance.ModuleList) {
      // 1. global_imports.dart 수정
      for (var globalImport in module.AddLineToGlobalImports) {
        // global_imports.dart 파일을 읽어서 해당 모듈의 global_imports를 추가한다.
        await addExportIfNotExists(globalImport);
      }

      // 2. gitignore 추가
      for (var gitignore in module.AddLineToGitignore) {
        // gitignore 파일을 읽어서 해당 모듈의 gitignore를 추가한다.
        await addLineToGitignore(gitignore);
      }

      // 3. add code block to pubspec
      await updatePubspecWithCodeBlocks(module.PubspecCodeBloc);

      // 4. add readme
      // if(module.Type == ProjectTypeEnum.ModuleTemplate || module.Type == ProjectTypeEnum.ViewTemplate) {
      //   await addReadme(module.ReadMeContents, module.LibraryName);
      // }

      // 5. check asset if exist, add to pubspec
      await addAssetPaths(
          module.AddLineToPubspecAssetsBlock.map((item) => item.toString().replaceAll('\\', '/'))
              .toList());

      // 7. add package to pubspec
      // await addPackagesIfNeeded(module.Packages, devPackage: false);
      // await addPackagesIfNeeded(module.DevPackage, devPackage: true);
    }



    // 8. build project with lego style
    await buildAppWithJuneFlowStyle();
  }

  for (var module in BuildInfo.instance.ModuleList) {
    // 5. check asset if exist, add to pubspec
    await addAssetPaths(
        module.AddLineToPubspecAssetsBlock.map((item) => item.toString().replaceAll('\\', '/'))
            .toList());
  }

  // 7. apply .tempDir to lib folder
  await applyTempDirToProject();

}
