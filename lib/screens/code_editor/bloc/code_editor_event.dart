part of 'code_editor_bloc.dart';

abstract class CodeEditorEvent extends Equatable {
  const CodeEditorEvent();

  @override
  List<Object> get props => [];
}

class CodeChangedEvent extends CodeEditorEvent {
  final String code;

  const CodeChangedEvent(this.code);

  @override
  List<Object> get props => [code];
}

class LanguageChangedEvent extends CodeEditorEvent {
  final String language;

  const LanguageChangedEvent(this.language);

  @override
  List<Object> get props => [language];
}
