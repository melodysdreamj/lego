import 'function.dart';

void main() {
  const exportPath = 'new/package/path.dart';

  addExportIfNotExists(exportPath).then((_) => print('Done'));
}
