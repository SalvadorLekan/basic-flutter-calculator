import 'package:flutter/material.dart';

class ThemeController extends StatelessWidget {
  const ThemeController(
      {Key key, @required this.setLight, @required this.setDark})
      : super(key: key);
  final Function setDark;
  final Function setLight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: Icon(
            Icons.brightness_5_outlined,
            color: Colors.white,
          ),
          onPressed: setLight,
          style: TextButton.styleFrom(
            backgroundColor: Colors.black38,
          ),
        ),
        TextButton(
          child: Icon(
            Icons.bedtime_outlined,
            color: Colors.white,
          ),
          onPressed: setDark,
          style: TextButton.styleFrom(backgroundColor: Colors.black38),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
