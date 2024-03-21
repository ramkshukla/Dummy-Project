import 'dart:developer';

import 'package:flutter/foundation.dart';

extension StringExtension on String {
  void get logIt {
    if (kDebugMode) {
      log("LOG.IT ===> $this");
    }
  }
}
