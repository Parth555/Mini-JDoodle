import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdoodle/utils/constant.dart';

import '../../database/models/program.dart';
import '../../models/programing_language.dart';
import '../../service/jdoodle_web_socket.dart';
import '../../widgets/alert_dialog_widget.dart';
import '../../widgets/monaco_editor.dart';
import 'bloc/code_editor_bloc.dart';
import 'history_bottom_sheet.dart';
import 'language_selection_bottom_sheet.dart';
import 'output_bottom_sheet.dart';

class CodeEditorScreen extends StatelessWidget {
  CodeEditorScreen({super.key});

  final JDoodleWebSocket _jdoodleWebSocket = JDoodleWebSocket();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CodeEditorBloc, CodeEditorState>(
      listener: (context, state) {
        if (state.codeEditorStatus.isLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialogWidget(),
          );
        }
        if (state.codeEditorStatus.isSuccess) {
          Navigator.pop(context);
          _showPlayBottomSheet(context);
          Program program = Program(
            code:  state.code,
            output:  state.output,
            language:  state.language,
            languageCode:  state.selectedLanguageCode,
            languageCodeIndex:  state.selectedLanguageIndex,
          );
          context.read<CodeEditorBloc>().add(AddDataEvent(program));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('JDoodle Code Editor'),
            actions: [
              Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Language : ${state.language}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: MonacoEditor(
                  program: state.selectedProgramForEdit,
                  language: state.selectedLanguageCode,
                  code: state.code,
                  onCodeChanged: (code) {
                    context.read<CodeEditorBloc>().add(CodeChangedEvent(code));
                  },
                ),
              ),

            ],
          ),
          bottomNavigationBar:
          BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: primaryColor,
            onTap: (index){
              if(index==0){
                _showLanguageSelectionBottomSheet(context);
              }if(index==1){
                _showHistoryBottomSheet(context);
              }
            },
            // currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: 'Change Language',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              label: const Text(
                'Run',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              icon: const Icon(Icons.play_circle,size: 40,),
               onPressed: () {
                 context.read<CodeEditorBloc>().add(ExecuteCodeEvent());

               }),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        );
      },
    );
  }
  void _showLanguageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>   LanguageSelectionBottomSheet(context),
    );
  }

  void _showPlayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => OutputBottomSheet(context),
    );
  }
  void _showHistoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled:true,
      context: context,
      builder: (_) => HistoryBottomSheet(context),
    );
  }
}
