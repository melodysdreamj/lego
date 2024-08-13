import 'dart:io';
import 'package:path/path.dart' as path;


String? getPackagePath(String packageName, String packageVersion) {
  // 환경 변수에서 홈 디렉토리 경로 가져오기
  var homePath = Platform.isWindows
      ? Platform.environment['LOCALAPPDATA'] // 윈도우의 경우 LOCALAPPDATA 사용
      : Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']; // 맥/리눅스의 경우 HOME 또는 USERPROFILE 사용
  if (homePath == null) {
    print('Cannot find user home directory');
    return null;
  }

  // .pub-cache 경로 옵션 설정
  var pubCachePath = Platform.isWindows
      ? path.join(homePath, 'Pub', 'Cache', 'hosted') // 윈도우의 경우 Pub\Cache 경로 사용
      : path.join(homePath, '.pub-cache', 'hosted'); // 맥/리눅스의 경우 .pub-cache 사용
  var pubDevPath = path.join(pubCachePath, 'pub.dev');
  var pubDartlangOrgPath = path.join(pubCachePath, 'pub.dartlang.org');

  // 존재하는 .pub-cache 호스팅 경로 확인
  String? packageHostedPath;
  if (Directory(pubDevPath).existsSync()) {
    packageHostedPath = pubDevPath;
  } else if (Directory(pubDartlangOrgPath).existsSync()) {
    packageHostedPath = pubDartlangOrgPath;
  }

  if (packageHostedPath == null) {
    print('No valid .pub-cache hosted path found');
    return null;
  }

  // 패키지 경로 생성
  return path.join(packageHostedPath, '$packageName-$packageVersion');
}
