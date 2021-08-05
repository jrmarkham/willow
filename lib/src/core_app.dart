import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:willow/src/data/blocs/page/page_data_bloc.dart';
import 'package:willow/src/data/model/page_model.dart';
import 'package:willow/src/ui/add_page.dart';
import 'package:willow/src/ui/page_screen.dart';

import 'globals.dart';

class CoreApp extends StatefulWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  _CoreAppState createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  late PageDataBloc _pageDataBloc;

  @override
  void initState() {
    _pageDataBloc = BlocProvider.of<PageDataBloc>(context)..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final VoidCallback swipeForward = () => _pageDataBloc.forward();
    final VoidCallback swipeBack = () => _pageDataBloc.back();
    final Function submitNewPage =
        (PageModel pageModel) => _pageDataBloc.addPage(pageModel);

    // this helps closes android keyboards
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<PageDataBloc, PageDataState>(
            bloc: _pageDataBloc,
            builder: (BuildContext context, PageDataState state) {
              return state.pageTotal == 0
                  ? Center(child: CircularProgressIndicator())

                  // SO here I build my own Widget but in a "real" project I'd
                  // adapt the page viewer. I really like the way that works.

                  : GestureDetector(
                      onHorizontalDragEnd: (details) {
                        // Swiping in left direction
                        if (details.primaryVelocity! > 0) {
                          swipeForward();
                        } else {
                          swipeBack();
                        }
                      },
                      child: PageScreen(
                        pageModel: state.pageModel,
                        pageTotal: state.pageTotal,
                        pageNum: state.pageNum,
                      ));
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => fullScreenDialog(context, submitNewPage),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
