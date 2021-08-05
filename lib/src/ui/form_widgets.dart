// REUSABLE WIDGETS
// INPUT FORM

import 'package:flutter/material.dart';
import 'package:willow/src/data/model/form_field_element.dart';
import 'package:willow/src/globals.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController con;
  final int maxLen;
  final int maxLines;
  final String label;
  final String hintText;
  final String errorText;
  final Key? key;
  final TextInputType input;

  const InputTextField(
      {required this.con,
      required this.maxLen,
      required this.maxLines,
      required this.label,
      required this.hintText,
      required this.errorText,
      this.key,
      this.input = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: input,
      controller: con,
      maxLength: maxLen,
      maxLines: maxLines,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          errorText: errorText,
          hintStyle: bodyTextStyle(),
          labelStyle: labelTextStyle(),
          helperStyle: bodyTextStyle(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }

  TextStyle bodyTextStyle({Color color = Colors.blue}) =>
      TextStyle(fontSize: 12, color: color);

  TextStyle labelTextStyle({Color color = Colors.blue}) =>
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color);
}

class SetFormField extends StatelessWidget {
  final FormFieldElementObject fieldElementObject;
  final Key? key;

  const SetFormField(this.fieldElementObject, {this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _label = getFieldName(fieldElementObject.fieldType);
    final String _status = getStateText(fieldElementObject.fieldState, _label);
    final int _max = getFieldMaxLength(fieldElementObject.fieldType);
    final int _maxLines = getFieldMaxLines(fieldElementObject.fieldType);
    final bool _hint = fieldElementObject.fieldState == FieldState.empty;
    final bool _error = fieldElementObject.fieldState == FieldState.invalid &&
        fieldElementObject.requiredField;

    return InputTextField(
        con: fieldElementObject.dataElement,
        input: TextInputType.text,
        label: _label,
        maxLen: _max,
        hintText: _hint ? _status : '',
        errorText: _error ? _status : '',
        maxLines: _maxLines);
  }
}
