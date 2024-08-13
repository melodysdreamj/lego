import 'function.dart';

void main() async {
  String projectDirectoryPath = 'path_to_your_project_directory';
  List<String> files = await findFilesWithJuneViewAnnotations(projectDirectoryPath);

  // 결과 출력
  print('Files containing @JuneViewAction() or @JuneViewEvent():');
  files.forEach(print);
}