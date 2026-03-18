import 'package:flutter/services.dart';

class EinNoFirstZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.text.startsWith('0') ? oldValue : newValue;
  }
}
