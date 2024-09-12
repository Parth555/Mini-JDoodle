import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/code_editor_bloc.dart';

class OutputBottomSheet extends StatelessWidget {
  final BuildContext mContext;

  const OutputBottomSheet(this.mContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeEditorBloc, CodeEditorState>(
      bloc: mContext.read<CodeEditorBloc>(),
      builder: (BuildContext context, CodeEditorState state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          padding: const EdgeInsets.all(25),
          child: Text(
            'Output:\n${state.output}',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        );
      },
    );
  }
}
