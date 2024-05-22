import 'package:flutter/material.dart';
import '../../../../../main.dart';

import '../../../shared_params/_/material_app.dart';
import 'bot_toast_lego/_.dart';

Widget materialAppInsideBuilder(BuildContext context, Widget? child) {
  child = coverBotToastLego(context, child!);

  return child!;
}

Widget Function() MaterialAppBuilder(BuildContext context) {
  return () =>
      currentMaterialApp ??
      MaterialApp(
        localizationsDelegates: MaterialAppParams.localizationsDelegates,
        supportedLocales: MaterialAppParams.supportedLocales ?? const <Locale>[Locale('en', 'US')],
        locale: MaterialAppParams.locale,
        title: MaterialAppParams.appName,
        theme: MaterialAppParams.lightTheme,
        darkTheme: MaterialAppParams.darkTheme,
        themeMode: MaterialAppParams.themeMode ?? ThemeMode.system,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return materialAppInsideBuilder(context, child);
        },
        navigatorObservers: MaterialAppParams.navigatorObservers ?? [],
        home: MyAppHome ?? InitView(),
      );
}
