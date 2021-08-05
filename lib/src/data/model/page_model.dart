import 'package:equatable/equatable.dart';

class PageModel extends Equatable {
  final String title;
  final String subtitle;
  final String body;
  final String url;

  PageModel(
      {required this.title,
      required this.subtitle,
      required this.body,
      required this.url});

  factory PageModel.fromJson(dynamic json) {
    return PageModel(
        title: json['title'],
        subtitle: json['subtitle'],
        body: json['body'],
        url: json['url']);
  }

  @override
  List<Object?> get props => [title, subtitle, body, url];
}

// some place holder data for loading
PageModel initPageModel() =>
    PageModel(title: '', subtitle: '', body: '', url: '');
