import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:willow/src/data/blocs/form/form_bloc.dart';
import 'package:willow/src/data/model/form_field_element.dart';
import 'package:willow/src/data/model/page_model.dart';
import 'package:willow/src/ui/form_widgets.dart';

Future<Object?> fullScreenDialog(BuildContext context, Function submit) async {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.white,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: AutoSizeText('Add Page'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [DynamicPageForm(submit)]),
        );
      });
}

class DynamicPageForm extends StatelessWidget {
  final Function submit;

  const DynamicPageForm(this.submit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormBlocState>(
        bloc: FormBloc()..initBloc(_formFieldElementObjects()),
        builder: (BuildContext context, FormBlocState state) {
          debugPrint('State ${state.toString()}');

          return state.formElements.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.formElements.length,
                            itemBuilder: (BuildContext context, int idx) {
                              final FormFieldElementObject _formElementObject =
                                  state.formElements[idx];
                              return SetFormField(_formElementObject);
                            }),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          child: Text(
                            'submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: state.allVerified
                              ? () => submitCall(context,
                                  submit: submit,
                                  formElements: state.formElements)
                              : null,
                        )
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  void submitCall(BuildContext context,
      {required Function submit,
      required List<FormFieldElementObject> formElements}) {
    submit(_modelFromForm(formElements));
    Navigator.pop(context);
  }

  // Eventual move this to state return from form bloc //
  PageModel _modelFromForm(List<FormFieldElementObject> formElements) =>
      PageModel(
          title: formElements[0].dataElement.text,
          subtitle: formElements[1].dataElement.text,
          body: formElements[2].dataElement.text,
          url: formElements[3].dataElement.text);

  List<FormFieldElementObject> _formFieldElementObjects() {
    final List<FormFieldElementObject> list = [];
    list.add(titleFFEO(list.length, startVal: 'Page', reqField: true));
    list.add(subTitleFFEO(list.length, startVal: 'Sub Title', reqField: true));
    list.add(
        bodyFFEO(list.length, startVal: 'Lorem Time . . . ', reqField: true));
    list.add(urlFFEO(list.length, reqField: true));
    return list;
  }
}
