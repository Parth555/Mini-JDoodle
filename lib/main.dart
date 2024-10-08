import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdoodle/screens/code_editor/bloc/code_editor_bloc.dart';

import 'database/object_box.dart';
import 'screens/code_editor/code_editor_screen.dart';
import 'theme/app_theme.dart';
import 'utils/preference.dart';
/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await Preference().instance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: BlocProvider(
        create: (context) => CodeEditorBloc(),
        child:  CodeEditorScreen(),
      ),
    );
  }
}
