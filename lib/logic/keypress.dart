import 'package:first_app/data/enums.dart';
import 'package:first_app/logic/compute.dart';

Map<String, String> keyPress(
  Map<String, Object> e,
  Map<String, String> operands,
  String activeSide,
  String currentOperator,
) {
  var toBeReturned = {
    "active": activeSide,
    "left": operands["left"],
    "right": operands["right"],
    "currentOperator": currentOperator,
  };
  if (e["type"] == ButtonType.number) {
    toBeReturned[activeSide] = operands[activeSide] + e["key"];
  } else if (e["type"] == ButtonType.executor) {
    switch (e["key"]) {
      case "<":
        if (operands[activeSide].isNotEmpty) {
          toBeReturned[activeSide] = operands[activeSide]
              .substring(0, operands[activeSide].length - 1);
        } else if (activeSide == "right") {
          toBeReturned["currentOperator"] = "";
          toBeReturned["active"] = "left";
        }
        break;
      case "AC":
        toBeReturned["right"] = "";
        toBeReturned["left"] = "";
        break;
      case "+/-":
        if (operands[activeSide].isEmpty) {
          toBeReturned[activeSide] = "";
        } else if (operands[activeSide][0] == "-") {
          toBeReturned[activeSide] = operands[activeSide].substring(1);
        } else {
          toBeReturned[activeSide] = "-" + operands[activeSide];
        }
        break;
      case "%":
        final nprimary = num.tryParse(operands[activeSide]);

        if (nprimary != null) {
          toBeReturned[activeSide] = (nprimary / 100).toString();
        } else {
          toBeReturned[activeSide] = operands[activeSide];
        }
        break;
      case "=":
        toBeReturned["left"] = compute(operands, currentOperator);
        toBeReturned["active"] = "left";
        toBeReturned["right"] = "";
        toBeReturned["currentOperator"] = "";
    }
  } else {
    toBeReturned["left"] = compute(operands, currentOperator);
    toBeReturned["right"] = "";
    toBeReturned["active"] = "right";
    toBeReturned["currentOperator"] = ' ${e["key"]} ';
  }
  return toBeReturned;
}
