extension ListPrint on List {
  String toCustomString() {
    String result = "[\n";
    for (var item in this) {
      result += item.toString() + "'\n";
    }
    result += "];\n";
    return result;
  }
}
