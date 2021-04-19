String compute(Map<String, String> operands, String currentOperator) {
  num left = num.tryParse(operands["left"]);
  num right = num.tryParse(operands["right"]);
  if (left == null && right == null) {
    return "";
  } else if (right == null) {
    return operands["left"];
  } else if (left == null) {
    return "0";
  }
  switch (currentOperator) {
    case "":
      return operands["left"];
      break;
    case " + ":
      return (left + right).toString();
      break;
    case " - ":
      return (left - right).toString();
      break;
    case " * ":
      return (left * right).toString();
      break;
    case " / ":
      return (left / right).toString();
      break;
    default:
      return "";
  }
}
