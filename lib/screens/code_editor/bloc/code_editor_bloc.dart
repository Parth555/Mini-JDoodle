import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../service/jdoodle_auth.dart';
import '../../../service/web_socket_service.dart';
import '../../../utils/constant.dart';

part 'code_editor_event.dart';

part 'code_editor_state.dart';

class CodeEditorBloc extends Bloc<CodeEditorEvent, CodeEditorState> {
  late final WebSocketService? _webSocketService;

  WebViewController webViewController = WebViewController();

  CodeEditorBloc() : super(CodeEditorState(code: '', language: Constant.languages[0])) {
    on<LanguageChangedEvent>(_onLanguageChanged);
    on<CodeChangedEvent>(_onCodeChanged);
    on<ExecuteCodeEvent>(_onExecuteCode);
    on<WebSocketOutputEvent>(_onWebSocketOutput);

    _initializeWebSocket();
  }

  void _initializeWebSocket() async {
    List<LanguageVersion> list =  Constant().parseTable();
    for(var item in list){
      print('${item.sNo} : ${item.language} : ${item.languageCode} : ${item.version} : ${item.versionIndex}');
    }
    // _webSocketService = WebSocketService();
    // _webSocketService!.output.listen((output) {
    //   add(WebSocketOutputEvent(output));
    // });
  }

  FutureOr<void> _onLanguageChanged(LanguageChangedEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(language: event.language));
  }

  FutureOr<void> _onCodeChanged(CodeChangedEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(code: event.code));
  }

  Future<void> _onExecuteCode(ExecuteCodeEvent event, Emitter<CodeEditorState> emit) async {
    final token = await JDoodleAuth.getAuthToken(Constant.clientId, Constant.clientSecret);
    _initializeWebSocketWithJavaScript(token,state.code,state.language.toLowerCase());
    // _webSocketService!.sendCode(state.code, state.language, 0, token); // VersionIndex is hardcoded for now
  }

  FutureOr<void> _onWebSocketOutput(WebSocketOutputEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(output: event.output));
  }

  @override
  Future<void> close() {
    _webSocketService!.close();
    return super.close();
  }

  Future<void> _initializeWebSocketWithJavaScript(String token, String code, String language) async {
    final editorHtml = await rootBundle.loadString('assets/web_socket.html');
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..addJavaScriptChannel(
        'fromJavaScript',
        onMessageReceived: (JavaScriptMessage message) {
          print('message.message : ${message.message}');
          add(WebSocketOutputEvent(message.message));
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) async {
            // After loading, inject the token and code into JavaScript
            await webViewController.runJavaScript("startJDoodleSession('$token', '$code', '$language','0');");
          },
        ),
      )
      ..setOnConsoleMessage((onConsoleMessage){
        print('onConsoleMessage.message : ${onConsoleMessage.message}');
      })
      ..loadRequest(Uri.dataFromString(editorHtml, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
  }
}
