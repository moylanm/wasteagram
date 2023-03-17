import 'package:flutter/material.dart';
import 'package:wasteagram/screens/entry_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      home: const EntryListScreen(),
    );
  }
}