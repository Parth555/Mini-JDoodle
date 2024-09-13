import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../database/models/program.dart';
import '../utils/constant.dart';
import '../utils/preference.dart';

class MonacoEditor extends StatefulWidget {
  final String language;
  final String code;
  final Program? program;
  final Function(String) onCodeChanged;

  const MonacoEditor({super.key, required this.language, required this.code, required this.onCodeChanged, required this.program});

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
      webViewController.runJavaScript('setCode("")');
    }
    if (oldWidget.program != widget.program) {
      // _updateMonacoLanguage(widget.language.toLowerCase());
      final escapedCode = widget.code.replaceAll('\n', '').replaceAll('"', '\\"');
      webViewController.runJavaScript('setCode("$escapedCode")');
    }
  }

  void _updateMonacoLanguage(String language) {
    // Update the language in Monaco Editor dynamically
    print("_updateMonacoLanguage : $language");
    Future.delayed(const Duration(milliseconds: 500), () {
      webViewController.runJavaScript('setLanguageCode("$language")');
    });

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
          onPageFinished: (String url) async {
// Wait for the editor to be ready
            webViewController.runJavaScript('document.addEventListener("editorReady", function() { });');
            webViewController.runJavaScript('document.dispatchEvent(new Event("editorReady"));');

           String firstCode =  '''public class MyClass { \n public static void main(String args[]) { \nSystem.out.println("Hello, World!"); \n} \n}''';
            // Set the code in Monaco Editor

             // await Future.delayed(Duration(seconds: 2));
            if(Preference.shared.getString(Preference.selectedLanguage)==null) {
              final escapedCode = firstCode.replaceAll('\n', '').replaceAll('"', '\\"'); // Escape newlines and quotes
              print(escapedCode);
              Preference.shared.setString(Preference.selectedLanguage,'Java');
              Preference.shared.setString(Preference.selectedLanguageCODE,'java');
              Preference.shared.setString(Preference.currantProgram,escapedCode);
              Preference.shared.setInt(Preference.selectedLanguageIndex,0);
              webViewController.runJavaScript('setCode("$escapedCode")');
            }else{
              final escapedCode = Preference.shared.getString(Preference.currantProgram)!.replaceAll('\n', '').replaceAll('"', '\\"');
              print('escapedCode :;;;;;;;;;;;;;;;;; $escapedCode');
              print('escapedCode :;;;;;;;;;;;;;;;;; ${Preference.shared.getString(Preference.currantProgram)}');
              webViewController.runJavaScript('setCode("$escapedCode")');
            }
           _updateMonacoLanguage(Preference.shared.getString(Preference.selectedLanguageCODE) ?? 'java'.toLowerCase());
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