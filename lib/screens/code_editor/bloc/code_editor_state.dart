part of 'code_editor_bloc.dart';

class CodeEditorState extends Equatable {
  final String code;
  final String language;

  const CodeEditorState({required this.code, required this.language});

  CodeEditorState copyWith({String? code, String? language}) {
    return CodeEditorState(
      code: code ?? this.code,
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [code, language];
}
