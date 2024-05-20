import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'material_app.dart';

Widget currentMaterialApp = MaterialApp(
  localizationsDelegates: MaterialAppParams.localizationsDelegates,
  supportedLocales: MaterialAppParams.supportedLocales ?? const <Locale>[Locale('en', 'US')],
  locale: MaterialAppParams.locale,
  title: MaterialAppParams.appName ?? 'June',
  theme: MaterialAppParams.lightTheme,
  darkTheme: MaterialAppParams.darkTheme,
  themeMode: MaterialAppParams.themeMode ?? ThemeMode.system,
  debugShowCheckedModeBanner: false,
  builder: (context, child) {
    return child!;
  },
  navigatorObservers: MaterialAppParams.navigatorObservers ?? [],
  home: MyAppHome ?? InitView(),
);
