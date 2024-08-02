import 'package:flutter/material.dart';
import 'package:june_flow_util/june_flow_util.dart';
import 'package:styled_widget/styled_widget.dart';

class NewView extends StatefulWidget {
  const NewView({super.key});

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blueAccent,
      child: Text("Hello World!").center(),
    );
  }
}

void NewDialog(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: true,
      // dialog is dismissible with a tap on the barrier
      barrierColor: Colors.black.withOpacity(0.4),
      // screen color outside the dialog
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white, // dialog background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: NewView(),
        );
      });
}

var openWidget = (BuildContext context) async {
  NewDialog(context);
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
            "Dialog",
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

