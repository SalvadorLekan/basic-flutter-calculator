import 'package:first_app/screens/main.dart';
import 'package:flutter/material.dart';
import 'data/keys.dart';
import 'logic/keypress.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var buttons;
  String currentOperator = "";
  var operands = {"left": "", "right": ""};
  String activeSide = "left";
  bool dark = false;

  void setDark() {
    setState(() {
      dark = true;
    });
  }

  void setLight() {
    setState(() {
      dark = false;
    });
  }

  @override
  void initState() {
    super.initState();
    buttons = keys.map(
      (e) => TextButton(
        onPressed: () {
          if (e["key"] == "." && operands[activeSide].contains(".")) {
            return;
          }
          var newdata = keyPress(e, operands, activeSide, currentOperator);
          setState(() {
            operands["left"] = newdata["left"];
            operands["right"] = newdata["right"];
            activeSide = newdata["active"];
            currentOperator = newdata["currentOperator"];
          });
        },
        child: Text(
          e["key"],
          style: TextStyle(color: e["color"], fontSize: 20),
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.black87),
      ),
    );
  }

  @override
  build(context) {
    return MainScreen(
      dark: dark,
      operands: operands,
      currentOperator: currentOperator,
      buttons: buttons,
      setDark: setDark,
      setLight: setLight,
    );
  }
}
