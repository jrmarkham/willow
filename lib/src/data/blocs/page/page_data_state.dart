part of 'page_data_bloc.dart';

abstract class PageDataState extends Equatable {
  final PageModel pageModel;
  final int pageNum;
  final int pageTotal;
  PageDataState(PageDataState? state, {
    PageModel? pageModel,
    int? pageNum,
    int? pageTotal,
}): this.pageModel = pageModel ?? state?.pageModel ?? initPageModel(),
    this.pageNum = pageNum ?? state?.pageNum ?? 0,
        this.pageTotal = pageTotal ?? state?.pageTotal ?? 0;

  @override
  List<Object> get props => [pageModel];
}

class PageDataStateInitial extends PageDataState {
  PageDataStateInitial(PageDataState? state) : super(state);
  @override
  List<Object> get props => [];
}

class PageDataStateUpdate extends PageDataState {
  final PageDataState state;
  final PageModel pageModel;
  final int pageNum;
  final int pageTotal;

  PageDataStateUpdate(this.state, {
    required this.pageModel,
    required this.pageNum,
    required this.pageTotal,
  }):super(state);

  @override
  List<Object> get props => [state, pageModel, pageNum, pageTotal];
}
