part of 'code_editor_bloc.dart';

class CodeEditorState extends Equatable {
  final String code;
  final String language;
  final String selectedLanguageCode;
  final int selectedLanguageIndex;
  final String output;

  const CodeEditorState({required this.code,  this.language = 'Java', this.output = '', this.selectedLanguageCode = 'java', this.selectedLanguageIndex = 0});

  CodeEditorState copyWith({String? code, String? language, String? output, String? selectedLanguageCode, int? selectedLanguageIndex}) {
    return CodeEditorState(
      code: code ?? this.code,
      language: language ?? this.language,
      output: output ?? this.output,
      selectedLanguageCode: selectedLanguageCode ?? this.selectedLanguageCode,
      selectedLanguageIndex: selectedLanguageIndex ?? this.selectedLanguageIndex,
    );
  }

  @override
  List<Object> get props => [code, language, output, selectedLanguageCode, selectedLanguageIndex];
}
