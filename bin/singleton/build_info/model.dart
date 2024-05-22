

import '../../entity/model/module/model.dart';

class BuildInfo {
  static final BuildInfo instance = BuildInfo._();
  BuildInfo._();

  List<Module> ModuleList = [];
}