import 'package:flutter/material.dart';

class FlutterFormBuilder extends StatelessWidget {
  const FlutterFormBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, left: 12, right: 13),
      child: Column(
        children: [
          Center(
            child: Text("FormBuilder"),
          )
        ],
      ),
    );
  }
}