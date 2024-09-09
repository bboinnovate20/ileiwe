
import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
}

Widget errorWidget() {
  return const Align(
                            alignment: Alignment.center,
                            child: Text("Hopes! Unable to Load"));
}

