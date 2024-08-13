library lego_cli;

import 'package:args/args.dart';

import 'commander/add/function.dart';
import 'commander/build_order/function.dart';
// import 'commander/build_view/function.dart';
// import 'commander/build_view/function/spinner/function.dart';
import 'commander/create/function.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    )

    ..addFlag(
      'create',
      negatable: false,
      help: 'Create a new app.',
    )

    ..addFlag(
      'build',
      negatable: false,
      help: 'initialize the project.',
    )


    ..addOption(
      'add',
      help: 'Add a module to the project.',
      valueHelp: 'moduleName',
    );
}

void printUsage(ArgParser argParser) {
  print('Usage: dart lego_cli.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) async {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);
    bool verbose = false;

    // Process the parsed arguments.
    if (results.wasParsed('help')) {
      printUsage(argParser);
      return;
    }
    if (results.wasParsed('version')) {
      print('lego_cli version: $version');
      return;
    }
    if (results.wasParsed('verbose')) {
      verbose = true;
    }

    // 테스트 플래그를 처리합니다.
    if (results.wasParsed('create')) {
      print('create');
      return;
    }

    // 위치 인자를 기반으로 명령어 처리
    if (results.rest.isNotEmpty) {
      switch (results.rest.first) {
        case 'create':
          print('App creation process initiated.');
          await createApp();
          // 여기에 앱 생성 로직 추가
          break;
        case 'build':
        // print('Project initialization process initiated.');
          await buildApp();
          print('Project initialization process completed.');
          break;
        // case 'build-view':
        // // print('Project initialization process initiated.');
        //   await buildView();
        //   // print('JuneView Building started.');
        //   // var spinner = Spinner();
        //   // spinner.start();
        //   print('View initialization process completed.');
        //   break;
        // case 'view':
        //   await buildView();
        //   print('View initialization process completed.');
        case 'add':
          if (results.rest.length > 1) {
            // 'add' 명령어와 함께 패키지명 처리
            String moduleName = results.rest[1];
            // print("start add module: $moduleName");
            await addModule(moduleName);
            print("finish add process");
          } else {
            print('Package name is missing.');
          }
          break;
        default:
          print('Unknown command: ${results.rest.first}');
          printUsage(argParser);
      }
      return;
    }

    // 명령어가 제공되지 않았을 경우
    print('No command provided.');
    printUsage(argParser);
    if (verbose) {
      print('[VERBOSE] All arguments: ${results.arguments}');
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}
