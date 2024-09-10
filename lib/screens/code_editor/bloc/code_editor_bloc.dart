import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constant.dart';

part 'code_editor_event.dart';
part 'code_editor_state.dart';

class CodeEditorBloc extends Bloc<CodeEditorEvent, CodeEditorState> {
  CodeEditorBloc() : super(CodeEditorState(code: '', language: Constant.languages[0])){
   on<LanguageChangedEvent>(_onLanguageChanged);
   on<CodeChangedEvent>(_onCodeChanged);
  }

  FutureOr<void> _onLanguageChanged(LanguageChangedEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(language: event.language));
  }

  FutureOr<void> _onCodeChanged(CodeChangedEvent event, Emitter<CodeEditorState> emit) {
    emit(state.copyWith(code: event.code));
  }
}
