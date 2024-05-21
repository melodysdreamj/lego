import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';
import '_/_.dart';

void NewNotification(BuildContext context) async {
  bool enableSlideOff = true;
  bool onlyOne = true;
  bool crossPage = true;
  int seconds = 10;
  int animationMilliseconds = 200;
  int animationReverseMilliseconds = 200;
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

  BotToast.showCustomNotification(
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration: Duration(milliseconds: animationReverseMilliseconds),
      duration: Duration(seconds: seconds),
      backButtonBehavior: backButtonBehavior,
      toastBuilder: (cancel) {
        return NewView();
      },
      enableSlideOff: enableSlideOff,
      onlyOne: onlyOne,
      crossPage: crossPage);
}
