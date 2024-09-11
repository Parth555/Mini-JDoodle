import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdoodle/utils/constant.dart';

import '../../service/jdoodle_web_socket.dart';
import '../../widgets/monaco_editor.dart';
import 'bloc/code_editor_bloc.dart';

class CodeEditorScreen extends StatelessWidget {
  CodeEditorScreen({super.key});

  final JDoodleWebSocket _jdoodleWebSocket = JDoodleWebSocket();


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
                items: Constant.languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () async {
                  context.read<CodeEditorBloc>().add(ExecuteCodeEvent());
                  // Trigger code execution via JDoodle API
                  // await _jdoodleWebSocket.connect(Constant.clientId, Constant.clientSecret);
                  // //
                  // _jdoodleWebSocket.sendCode(
                  //     language: state.language.toLowerCase(), clientId: Constant.clientId, clientSecret: Constant.clientSecret, code: state.code);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: MonacoEditor(
                  language: state.language,
                  code: state.code,
                  onCodeChanged: (code) {
                    context.read<CodeEditorBloc>().add(CodeChangedEvent(code));
                  },
                ),
              ),
              if (state.output.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Output:\n${state.output}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
