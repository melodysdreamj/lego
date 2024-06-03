import 'package:flutter/material.dart';

import '../../../../../../main.dart';

@ReadyBeforeRunApp(index: 0.9)
Future<void> readyForWidgetBindingLego() async {
  WidgetsFlutterBinding.ensureInitialized();
}
