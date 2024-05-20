import 'package:flutter/material.dart';

import 'util/config/global_imports.dart';
export 'util/config/global_imports.dart';

main() {
  return buildApp();
}

class InitView extends StatelessWidget {
  const InitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "New App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          // basicButton(context, "New Button", () {}),
        ],
      ),
    );
  }
}
