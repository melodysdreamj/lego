import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../../../../../../main.dart';
import '_/_.dart';

void NewBottomSheet(BuildContext context) async {
  await showBarModalBottomSheet(
      // barrierColor: Colors.black54,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => NewView().backgroundColor(Theme.of(context).colorScheme.background));
}
