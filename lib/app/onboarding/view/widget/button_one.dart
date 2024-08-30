import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  const 
  ButtonOne({
    super.key,
    this.action,
    required this.label,
    this.bgColor,
    this.textColor,
    this.border,
    this.extend,
    this.padding,
    this.fontSize,
    this.loading = false,
    this.width,
    this.paddingGeo,
    this.height,
    this.radius,
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
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? paddingGeo;
  final BorderRadius? radius;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? () => {} : action,
      child: Container(
        width: width,
        height: height,
      
        padding: paddingGeo ?? (extend == null ? padding ?? const EdgeInsets.symmetric(vertical:15) : const EdgeInsets.symmetric(vertical: 15, horizontal: 90) ),
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).colorScheme.primary,
          border: border ?? Border.all(width: 1, color: Colors.white),
          borderRadius: radius ?? BorderRadius.circular(50)
        ),
        child:  loading == true ? const CupertinoActivityIndicator(color: Colors.white) :
        Text(label, style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: fontSize ?? 18, 
              color: textColor ?? Colors.white),
              textAlign: TextAlign.center,
              ),
      ),
    );
  }
}


class ButtonTwo extends StatelessWidget {
  const 
  ButtonTwo({
    super.key,
    this.action,
    required this.label,
    this.bgColor,
    this.textColor,
    this.border,
    this.extend,
    this.padding,
    this.fontSize,
    this.loading = false,
    this.width,
    this.paddingGeo,
    this.height,
    this.radius,
    this.style
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
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? paddingGeo;
  final BorderRadius? radius;
  final TextStyle? style;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? () => {} : action,
      child: Container(
        width: width,
        height: height,
      
        padding: paddingGeo ?? (extend == null ? padding ?? const EdgeInsets.all(5) : const EdgeInsets.symmetric(vertical: 15, horizontal: 90) ),
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).colorScheme.primary,
          border: border ?? Border.all(width: 1, color: Colors.white),
          borderRadius: radius ?? BorderRadius.circular(50)
        ),
        child:  loading == true ? const CupertinoActivityIndicator(color: Colors.white) :
        Text(label, style: style ?? TextStyle(
              color: textColor ?? Colors.white),
              textAlign: TextAlign.center,
              ),
      ),
    );
  }
}