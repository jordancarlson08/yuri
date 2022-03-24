import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ThemeOfContext on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}
