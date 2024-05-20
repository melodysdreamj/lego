import 'package:flutter/material.dart';
import '../../../../../main.dart';

import '../../../shared_params/_/material_app_obj.dart';


Widget materialAppInsideBuilder(BuildContext context, Widget? child) {

  return child!;
}

Widget Function() MaterialAppBuilder(BuildContext context) {
  return () => currentMaterialApp;
}

