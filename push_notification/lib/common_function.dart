import 'package:flutter/foundation.dart';

extension StringExtension on String {
  void get logIt {
    if (kDebugMode) {
      print(this);
    }
  }
}





