import 'package:flutter/material.dart';
import '../../../../../main.dart';
import '../../function/before_material_app/_.dart';
import '../material_app/_.dart';


Widget Function() buildMyApp(BuildContext context) {
  Widget Function() materialAppBuilder = MaterialAppBuilder(context);


  return () => materialAppBuilder();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    readyBeforeMaterialApp(context);

    return buildMyApp(context)();
  }
}


