part of 'code_editor_bloc.dart';

enum CodeEditorStatus {
  initial,
  loading,
  success,
}

extension CodeEditorStatusX on CodeEditorStatus {
  bool get isInitial => this == CodeEditorStatus.initial;

  bool get isLoading => this == CodeEditorStatus.loading;

  bool get isSuccess => this == CodeEditorStatus.success;
}

class CodeEditorState extends Equatable {
  final String code;
  final String language;
  final String selectedLanguageCode;
  final int selectedLanguageIndex;
  final String output;
  final CodeEditorStatus codeEditorStatus;
  final Program? selectedProgramForEdit;

  const CodeEditorState({
    required this.code,
    this.codeEditorStatus = CodeEditorStatus.initial,
    this.language = 'Java',
    this.output = '',
    this.selectedLanguageCode = 'java',
    this.selectedLanguageIndex = 0,
    this.selectedProgramForEdit,
  });

  CodeEditorState copyWith({
    String? code,
    String? language,
    String? output,
    String? selectedLanguageCode,
    CodeEditorStatus? codeEditorStatus,
    int? selectedLanguageIndex,
    Program? selectedProgramForEdit,
  }) {
    return CodeEditorState(
      code: code ?? this.code,
      language: language ?? this.language,
      output: output ?? this.output,
      codeEditorStatus: codeEditorStatus ?? this.codeEditorStatus,
      selectedLanguageCode: selectedLanguageCode ?? this.selectedLanguageCode,
      selectedLanguageIndex: selectedLanguageIndex ?? this.selectedLanguageIndex,
      selectedProgramForEdit: selectedProgramForEdit ?? this.selectedProgramForEdit,
    );
  }

  @override
  List<Object?> get props => [
        code,
        language,
        output,
        selectedLanguageCode,
        selectedLanguageIndex,
        codeEditorStatus,
        selectedProgramForEdit,
      ];
}
