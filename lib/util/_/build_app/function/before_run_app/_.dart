import 'package:flutter/material.dart';
import '../../../../../main.dart';


Future<void> readyBeforeRunApp() async {
  if (_done) return;
  _done = true;

}

bool _done = false;
