import 'dart:io';

Future<void> removeFile(String filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    // print('File does not exist: $filePath');
    return;
  }

  await file.delete();

  // print('File removed: $filePath');

}