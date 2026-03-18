extension EinStringExtension on String? {
  bool isValidEmailAddress({bool strictValidation = false}) {
    if ((this ?? '').isEmpty) return false;
    final source = strictValidation
        ? r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
        : r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    return RegExp(source).hasMatch(this ?? '');
  }
}
