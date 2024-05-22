import '../build_app.material_app/function.dart';
import '../build_app.my_app/function.dart';
import '../build_app.run_app/function.dart';
import '../ready_function.after_material_app/function.dart';
import '../ready_function.before_material_app/function.dart';
import '../ready_function.before_run_app/function.dart';
import '../ready_listener/function.dart';

Future<void> buildAppWithJuneFlowStyle() async {
  await findFunctionsAndGenerateFileMaterialApp();
  await findFunctionsAndGenerateFileBuildMyApp();
  await findFunctionsAndGenerateFileBuildRunApp();

  // await findFunctionsAndGenerateFileAfterMaterialApp();
  await findFunctionsAndGenerateFileBeforeMaterialApp();
  await findFunctionsAndGenerateFileBeforeRunApp();

  await findFunctionsAndGenerateFileReadyListener();
}