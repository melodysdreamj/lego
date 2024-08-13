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
      color: Colors.pinkAccent.withOpacity(0.2),
      child: Text("Hello World!").center(),
    );
  }
}

void NewSnackBar(BuildContext context, int duration) async {
  final snackBar = SnackBar(
    content: NewView(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    // 고정된 스낵바 행동
    duration: Duration(seconds: duration),
    // margin 속성은 생략
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


var openWidget = (BuildContext context) async {
  NewSnackBar(context, 3);
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
            "SnackBar",
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
