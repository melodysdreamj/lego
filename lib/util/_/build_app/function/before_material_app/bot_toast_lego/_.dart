import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../main.dart';
import '../../../../shared_params/_/material_app.dart';
import '../../../../shared_params/bot_toast_lego/_.dart';

@ReadyBeforeMaterialApp()
Future<void> readyForBotToastLego(BuildContext context) async {
  botToastBuilder = BotToastInit();
  MaterialAppParams.navigatorObservers = [BotToastNavigatorObserver()];
}
