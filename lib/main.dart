import 'package:api_practice/provider/providers.dart';
import 'package:api_practice/screens/bloc_screen.dart';
import 'package:api_practice/screens/title_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rv;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderNotifier>(create: (_) => ProviderNotifier()),
  ],
      child: const rv.ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  OpeningScreen(),
    );
  }
}


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ProviderNotifier>(create: (_) => ProviderNotifier()),
];