import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:willow/src/data/model/page_model.dart';

class PageScreen extends StatelessWidget {
  final PageModel pageModel;
  final int pageNum;
  final int pageTotal;
  final Key? key;

  const PageScreen(
      {required this.pageModel,
      required this.pageNum,
      required this.pageTotal,
      this.key})
      : super(key: key);

  // static stateless widget for displaying content
  // run all data off of state data that passed in from page bloc
  // needs styling

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TITLE
                    AutoSizeText(pageModel.title,
                        style: TextStyle(fontSize: 30), maxLines: 1),
                    SizedBox(height: 8.0),
                    // SUBTITLE
                    AutoSizeText(pageModel.subtitle,
                        style: TextStyle(fontSize: 15.0), maxLines: 1),
                    SizedBox(height: 8.0),
                    // // IMAGE
                    Container(
                        width: 300,
                        height: 300,
                        child: Image.network(pageModel.url)),
                    SizedBox(height: 8.0),
                    // // BODY
                    Container(
                      width: 350.0,
                      height: 150.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                          child: Text(pageModel.body,
                              style: TextStyle(fontSize: 20))),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(child: Text('Page $pageNum of $pageTotal '))
          ],
        ),
      ),
    );
  }
}
