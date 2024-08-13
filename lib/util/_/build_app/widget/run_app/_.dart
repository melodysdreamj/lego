import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../function/before_run_app/_.dart';
import '../my_app/_.dart';

Future<void> buildApp({Widget? home}) async {
  MyAppHome = home;
  await readyBeforeRunApp();
  Widget childWidget = MyApp();

  return runApp(childWidget);
}
