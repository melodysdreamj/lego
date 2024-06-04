import 'package:flutter/material.dart';

import '../../../../../../../../../../../main.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
    );
  }
}

main() async {
  return buildApp(home: Scaffold(body: NewView().center()));
}
