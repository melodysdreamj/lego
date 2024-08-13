import 'dart:io';

Future<void> replaceStringInFiles(String directoryPath, String originalString, String replacementString) async {
  final Directory directory = Directory(directoryPath);

  if (!await directory.exists()) {
    print('The specified directory does not exist.');
    return;
  }

  await for (final FileSystemEntity entity in directory.list(recursive: true)) {
    if (entity is File) {
      try {
        final fileContent = await entity.readAsString();

        if (fileContent.contains(originalString)) {
          final modifiedContent = fileContent.replaceAll(originalString, replacementString);
          await entity.writeAsString(modifiedContent);
          // print('Replaced in ${entity.path}');
        }
      } on FileSystemException catch (e) {
        // print('Skipping ${entity.path}, error reading file: ${e.message}');
      } on Exception catch (e) {
        print('An exception occurred for ${entity.path}: ${e.toString()}');
      }
    }
  }
}
