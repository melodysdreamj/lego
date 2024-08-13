import 'dart:io';

import 'package:yaml/yaml.dart';

// 패키지를 입력받아 flutter pub remove 명령을 실행하는 함수
import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

// 패키지를 입력받아 flutter pub remove 명령을 실행하는 함수
Future<void> removeFlutterPackage(String packageName) async {
  // print("removeFlutterPackage 함수 실행 중...");
  // pubspec.yaml 파일 읽기
  final File pubspecFile = File(path.join(Directory.current.path, 'pubspec.yaml'));
  final pubspecContent = await pubspecFile.readAsString();

  // pubspec.yaml 내용 파싱
  final pubspecYaml = loadYaml(pubspecContent);

  // dependencies 및 dev_dependencies에서 패키지가 있는지 확인
  bool hasDependency = _checkDependencies(pubspecYaml['dependencies'], packageName);
  bool hasDevDependency = _checkDevDependencies(pubspecYaml['dev_dependencies'], packageName);

  if (hasDependency || hasDevDependency) {
    // print("Removing $packageName...");
    // 패키지가 존재하면 제거 명령 실행
    final result = await Process.run(Platform.isWindows ? 'flutter.bat' : 'flutter', ['pub', 'remove', packageName],
        workingDirectory: Directory.current.path); // 현재 작업 중인 디렉토리를 사용합니다.

    // 실행 결과 출력(필요에 따라)
    // print('Exit code: ${result.exitCode}');
    // print('Stdout: ${result.stdout}');
    // print('Stderr: ${result.stderr}');

    // print("removed $packageName");
  } else {
    // print("Package '$packageName' not found in pubspec.yaml");
  }
}

// dependencies 내의 모든 항목을 확인하여 패키지 존재 여부를 반환하는 함수
bool _checkDependencies(YamlMap? dependencies, String packageName) {
  if (dependencies == null) return false;
  for (var key in dependencies.keys) {
    if (key == packageName) {
      return true;
    }
    var value = dependencies[key];
    // Map 내의 더 깊은 항목을 검사해야 하는 경우
    if (value is YamlMap && _checkDependencies(value, packageName)) {
      return true;
    }
  }
  return false;
}

// dev_dependencies 내의 모든 항목을 확인하여 패키지 존재 여부를 반환하는 함수
bool _checkDevDependencies(YamlMap? devDependencies, String packageName) {
  if (devDependencies == null) return false;
  for (var key in devDependencies.keys) {
    if (key == packageName) {
      return true;
    }
    var value = devDependencies[key];
    // Map 내의 더 깊은 항목을 검사해야 하는 경우
    if (value is YamlMap && _checkDevDependencies(value, packageName)) {
      return true;
    }
  }
  return false;
}
