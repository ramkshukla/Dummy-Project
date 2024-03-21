import 'package:flutter/foundation.dart';

extension StringExtention on String {
   
  void get logIt {
    if (kDebugMode) {
      print(this);
    }
  }
}
