extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String ternaryOperationWithOneParam(String value) {
    if (length > 0) {
      return value;
    } else {
      return "";
    }
  }
}
