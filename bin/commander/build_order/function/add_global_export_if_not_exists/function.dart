import 'dart:io';
import 'package:path/path.dart' as path;

Future<void> addExportIfNotExists(String exportPath) async {
  String currentPath = Directory.current.path;
  String filePath = path.join(currentPath, 'lib', 'main.dart');
  final file = File(filePath);

  if (!await file.exists()) {
    print('File does not exist: $filePath');
    return;
  }

  String content = await file.readAsString();

  if (!content.contains(exportPath)) {
    String newContent = "$exportPath\n$content";
    await file.writeAsString(newContent);
  }
}

