import 'package:first_app/widgets/calcdisplay.dart';
import 'package:first_app/widgets/theme_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/calc_buttons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
    @required this.dark,
    @required this.operands,
    @required this.currentOperator,
    @required this.buttons,
    @required this.setLight,
    @required this.setDark,
  }) : super(key: key);

  final bool dark;
  final Map<String, String> operands;
  final String currentOperator;
  final buttons;
  final Function setDark;
  final Function setLight;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salva Calculator',
        theme: dark ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                ThemeController(setDark: setDark, setLight: setLight),
                Display(operands: operands, currentOperator: currentOperator),
                CalcButtons(buttons: buttons)
              ],
            ),
          ),
        ));
  }
}
