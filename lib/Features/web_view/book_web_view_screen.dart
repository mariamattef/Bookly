import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookView extends StatefulWidget {
  final String webUrl;
  final String title;
  const BookView({super.key, required this.webUrl, required this.title});

  @override
  BookViewState createState() => BookViewState();
}

class BookViewState extends State<BookView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.webUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor, title: Text(widget.title)),
      body: WebViewWidget(controller: _controller),
    );
  }
}






// import 'package:booklyapp/Features/web_view/widgets/title_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class BookView extends StatelessWidget {
//   final String previewUrl; 

//   const BookView({required this.previewUrl, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: const TitleWidget(),
//       ),
//       body: SfPdfViewer.network(previewUrl),
//     );
//   }
// }
