import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/programing_language.dart';
import 'bloc/code_editor_bloc.dart';

class LanguageSelectionBottomSheet extends StatelessWidget {
  final BuildContext mContext;

  const LanguageSelectionBottomSheet(this.mContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<CodeEditorBloc, CodeEditorState>(
        bloc: mContext.read<CodeEditorBloc>(),
        builder: (context, state) {
          return Column(
            children: [
              // Dropdown button to select language
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Select Language',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  InkWell(
                    onTap: (){
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

              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  value: programmingLanguages.where((language) => language.name == state.language).first,
                  items: programmingLanguages.map((language) {
                    return DropdownMenuItem(
                      value: language,
                      child: Text(language.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    Version v = programmingLanguages
                        .where((language) => language.name == value!.name)
                        .first
                        .versions
                        .map((toElement) => toElement).first;
                    mContext.read<CodeEditorBloc>().add(LanguageChangedEvent(value!));
                    mContext.read<CodeEditorBloc>().add(LanguageVersionChangedEvent(v));
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: WidgetStateProperty.all(6),
                      thumbVisibility: WidgetStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Language version',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 10),
              CustomRadioButton(
                elevation: 0,
                unSelectedColor: Theme.of(context).canvasColor,
                shapeRadius: 20,
                buttonLables: programmingLanguages
                    .where((language) => language.name == state.language)
                    .first
                    .versions
                    .map((toElement) => toElement.version)
                    .toList(),
                buttonValues:
                    programmingLanguages.where((language) => language.name == state.language).first.versions.map((toElement) => toElement).toList(),
                defaultSelected: programmingLanguages
                    .where((language) => language.name == state.language)
                    .first
                    .versions
                    .map((toElement) => toElement).toList()[state.selectedLanguageIndex],
                buttonTextStyle:
                    const ButtonTextStyle(selectedColor: Colors.white, unSelectedColor: Colors.black, textStyle: TextStyle(fontSize: 16)),
                radioButtonValue: (value) {
                  mContext.read<CodeEditorBloc>().add(LanguageVersionChangedEvent(value));
                },
                autoWidth: true,
                enableShape: true,
                enableButtonWrap: true,
                wrapAlignment: WrapAlignment.start,
                selectedColor: Theme.of(context).primaryColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
