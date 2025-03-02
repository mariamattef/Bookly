import 'package:booklyapp/Features/web_view/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookView extends StatelessWidget {
  final String previewUrl; 

  const BookView({required this.previewUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const TitleWidget(),
      ),
      body: SfPdfViewer.network(previewUrl),
    );
  }
}
