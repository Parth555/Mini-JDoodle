import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/programing_language.dart';
import '../../../service/jdoodle_auth.dart';
import '../../../service/web_socket_service.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';

part 'code_editor_event.dart';

part 'code_editor_state.dart';

class CodeEditorBloc extends Bloc<CodeEditorEvent, CodeEditorState> {
  late final WebSocketService? _webSocketService;

  WebViewController webViewController = WebViewController();

  CodeEditorBloc()
      : super(CodeEditorState(
            codeEditorStatus: CodeEditorStatus.initial,
            code: Preference.shared.getString(Preference.currantProgram)??'public class MyClass { \n public static void main(String args[]) { \nSystem.out.println("Hello, World!"); \n} \n}',
            language: Preference.shared.getString(Preference.selectedLanguage) ?? 'Java',
            selectedLanguageCode:Preference.shared.getString(Preference.selectedLanguageCODE) ?? 'java',
            selectedLanguageIndex: Preference.shared.getInt(Preference.selectedLanguageIndex) ?? 0)) {
    on<LanguageChangedEvent>(_onLanguageChanged);
    on<LanguageVersionChangedEvent>(_onLanguageVersionChanged);
    on<CodeChangedEvent>(_onCodeChanged);
    on<ExecuteCodeEvent>(_onExecuteCode);
    on<WebSocketOutputEvent>(_onWebSocketOutput);

    // _initializeWebSocket();
  }

  void _initializeWebSocket() async {
    // _webSocketService = WebSocketService();
    // _webSocketService!.output.listen((output) {
    //   add(WebSocketOutputEvent(output));
    // });
  }

  FutureOr<void> _onLanguageChanged(LanguageChangedEvent event, Emitter<CodeEditorState> emit) {
    Preference.shared.setString(Preference.selectedLanguage, event.language.name);
    Preference.shared.setString(Preference.selectedLanguageCODE, event.language.languageCode);
    emit(state.copyWith(language: event.language.name, selectedLanguageCode: event.language.languageCode));
  }

  FutureOr<void> _onLanguageVersionChanged(LanguageVersionChangedEvent event, Emitter<CodeEditorState> emit) {
    Preference.shared.setInt(Preference.selectedLanguageIndex, event.version.index);
    emit(state.copyWith(selectedLanguageIndex: event.version.index));
  }

  FutureOr<void> _onCodeChanged(CodeChangedEvent event, Emitter<CodeEditorState> emit) {
    final escapedCode = event.code.replaceAll('\n', ''); // Escape newlines and quotes

    print("escapedCode1 $escapedCode" );
    print("escapedCode1 ${event.code}" );
    Preference.shared.setString(Preference.currantProgram,escapedCode);
    emit(state.copyWith(code: event.code));
  }

  Future<void> _onExecuteCode(ExecuteCodeEvent event, Emitter<CodeEditorState> emit) async {
    emit(state.copyWith(codeEditorStatus: CodeEditorStatus.loading));
    final token = await JDoodleAuth.getAuthToken(Constant.clientId, Constant.clientSecret);
    _initializeWebSocketWithJavaScript(token,state.code,state.selectedLanguageCode,state.selectedLanguageIndex);
    // _webSocketService!.sendCode(state.code, state.language, 0, token); // VersionIndex is hardcoded for now
  }

  FutureOr<void> _onWebSocketOutput(WebSocketOutputEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(codeEditorStatus: CodeEditorStatus.success,output: event.output));
  }

  @override
  Future<void> close() {
    _webSocketService!.close();
    return super.close();
  }

  Future<void> _initializeWebSocketWithJavaScript(String token, String code, String language, int selectedLanguageIndex) async {
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
            print('onPageStarted.message : ');
          },
          onPageFinished: (String url) async {
            // After loading, inject the token and code into JavaScript
            print('onPageFinished.message : $code');
            final escapedCode = code.replaceAll('\n', '').replaceAll('"', '\\"'); // Escape newlines and quotes
            await webViewController.runJavaScript('startJDoodleSession("$token", "$escapedCode", "$language","$selectedLanguageIndex");');
          },
        ),
      )
      ..setOnConsoleMessage((onConsoleMessage) {
        print('onConsoleMessage.message : ${onConsoleMessage.message}');
        // if(onConsoleMessage.message.contains('Error')){
        //   add(WebSocketOutputEvent(onConsoleMessage.message));
        // }
      })
      ..loadRequest(Uri.dataFromString(editorHtml, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
  }
}
