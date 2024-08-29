
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ileiwe/cores/extension.dart';

class CustomSelectionField extends StatefulWidget {
  const CustomSelectionField(
    {
      super.key,
      required this.onChangedValue,
      required this.label,
      this.options = const [],
      this.bottomMargin = 20,
      this.borderColor,
      this.fillColor,
      this.labelText =""
    });


  final void Function(int?) onChangedValue;
  final List<Map<String, dynamic>> options;
  final String label;
  final double bottomMargin;
  final Color? borderColor;
  final Color? fillColor;
  final String labelText;

  @override
  State<CustomSelectionField> createState() => _CustomSelectionFieldState();
}

class _CustomSelectionFieldState extends State<CustomSelectionField> {
  int selectedValue = -1;
  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem> convertOptions(List<Map<String, dynamic>>  options, selectedValue) {
      List<DropdownMenuItem> dropDownList = [];

      options.every((element) {
        dropDownList.add(DropdownMenuItem(value: element['id'], child: Text(element['name'], style: TextStyle(color: selectedValue == element['id'] ? Colors.white : Colors.black), )));
        return true;
      });

      return dropDownList;
    }


    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText.isNotEmpty ? Text(widget.labelText, style: const TextStyle(color: Colors.white, fontSize: 18),).padding(bottom: 8, top:20) : 
                const SizedBox(),
          Platform.isIOS ? CustomSelectionCupertinoFormField(title: widget.label, options: widget.options, onChangedValue: (value){widget.onChangedValue(value);}) : 
          
          DropdownButtonFormField(
            
            dropdownColor: Colors.white,
            iconEnabledColor: Colors.white,
            focusColor: Colors.white,
            // validator: (options) => options['id'].isEmpty ? 'Required States' : null,
            decoration:   InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // labelText: 'Select your State',
              label: Text(widget.label),
              labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                focusColor: Colors.white,
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red
                    )
                ),
               focusedBorder: OutlineInputBorder(  
                  borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent), 
                borderRadius: BorderRadius.circular(20)),
                border: const OutlineInputBorder(
                  // borderSide: BorderSide(
                  //     color: Colors.black45
                  //   )
                ),
                fillColor: Colors.white30,
               
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                   enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent), 
                  borderRadius: BorderRadius.circular(20)),
                
            ),
            items: convertOptions(widget.options, selectedValue), onChanged: (value) {
              widget.onChangedValue(value);
                setState(() => selectedValue = value);
              }),
        ],
      ),
    );
  }
}



class CustomSelectionCupertinoFormField extends FormField<Map<String, dynamic>> {
  CustomSelectionCupertinoFormField({super.key, required this.title, 
    required this.options, required this.onChangedValue}): super(
    initialValue: {'id': -1, 'name': ""},
    builder: (FormFieldState field) {
        return CustomSelectionCupertino(
              title: title, 
              state: field, options: options, 
              onChangedValue: onChangedValue);
    }
  );

  final String title;
  final List<Map<String, dynamic>> options;
  final void Function(int?) onChangedValue;
  

}


class CustomSelectionCupertino extends StatelessWidget {
   
  
  const CustomSelectionCupertino({super.key, 
  required this.title, required this.options, required this.state, required this.onChangedValue});

  final String title;
  final List<Map<String, dynamic>> options;
  final void Function(int?) onChangedValue;
  final FormFieldState state;

  @override
  Widget build(BuildContext context) {
    return 
    
    InkWell(
      onTap: () async  {
          final value = await _showActionSheet(context);
          state.didChange(value);
          onChangedValue(state.value['id']);
      }
      ,
      child: Container(
        padding: const EdgeInsets.all(20),
        
        decoration:   BoxDecoration(
            // labelText: 'Select your State',
            color: Colors.white30,
              borderRadius: BorderRadius.circular(20),
             
              
          ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(state.value['id'] < 0 ? title : state.value['name'], 
            style: const TextStyle(color: Colors.white, fontSize: 16),),
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _showActionSheet(BuildContext context) async {
    return await showCupertinoModalPopup(context: context, builder: (BuildContext context) => 
        CupertinoActionSheet(
          title:  Text(title),
          actions: options.map((option) =>  CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(option)
              , 
            child: Text(option['name']))).toList(),
        )
    );

}
}