import 'package:willow/src/data/model/page_model.dart';
import 'package:willow/src/globals.dart';

abstract class BasePageService {
  // GENERAL
  List<PageModel> getPageData();
}

class PageService extends BasePageService {
  // static singleton
  static final PageService _instance = PageService.internal();
  factory PageService() => _instance;
  PageService.internal();


 List<PageModel> getPageData() => Globals.localization?['pages'] ==
      null ? [] : _parseLocalData();

  List<PageModel> _parseLocalData() {
    final List<dynamic> pageDataJson = Globals.localization?['pages'] as List;
   return  pageDataJson.map((pageJson) => PageModel.fromJson(pageJson))
       .toList();
  }

}