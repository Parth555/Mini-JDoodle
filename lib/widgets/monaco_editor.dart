import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/constant.dart';
import '../utils/preference.dart';

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
    print("_updateMonacoLanguage : $language");
    webViewController.runJavaScript('setLanguageCode("$language")');
    webViewController.runJavaScript('setCode("")');
    // webViewController.runJavaScript('setCode("print(Helol)")');
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
            _updateMonacoLanguage(Preference.shared.getString(Preference.selectedLanguage) ?? 'Java'.toLowerCase());
           String firstCode =  '''
public class AddNumbers {
  public static void main(String[] args) {
    int num1 = 5, num2 = 10, sum;
    sum = num1 + num2;
    System.out.println(“Sum of ” + num1 + ” and ” + num2 + ” is: ” + sum);
 }
}''';
            // Set the code in Monaco Editor
            final escapedCode = firstCode.replaceAll('\n', '\\n').replaceAll('"', '\\"'); // Escape newlines and quotes


            if(Preference.shared.getString(Preference.selectedLanguage)==null) {
              print(firstCode);
              webViewController.runJavaScript('setCode("$escapedCode")');
            }

          },
        ),
      )
      ..setOnConsoleMessage((onConsoleMessage) {
        print('onConsoleMessage.message : ${onConsoleMessage.message}');
      })
      ..loadRequest(Uri.dataFromString(editorHtml, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
    setState(() {});
  }
}