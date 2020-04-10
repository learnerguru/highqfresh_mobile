import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    String url = selectedUrl;
    if (url.toLowerCase().endsWith("pdf")) {
      url="http://drive.google.com/viewerng/viewer?embedded=true&url=" + selectedUrl;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
      initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}