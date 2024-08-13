import '../../../../singleton/build_info/model.dart';
import 'function.dart';

void main() async {
  await getJuneFlowPackagesInProject();
  print(BuildInfo.instance.ModuleList);
}
