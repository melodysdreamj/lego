import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:path/path.dart' as path;


class _AnnotatedFunctionInfo {
  final String filePath;
  final String functionName;
  final double? index;

  _AnnotatedFunctionInfo({required this.filePath, required this.functionName, this.index});
}

Future<void> findFunctionsAndGenerateFileBuildMyApp() async {
  String searchDirectory = path.join('lib', 'util', '_', 'build_app', 'widget', 'my_app');
  String targetFilePath = path.join(searchDirectory, '_.dart');
  final List<_AnnotatedFunctionInfo> coverFunctions = await _findCoverMyAppFunctions(searchDirectory);
  await _generateAndWriteBuildMyApp(coverFunctions, targetFilePath);
}

Future<List<_AnnotatedFunctionInfo>> _findCoverMyAppFunctions(String searchDirectory) async {
  final List<_AnnotatedFunctionInfo> functions = [];
  final directory = Directory(searchDirectory);
  await for (final file in directory.list(recursive: true, followLinks: false)) {
    if (file is File && file.path.endsWith('.dart')) {
      final content = await file.readAsString();
      final RegExp exp = RegExp(
          r'@CoverMyApp\((?:index:\s*(\d+(?:\.\d+)?)\s*)?\)\s*Widget Function\(\)\s*(\w+)\s*\(\s*Widget Function\(\)\s*materialAppBuilder\s*\)',
          multiLine: true
      );
      final matches = exp.allMatches(content);
      for (final match in matches) {
        final double? index = match.group(1) != null ? double.tryParse(match.group(1)!) : null;
        final String functionName = match.group(2)!;
        functions.add(_AnnotatedFunctionInfo(filePath: file.path, functionName: functionName, index: index));
      }
    }
  }
  return functions;
}

Future<void> _generateAndWriteBuildMyApp(List<_AnnotatedFunctionInfo> coverFunctions, String targetFilePath) async {
  final StringBuffer coverFunctionCalls = StringBuffer();
  final Set<String> imports = Set();

  coverFunctions.sort((a, b) => (a.index ?? double.infinity).compareTo(b.index ?? double.infinity));

  for (final functionInfo in coverFunctions) {
    final relativeFilePath = p.relative(functionInfo.filePath, from: p.dirname(targetFilePath));
    final importPath = relativeFilePath.replaceAll('\\', '/');
    imports.add("import '$importPath';");
    coverFunctionCalls.writeln('  materialAppBuilder = ${functionInfo.functionName}(materialAppBuilder);');
  }

  final String importStatements = imports.join('\n');

  final String buildMyAppFunction = '''
import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../function/before_material_app/_.dart';
import '../material_app/_.dart';
$importStatements

Widget Function() buildMyApp(BuildContext context) {
  Widget Function() materialAppBuilder = MaterialAppBuilder(context);
${coverFunctionCalls.toString()}

  return () => materialAppBuilder();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    readyBeforeMaterialApp(context);

    return buildMyApp(context)();
  }
}


''';

  final File targetFile = File(targetFilePath);
  await targetFile.writeAsString(buildMyAppFunction);
  // print('buildMyApp util updated successfully with cover functions and imports.');
}

Future<void> main() async {
  await findFunctionsAndGenerateFileBuildMyApp();
}
