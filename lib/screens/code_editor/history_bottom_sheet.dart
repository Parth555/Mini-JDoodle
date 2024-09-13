import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdoodle/database/models/program.dart';
import 'package:jdoodle/utils/constant.dart';

import '../../main.dart';
import 'bloc/code_editor_bloc.dart';

class HistoryBottomSheet extends StatelessWidget {
  final BuildContext mContext;

  const HistoryBottomSheet(this.mContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Program History',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear_rounded,
                  ),
                ),
                const SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 10),
            StreamBuilder<List<Program>>(
                stream: objectBox.getPrograms(),
                builder: (context, snapshot) => ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: _itemBuilder(snapshot.data ?? []))),
          ],
        ));
  }

  Container Function(BuildContext, int) _itemBuilder(List<Program> programList) => (BuildContext context, int index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(2, 2),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        // onTap: () => objectBox.removeNote(notes[index].id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: const BoxDecoration(color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    '${programList[index].language}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: programList[index].code!));
                  },
                  icon: const Row(
                    children: [
                      Icon(
                        color: purpleColor,
                        Icons.copy_outlined,
                      ),
                      SizedBox(width: 2),
                      Text('Copy'),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop;
                    mContext.read<CodeEditorBloc>().add(SetProgramForEditEvent(programList[index]));
                  },
                  icon: const Row(
                    children: [
                      Icon(
                        color: purpleColor,
                        Icons.edit,
                      ),
                      SizedBox(width: 2),
                      Text('Edit'),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    mContext.read<CodeEditorBloc>().add(DeleteDataEvent(programList[index]));
                  },
                  color: errorColor,
                  icon: const Row(
                    children: [
                      Icon(Icons.delete_forever),
                      SizedBox(width: 2),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Input : ',
                  style: TextStyle(color: primaryColor, fontSize: 18),
                ),
                Expanded(
                  child: Text(
                    programList[index].code ?? '',
                    maxLines: 100,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Output : ',
                  style: TextStyle(color: primaryMaterialColor, fontSize: 18),
                ),
                Expanded(
                  child: Text(
                    programList[index].output ?? '',
                    maxLines: 100,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 16,
                      color: successColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Added on ${programList[index].dateFormat}',
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      );
}
