import 'dart:io';

Future<void> replaceStringInFile(String filePath, String originalString, String replacementString) async {
  final File file = File(filePath);

  if (!await file.exists()) {
    print('The specified file does not exist.');
    return;
  }

  try {
    final fileContent = await file.readAsString();

    if (fileContent.contains(originalString)) {
      final modifiedContent = fileContent.replaceAll(originalString, replacementString);
      await file.writeAsString(modifiedContent);
      print('Replaced in $filePath');
    }
  } on FileSystemException catch (e) {
    print('Skipping $filePath, error reading file: ${e.message}');
  } catch (e) {
    print('An exception occurred for $filePath: ${e.toString()}');
  }
}
