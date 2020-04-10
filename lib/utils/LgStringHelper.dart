
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'PlatformViewVerticalGestureRecognizer.dart';
class LgStringHelper {

  static setWebviewFromurl(String url) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      gestureRecognizers: [
        Factory(() => PlatformViewVerticalGestureRecognizer()),
      ].toSet(),
    );
  }

  static setWebviewFromstring(String url) {
    return  WebView(
        initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      gestureRecognizers: [
        Factory(() => PlatformViewVerticalGestureRecognizer()),
      ].toSet(),
        onWebViewCreated: (WebViewController webViewController) {
          webViewController.loadUrl( Uri.dataFromString(
           url,
           mimeType: 'text/html',
           encoding: Encoding.getByName('utf-8')
       ).toString());

        },
    );
  }

}