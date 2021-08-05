import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:willow/src/core_app.dart';
import 'package:willow/src/data/blocs/page/page_data_bloc.dart';
import 'package:willow/src/globals.dart';

Future<void> main() async {
  // load content app data from json data [file]
  WidgetsFlutterBinding.ensureInitialized();
  Globals.initGlobal().then((_) async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        if (kReleaseMode) exit(1);
      };

      runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          // Set up the bloc providers here so the can be referenced from any
          // ui element / screen w/ a call to a provider //
          home: MultiBlocProvider(providers: [
            BlocProvider<PageDataBloc>(
                create: (BuildContext context) => PageDataBloc()),
          ], child: CoreApp())));
    });
  });
}
