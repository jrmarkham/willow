// Project imports:
import 'package:willow/src/globals.dart';

mixin FormValidationMixin {

  bool isFieldEmpty(String field) => field.isEmpty;

  bool isFieldChanged({required String currentVal, required String
  originalVal}) => currentVal == originalVal ? false : true;

  bool isFieldValid({required String currentVal, required FieldType type}){
    switch (type){
      case FieldType.title : return _validTitle(currentVal);
      case FieldType.subtitle: return _validSubTitle(currentVal);
      case FieldType.url : return _validURL(currentVal);
      case FieldType.body: return _validBody(currentVal);
      default: return true;
    }
  }

  bool _validTitle(String title) => getFieldMinLength(FieldType.title) < title.trim().length;

  bool _validSubTitle(String subtitle) => getFieldMinLength(FieldType.subtitle) < title.trim().length;

  bool _validBody(String body) => getFieldMinLength(FieldType.body) < body.trim().length;

  bool _validURL(String url) => getFieldMinLength(FieldType.url) < url.trim().length;

}
