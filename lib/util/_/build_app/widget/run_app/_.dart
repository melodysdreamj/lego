import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../function/before_run_app/_.dart';
import '../my_app/_.dart';
import 'screenutil_lego/_.dart';

Future<void> buildApp({Widget? home}) async {
  if (home != null) MyAppHome = home;
  await readyBeforeRunApp();
  Widget childWidget = MyApp();
  childWidget = coverScreenutilLego(childWidget);

  return runApp(childWidget);
}


