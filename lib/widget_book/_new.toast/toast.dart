import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../../main.dart';
import '_/_.dart';

void NewToast(
  BuildContext context, {
  int seconds = 2,
  bool crossPage = true,
  bool clickClose = false,
  bool ignoreContentClick = false,
  bool onlyOne = true,
  int backgroundColor = 0x00000000,
  int animationMilliseconds = 200,
  int animationReverseMilliseconds = 200,
  BackButtonBehavior backButtonBehavior = BackButtonBehavior.none,
}) {
  BotToast.showCustomText(
    duration: Duration(seconds: seconds),
    onlyOne: onlyOne,
    clickClose: clickClose,
    crossPage: crossPage,
    ignoreContentClick: ignoreContentClick,
    backgroundColor: Color(backgroundColor),
    backButtonBehavior: backButtonBehavior,
    animationDuration: Duration(milliseconds: animationMilliseconds),
    animationReverseDuration: Duration(milliseconds: animationReverseMilliseconds),
    toastBuilder: (_) => Align(
      alignment: const Alignment(0, 0.8),
      child: NewView(),
    ),
  );
}
