import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:willow/src/globals.dart';

class FormFieldElementObject extends Equatable {
  final int index;
  final FieldType fieldType;
  final FieldState fieldState;
  final bool requiredField;
  final bool requiredUpdate;
  final dynamic startingValue;
  final dynamic dataElement;

  FormFieldElementObject(
      {required this.index,
      required this.fieldType,
      required this.fieldState,
      required this.requiredField,
      required this.requiredUpdate,
      required this.startingValue,
      required this.dataElement});

  FormFieldElementObject copyWith({FieldState? fieldState}) =>
      FormFieldElementObject(
        index: this.index,
        fieldType: this.fieldType,
        fieldState: fieldState ?? this.fieldState,
        requiredField: this.requiredField,
        requiredUpdate: this.requiredUpdate,
        startingValue: this.startingValue,
        dataElement: this.dataElement,
      );

  @override
  List<Object> get props => [
        index,
        fieldType,
        fieldState,
        requiredField,
        requiredUpdate,
        startingValue,
        dataElement
      ];
}

FormFieldElementObject titleFFEO(int idx,
        {bool reqField = true, String startVal = ''}) =>
    FormFieldElementObject(
        index: idx,
        fieldType: FieldType.title,
        fieldState:
            startVal.isEmpty == true ? FieldState.empty : FieldState.valid,
        requiredField: reqField,
        requiredUpdate: false,
        startingValue: startVal,
        dataElement: TextEditingController());

FormFieldElementObject subTitleFFEO(int idx,
        {bool reqField = true, String startVal = ''}) =>
    FormFieldElementObject(
        index: idx,
        fieldType: FieldType.subtitle,
        fieldState:
            startVal.isEmpty == true ? FieldState.empty : FieldState.valid,
        requiredField: reqField,
        requiredUpdate: false,
        startingValue: startVal,
        dataElement: TextEditingController());

FormFieldElementObject urlFFEO(int idx,
        {bool reqField = true, String startVal = ''}) =>
    FormFieldElementObject(
        index: idx,
        fieldType: FieldType.url,
        fieldState:
            startVal.isEmpty == true ? FieldState.empty : FieldState.valid,
        requiredField: reqField,
        requiredUpdate: false,
        startingValue: startVal,
        dataElement: TextEditingController());

FormFieldElementObject bodyFFEO(int idx,
        {bool reqField = true, String startVal = ''}) =>
    FormFieldElementObject(
        index: idx,
        fieldType: FieldType.body,
        fieldState:
            startVal.isEmpty == true ? FieldState.empty : FieldState.valid,
        requiredField: reqField,
        requiredUpdate: false,
        startingValue: startVal,
        dataElement: TextEditingController());
