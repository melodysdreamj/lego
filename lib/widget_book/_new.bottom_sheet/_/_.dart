import 'package:flutter/material.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("New View")),
    );
  }
}

main() async {
  return runApp(MaterialApp(
    home: NewView(),
  ));
}
