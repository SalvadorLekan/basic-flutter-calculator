import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({
    Key key,
    @required this.operands,
    @required this.currentOperator,
  }) : super(key: key);

  final Map<String, String> operands;
  final String currentOperator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 89, bottom: 16, right: 18, left: 16),
      child: SingleChildScrollView(
        child: Text(
          operands["left"] + currentOperator + operands["right"],
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        scrollDirection: Axis.horizontal,
        reverse: true,
      ),
    );
  }
}
