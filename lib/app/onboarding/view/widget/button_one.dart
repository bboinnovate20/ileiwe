import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  const ButtonOne({
    super.key,
    this.action,
    required this.label,
    this.bgColor,
    this.textColor,
    this.border,
    this.extend,
    this.padding,
    this.fontSize,
    this.loading = false
  });

  final void Function()? action;
  final String label;
  final Color? bgColor;
  final Color? textColor;
  final Border? border;
  final bool? extend;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: extend == null ? padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 80) : const EdgeInsets.symmetric(vertical: 15, horizontal: 90) ,
        decoration: BoxDecoration(
          color: bgColor ?? const Color.fromARGB(255, 202, 12, 235),
          border: border ?? Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(50)
        ),
        child:  loading ? const CupertinoActivityIndicator(color: Colors.white) :
        Text(label, style: TextStyle(fontSize: fontSize ?? 18, color: textColor ?? Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }
}