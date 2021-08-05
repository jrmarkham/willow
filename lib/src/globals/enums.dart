// FORMS
enum FieldState { empty, invalid, unchanged, valid }
enum FieldType { title, subtitle, body, url }


// FORM FIELDS
// ENUM FUNCTIONS
String getFieldName(FieldType type){
  switch(type){
    case FieldType.title: return 'Title';
    case FieldType.url: return 'Image URL';
    case FieldType.subtitle: return 'Sub Title';
    case FieldType.body: return 'Body';
    default: return 'Field Name';
  }
}

int getFieldMaxLength(FieldType type){
  switch(type){
    case FieldType.url: return 100;
    case FieldType.subtitle: return 25;
    case FieldType.body: return 250;
    case FieldType.title: default:  return 25;
  }
}


int getFieldMinLength(FieldType type){
  switch(type){

    case FieldType.url: return 15;
    case FieldType.subtitle: return 3;
    case FieldType.body: return 10;
    case FieldType.title: default:  return 3;
  }
}

int getFieldMaxLines(FieldType type){
  switch(type){
    case FieldType.body: return 5;
    default: return 1;
  }
}

String getStateText(FieldState fieldState, String label) {
// TODO localization
  switch(fieldState){
    case FieldState.invalid: return 'Invalid $label';
    case FieldState.empty: return 'Enter $label';
    case FieldState.valid:default: return '$label valid';
  }
}