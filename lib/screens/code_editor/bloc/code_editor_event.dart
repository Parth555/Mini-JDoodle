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
  final ProgrammingLanguage language;

  const LanguageChangedEvent(this.language);

  @override
  List<Object> get props => [language];
}

class LanguageVersionChangedEvent extends CodeEditorEvent {
  final Version version;

  const LanguageVersionChangedEvent(this.version);

  @override
  List<Object> get props => [version];
}

class ExecuteCodeEvent extends CodeEditorEvent {}

class WebSocketOutputEvent extends CodeEditorEvent {
  final String output;

  const WebSocketOutputEvent(this.output);

  @override
  List<Object> get props => [output];
}

class AddDataEvent extends CodeEditorEvent {
  final Program program;

  const AddDataEvent(this.program);

  @override
  List<Object> get props => [program];
}

class SetProgramForEditEvent extends CodeEditorEvent {
  final Program program;

  const SetProgramForEditEvent(this.program);

  @override
  List<Object> get props => [program];
}

class DeleteDataEvent extends CodeEditorEvent {
  final Program program;

  const DeleteDataEvent(this.program);

  @override
  List<Object> get props => [program];
}
