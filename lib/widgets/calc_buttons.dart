import 'package:flutter/material.dart';

class CalcButtons extends StatelessWidget {
  const CalcButtons({
    Key key,
    @required this.buttons,
  }) : super(key: key);

  final buttons;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(12),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: buttons.toList(),
      shrinkWrap: true,
    );
  }
}
