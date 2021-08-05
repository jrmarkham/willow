part of 'page_data_bloc.dart';

abstract class PageDataEvent extends Equatable {
  const PageDataEvent();
}

class PageDataEventInit extends PageDataEvent {
  @override
  List<Object?> get props => [];
}

class PageDataEventForward extends PageDataEvent {
  @override
  List<Object?> get props => [];
}

class PageDataEventBack extends PageDataEvent {
  @override
  List<Object?> get props => [];
}

class PageDataEventUpdate extends PageDataEvent {
  final int pageNum;
  PageDataEventUpdate(this.pageNum);
  @override
  List<Object?> get props => [pageNum];
}


class PageDataEventAddPage extends PageDataEvent {
  final PageModel pageModel;
  PageDataEventAddPage(this.pageModel);
  @override
  List<Object?> get props => [pageModel];
}