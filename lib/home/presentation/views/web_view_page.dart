import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/export.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({required this.util, super.key});
  final Utilities util;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(util.key),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(util.value),
          ),
      ),
    );
  }
}
