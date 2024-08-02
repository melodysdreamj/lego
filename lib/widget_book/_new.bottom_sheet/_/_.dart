import 'package:flutter/material.dart';
import 'package:june_flow_util/june_flow_util.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:styled_widget/styled_widget.dart';

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


void NewBottomSheet(BuildContext context) async {
  await showBarModalBottomSheet(
    // barrierColor: Colors.black54,
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          NewView().backgroundColor(Theme.of(context).colorScheme.surface));
}

var openWidget = (BuildContext context) async {
  NewBottomSheet(context);
};

class Usage extends StatefulWidget {
  const Usage({super.key});

  @override
  State<Usage> createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Bottom Sheet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          basicButton(context, "open", () {
            openWidget(context);
          }),
        ],
      ),
    );
  }
}

main() async {
  return runApp(MaterialApp(
    home: Usage(),
  ));
}
