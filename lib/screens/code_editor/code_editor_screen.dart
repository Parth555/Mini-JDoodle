import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdoodle/utils/constant.dart';

import '../../widgets/monaco_editor.dart';
import 'bloc/code_editor_bloc.dart';

class CodeEditorScreen extends StatelessWidget {
  const CodeEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CodeEditorBloc, CodeEditorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('JDoodle Code Editor'),
            actions: [
              DropdownButton<String>(
                value: state.language,
                onChanged: (String? newValue) {
                  context.read<CodeEditorBloc>().add(LanguageChangedEvent(newValue!));
                },
                items: Constant.languages
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  // Trigger code execution via JDoodle API
                },
              ),
            ],
          ),
          body: MonacoEditor(
            language: state.language,
            code: state.code,
            onCodeChanged: (code) {
              context.read<CodeEditorBloc>().add(CodeChangedEvent(code));
            },
          ),
        );
      },
    );
  }
}