import 'dart:io';

import 'dart:io';
import 'package:yaml/yaml.dart';

import '../flutter_pub_get/function.dart';
import 'package:path/path.dart' as path;

import '../remove_package_version_in_pubsepc/function.dart';

Future<bool> addFlutterPackage(String packageName,
    {String? version, bool? devPackage = false}) async {
  // print('trying to add $packageName');
  // pubspec.yaml 파일을 로드합니다.
  final File pubspecFile =
      File(path.join(Directory.current.path, 'pubspec.yaml'));
  final String pubspecContent = await pubspecFile.readAsString();
  final dynamic pubspec = loadYaml(pubspecContent);

  // dependencies 또는 dev_dependencies 목록에 패키지가 이미 있는지 확인합니다.
  final Map<dynamic, dynamic>? dependencies = pubspec['dependencies'];
  final Map<dynamic, dynamic>? devDependencies = pubspec['dev_dependencies'];
  bool packageExists =
      (dependencies != null && dependencies.containsKey(packageName)) ||
          (devDependencies != null && devDependencies.containsKey(packageName));

  // 패키지가 이미 있으면 추가하지 않고 함수를 종료합니다.
  if (packageExists) {
    // print("Package $packageName is already installed.");
    //존재하는경우
    return true;
  }

  // 버전이 숫자와 점으로만 이루어져 있는지 확인합니다.
  final isValidVersion =
      version != null && RegExp(r'^\d+(\.\d+)*$').hasMatch(version);

  // 유효한 버전이 제공되었을 경우, '^'를 포함하여 패키지 인자를 구성합니다.
  final packageArgument =
      isValidVersion ? '$packageName:^$version' : packageName;

  // devPackage가 true일 경우 '--dev' 옵션을 추가합니다.
  final List<String> command = ['pub', 'add', packageArgument];
  if (devPackage == true) {
    command.add('--dev');
  }

  // 프로세스를 실행하여 패키지를 추가합니다.
  final result = await Process.run(
      Platform.isWindows ? 'flutter.bat' : 'flutter', command,
      workingDirectory: Directory.current.path);

  await Future.delayed(Duration(seconds: 1));

  // 실행 결과를 출력합니다.
  if (result.stderr.toString().isNotEmpty) {
    print('error: ${result.stderr}');
    return true;
  } else {
    final String devStr =
        (devPackage == true) ? 'dev_dependencies' : 'dependencies';

    if (version == null || version == "" || !version.contains('dev')) {
      await removePackageVersion(pubspecFile.path, packageName);
    }

    print("Installed $packageName in $devStr.");
  }

  // await runFlutterPubGet();

  // 존재하지 않던경우
  return false;
}
