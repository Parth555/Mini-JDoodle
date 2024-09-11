part of 'code_editor_bloc.dart';

class CodeEditorState extends Equatable {
  final String code;
  final String language;
  final String output;

  const CodeEditorState({required this.code, required this.language,this.output = ''});

  CodeEditorState copyWith({String? code, String? language, String? output}) {
    return CodeEditorState(
      code: code ?? this.code,
      language: language ?? this.language,
      output: output ?? this.output,
    );
  }

  @override
  List<Object> get props => [code, language, output];
}
