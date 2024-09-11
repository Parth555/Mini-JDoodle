import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/constant.dart';

class MonacoEditor extends StatefulWidget {
  final String language;
  final String code;
  final Function(String) onCodeChanged;

  const MonacoEditor({super.key, required this.language, required this.code, required this.onCodeChanged});

  @override
  State<MonacoEditor> createState() => _MonacoEditorState();
}

class _MonacoEditorState extends State<MonacoEditor> {
  WebViewController webViewController = WebViewController();
  @override
  void initState() {
    super.initState();
    inItController();
    _updateMonacoLanguage(Constant.languages[0].toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: webViewController,
    );
  }

  @override
  void didUpdateWidget(covariant MonacoEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update Monaco Editor language if it has changed
    if (oldWidget.language != widget.language) {
      _updateMonacoLanguage(widget.language.toLowerCase());
    }
  }

  void _updateMonacoLanguage(String language) {
    // Update the language in Monaco Editor dynamically
    webViewController.runJavaScript('monaco.editor.setModelLanguage(editor.getModel(), "$language");');

  }


  Future<void> inItController() async {
    final editorHtml = await rootBundle.loadString('assets/editor.html');
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..addJavaScriptChannel(
        'CodeChanged',
        onMessageReceived: (JavaScriptMessage message) {
          widget.onCodeChanged(message.message);
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) {
          },
        ),
      )
      ..loadRequest(Uri.dataFromString(editorHtml, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    setState(() {});
  }
}