

import 'package:flutter/material.dart';

extension PaddingAdd on Widget {
  Widget padding({double? top, double? bottom, double? left, double? right}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: this,
    );
  }
}