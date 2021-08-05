import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:willow/src/data/model/page_model.dart';
import 'package:willow/src/data/services/page_data_service.dart';

part 'page_data_event.dart';
part 'page_data_state.dart';

class PageDataBloc extends Bloc<PageDataEvent, PageDataState> {
  PageDataBloc() : super(PageDataStateInitial(null));


  late List<PageModel> list;
  final BasePageService _pageService = PageService();
  @override
  Stream<PageDataState> mapEventToState(
    PageDataEvent event,
  ) async* {

    debugPrint ('event ${event.toString()}');

    if (event is PageDataEventInit) {
      list = _pageService.getPageData();
      add(PageDataEventUpdate(0));
    }

    if (event is PageDataEventForward) {
      final int pageNum = state.pageNum + 1 == state.pageTotal ? 0 : state
          .pageNum + 1;
      add(PageDataEventUpdate(pageNum));

    }


    if (event is PageDataEventBack) {
      final int pageNum = state.pageNum - 1 < 0 ? state.pageTotal - 1 : state.pageNum - 1;
      add(PageDataEventUpdate(pageNum));
    }

    if(event is PageDataEventAddPage) {
      list.add(event.pageModel);
      final int pageNum = list.length - 1;
      add(PageDataEventUpdate(pageNum));
    }

    if(event is PageDataEventUpdate) {
      final PageModel model = list[event.pageNum];
      yield PageDataStateUpdate(state, pageModel: model, pageNum: event.pageNum, pageTotal: list.length);
    }
  }

  void init() => add(PageDataEventInit());
  void forward() => add(PageDataEventForward());
  void back() => add(PageDataEventBack());
  void addPage(PageModel pageModel) => add(PageDataEventAddPage(pageModel));
}
