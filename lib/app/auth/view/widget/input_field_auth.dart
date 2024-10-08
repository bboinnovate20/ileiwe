import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ileiwe/cores/extension.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class InputFieldAuth extends StatelessWidget {
  const InputFieldAuth({
    super.key,
    this.bottomMargin = 20,
    required this.label,
    required this.validator,
    this.isSecured = false,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.controller,
    this.fillColor,
    this.textColor,
    this.borderColor,
    this.otherSuffix,
    this.labelText = "",
    this.labelTextStyle,
    this.labelStyle,
    this.onChange,
    this.initialValue,
    this.textStyle,
    this.isPhoneField = false
  });

  final double bottomMargin;
  final String? Function(String?) validator;
  final String label;
  final bool isSecured;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? otherSuffix;
  final String labelText;
  final TextStyle? labelTextStyle;
  final TextStyle? labelStyle;
  final void Function(String)? onChange;
  final String? initialValue;
  final TextStyle? textStyle;
  final bool isPhoneField;

  @override
  Widget build(BuildContext context) {
    bool isHidden = true;

    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      // width: MediaQuery.of(context).size.width,
      child: isSecured ?  
      StatefulBuilder(
        builder: (context, setState) {
          return TextFormField(
            initialValue: initialValue,
            onChanged: onChange,
            controller: controller,
            obscureText: isHidden,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            validator: validator,
            keyboardType: keyboardType,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
               enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
              borderRadius: BorderRadius.circular(20)),

              hintText: hintText,
              
              label: Text(label, style: labelStyle ?? TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.w400),),
              filled: true,
              focusColor: Colors.white,
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w500, 
                              color: Colors.white),

              focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                          borderRadius: BorderRadius.circular(20)),

                suffixIconConstraints: const BoxConstraints(
                minWidth: 24,
                maxHeight: 24
              ),
              suffixIcon: otherSuffix ?? GestureDetector(
                onTap: () => setState(() {isHidden = !isHidden;}),
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: isHidden ? SvgPicture.asset(
                                alignment: Alignment.centerLeft,
                                "assets/icons/hide.svg",
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                semanticsLabel: 'Eye Close', width: 28,):
                  SvgPicture.asset(
                                alignment: Alignment.centerLeft,
                                "assets/icons/view.svg",
                                semanticsLabel: 'Eye Close', width: 28)              
                   
                                ,
                ),
              ),
              errorBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red), 
              borderRadius: BorderRadius.circular(20)) ,
              // errorText: "First Name is required",
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.red), 
              borderRadius: BorderRadius.circular(20)),
              
              errorStyle:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

              fillColor: fillColor ?? Colors.white,

            ),
            
          );
        }
      ):
      Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText.isNotEmpty ? Text(labelText, style: labelTextStyle ?? const TextStyle(color: Colors.white, fontSize: 18),).padding(bottom: 8, top:20) : 
                const SizedBox(),
          !isPhoneField ? TextFormField(
            onChanged: onChange,
            initialValue: initialValue,
            controller: controller,
            validator: validator,
            style: textStyle ?? const TextStyle(color: Colors.white),
            cursorColor: Colors.white,      
            decoration:  InputDecoration(
              
                focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.red), 
              borderRadius: BorderRadius.circular(20)),
              suffixIcon: otherSuffix,
              
              errorStyle:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                errorBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red), 
              borderRadius: BorderRadius.circular(20)) ,
            
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              labelStyle:  labelStyle ?? const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              hintText: hintText,
              label: Text(label),
              filled: true,
              
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              border: const OutlineInputBorder(
          
                borderSide: BorderSide(color: Colors.red, width: 40)),
             focusedBorder: OutlineInputBorder(  
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              fillColor: fillColor ?? Colors.white,
              
            ),
            
          ) : IntlPhoneField(
            pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
              dropdownTextStyle: const TextStyle(color: Colors.white),
              
              languageCode: "en",
              controller: controller,
              validator: (phone) => validator(phone?.completeNumber),
              style: textStyle ?? const TextStyle(color: Colors.white),
              decoration:  InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.red), 
              borderRadius: BorderRadius.circular(20)),
              suffixIcon: otherSuffix,
              
              errorStyle:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                errorBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red), 
              borderRadius: BorderRadius.circular(20)) ,
            
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              labelStyle:  labelStyle ?? const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              hintText: hintText,
              label: Text(label),
              filled: true,
              
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              border: const OutlineInputBorder(
          
                borderSide: BorderSide(color: Colors.red, width: 40)),
             focusedBorder: OutlineInputBorder(  
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              fillColor: fillColor ?? Colors.white,
              
            ),
            
              initialCountryCode: '+234',
              onChanged: (phone) {
                  if(onChange!= null){
                    return onChange!(phone.completeNumber);
                }
                  
                 },
            ),],
          ),);
      }
}


class InputFieldCustom extends InputFieldAuth {
  const InputFieldCustom({
    super.key,
    required super.label,
    required super.validator,
    super.controller,
    super.isSecured,
    super.hintText,
    super.keyboardType,
    super.fillColor,
    super.textColor,
    super.borderColor,
    super.otherSuffix,
    super.labelText,
    this.expands = false,
    required this.onChange
  }) ;

  final bool expands;
  @override
  final Function(String) onChange;

  @override
  Widget build(BuildContext context){
    return TextField(
      
      controller: null,
     keyboardType: TextInputType.multiline,
      maxLines: null,
        expands: expands,
      onChanged: onChange,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        // constraints: const BoxConstraints(minHeight: 200,),
        
                focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.red), 
              borderRadius: BorderRadius.circular(20)),
              
              errorStyle:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    
                errorBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red), 
              borderRadius: BorderRadius.circular(20)) ,
            
              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              labelStyle:  const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              hintText: hintText,
              label: Text(label),
              filled: true,
              
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              border: const OutlineInputBorder(
          
                borderSide: BorderSide(color: Colors.red, width: 40)),
             focusedBorder: OutlineInputBorder(  
                  borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
              fillColor: fillColor ?? Colors.white,
              
            ),
    
    );
    
    // TextFormField(
    //       controller: controller,
    //       validator: validator,
    //       style: const TextStyle(color: Colors.white),
    //       cursorColor: Colors.white,
          
    //       decoration:  InputDecoration(
    //           focusedErrorBorder: OutlineInputBorder(
    //           borderSide: BorderSide(color: borderColor ?? Colors.red), 
    //         borderRadius: BorderRadius.circular(20)),
            
    //         errorStyle:  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    
    //           errorBorder:OutlineInputBorder(
    //           borderSide: const BorderSide(color: Colors.red), 
    //         borderRadius: BorderRadius.circular(20)) ,
          
    //         contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    //         enabledBorder: OutlineInputBorder(
    //             borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
    //           borderRadius: BorderRadius.circular(20)),
    //         labelStyle:  const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
    //         hintText: hintText,
    //         label: Text(label),
    //         filled: true,
            
    //         floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
    //         border: const OutlineInputBorder(
        
    //           borderSide: BorderSide(color: Colors.red, width: 40)),
    //        focusedBorder: OutlineInputBorder(  
    //             borderSide: BorderSide(color: borderColor ?? Colors.transparent), 
    //           borderRadius: BorderRadius.circular(20)),
    //         fillColor: fillColor ?? Colors.white,
            
    //       ),
          
    //     );
  }

}